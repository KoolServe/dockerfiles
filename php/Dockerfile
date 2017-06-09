FROM php:7.0-fpm-alpine
RUN apk add --no-cache \
    autoconf \
    binutils \
    curl-dev \
    freetype-dev \
    g++ \
    gcc \
    gmp-dev \
    libcurl \
    libjpeg-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    libxml2-dev \
    make \
    postfix

RUN docker-php-ext-install -j "$(getconf _NPROCESSORS_ONLN)" \
    curl \
    exif \
    fileinfo \
    gmp \
    json \
    mbstring \
    opcache \
    pdo_mysql \
    posix \
    xml \
    zip \

    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j "$(getconf _NPROCESSORS_ONLN)" gd

RUN curl -o redis.zip https://codeload.github.com/phpredis/phpredis/zip/b8f3ceebca63328b5fbd2bd3d9722b7600e476b7 \
    && unzip redis.zip \
    && mv phpredis-b8f3ceebca63328b5fbd2bd3d9722b7600e476b7 phpredis \
    && cd phpredis && phpize \
    && ./configure \
    && make -j "$(getconf _NPROCESSORS_ONLN)" \
    && make install \
    && rm -rf redis.zip phpredis \
    && echo "extension=redis.so" > /usr/local/etc/php/conf.d/docker-php-ext-redis.ini

COPY php.ini /usr/local/etc/php/

RUN rm -rf /var/cache/apk/*
