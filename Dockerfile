# 1️⃣ Base PHP con CLI
FROM php:8.2-cli

# 2️⃣ Installa dipendenze di sistema
RUN apt-get update && apt-get install -y \
    unzip git libzip-dev mariadb-client \
    && docker-php-ext-install pdo_mysql \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 3️⃣ Installa Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 4️⃣ Imposta la cartella di lavoro
WORKDIR /var/www

# 5️⃣ Copia solo i file di Composer per usare la cache
COPY composer.json composer.lock ./

# 6️⃣ Installa le dipendenze PHP senza eseguire scripts
RUN composer install --no-dev --no-scripts --optimize-autoloader

# 7️⃣ Copia tutto il progetto (incluso artisan)
COPY . .

# 8️⃣ Esegui gli script di post-installazione ora che artisan esiste
RUN php artisan key:generate
RUN php artisan config:clear
#RUN php artisan cache:clear

# 9️⃣ Espone la porta 8000
EXPOSE 8000

# 10️⃣ Comando di avvio
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
