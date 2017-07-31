FROM php:7.1-fpm

RUN apt-get update \
    && apt-get upgrade -y

# Install Softwares, Libraries
USER root
RUN apt-get install -y \
    curl \
    libmemcached-dev \
    libz-dev \
    libpq-dev \
    libjpeg-dev \
    libpng12-dev \
    libfreetype6-dev \
    libssl-dev \
    libmcrypt-dev \
    git \
    zip \
    unzip

# Install PHP Extensions
USER root
RUN docker-php-ext-install \
    pdo \
    pdo_pgsql \
    pdo_mysql \
    mcrypt \
    pgsql \
    opcache \
    bcmath \
    zip
RUN docker-php-ext-configure gd \
        --enable-gd-native-ttf \
        --with-jpeg-dir=/usr/lib \
        --with-freetype-dir=/usr/include/freetype2 \
    && docker-php-ext-install gd

# Install PHP Extension MongoDb
USER root
RUN pecl install mongodb \
    && docker-php-ext-enable mongodb

# Setup Application
USER root
RUN mkdir -p /var/www/app
VOLUME /var/www/app

WORKDIR /var/www/app

COPY . ./

# Fix Permissions
RUN usermod -u 1000 www-data \
    && chown -R www-data:www-data /var/www/app/var/cache \
    && chown -R www-data:www-data /var/www/app/var/logs

# Clean up
USER root
RUN apt-get clean \
    && rm -rf \
        /var/lib/apt/lists/* \
        /tmp/* \
        /var/tmp/* 
