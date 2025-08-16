FROM php:8.2-cli

# Installa estensioni e strumenti
RUN apt-get update && apt-get install -y unzip git libzip-dev \
    && docker-php-ext-install pdo_mysql

# Copia Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www
COPY . .

RUN composer install --no-dev --optimize-autoloader

EXPOSE 10000
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=10000"]
