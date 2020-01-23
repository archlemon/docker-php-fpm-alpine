FROM php:7.3-fpm-alpine

ENV DEPS "autoconf freetype-dev g++ git icu-dev imagemagick imagemagick-dev jpegoptim libjpeg-turbo-dev libpng-dev libtool libzip-dev make optipng postgresql-dev unzip"

RUN set -ex \
    && apk --no-cache add $DEPS \
    && docker-php-ext-configure gd \
        --with-gd \
        --with-freetype-dir=/usr/include/ \
        --with-png-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install \
        opcache \
        pdo \
        pdo_pgsql \
        intl \
        gd \
        bcmath \
        pcntl \
    && apk del --no-cache $DEPS
