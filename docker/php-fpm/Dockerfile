FROM php:7.1-fpm

RUN apt-get update \
    && apt-get upgrade -y

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


# Clean up
USER root
RUN apt-get clean \
    && rm -rf \
        /var/lib/apt/lists/* \
        /tmp/* \
        /var/tmp/* 
