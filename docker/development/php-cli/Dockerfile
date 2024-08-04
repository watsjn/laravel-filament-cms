FROM php:8.3-cli-alpine3.19

RUN docker-php-ext-install pcntl

RUN apk add --no-cache \
    icu-dev \
    libzip-dev \
    postgresql-dev \
    fcgi \
    && docker-php-ext-install intl \
    && docker-php-ext-install zip \
    && docker-php-ext-install pcntl \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo_pgsql

RUN mv $PHP_INI_DIR/php.ini-development $PHP_INI_DIR/php.ini

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/bin --filename=composer --version=2.7.7 --quiet

RUN addgroup -g 1000 app && adduser -u 1000 -G app -s /bin/sh -D app

WORKDIR /app

USER app
