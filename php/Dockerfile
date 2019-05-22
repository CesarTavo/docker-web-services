FROM php:7.2.7-fpm-alpine3.7

# Install dependencies
RUN apk update; \
    apk upgrade;

RUN docker-php-ext-install pdo pdo_mysql  mysqli
