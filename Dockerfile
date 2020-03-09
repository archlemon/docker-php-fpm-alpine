FROM php:7.3-fpm-alpine

ENV DEPS "autoconf freetype-dev g++ git libtool libzip-dev make unzip"

RUN set -ex \
    && apk --no-cache add $DEPS postgresql-dev icu-dev \
    && docker-php-ext-install \
        opcache \
        pdo \
        pdo_pgsql \
        intl \
        bcmath \
        pcntl \
    && apk del --no-cache $DEPS
