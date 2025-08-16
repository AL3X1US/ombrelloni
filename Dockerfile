# Dockerfile
FROM php:8.2-cli

WORKDIR /var/www

COPY composer.json composer.lock ./
RUN apt-get update && apt-get install -y unzip git libzip-dev \
    && docker-php-ext-install pdo_mysql \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

COPY . .

RUN composer install --no-dev --optimize-autoloader

EXPOSE 8000
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
