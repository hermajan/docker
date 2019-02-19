FROM php:7.1-apache

# System packages
RUN apt-get clean && apt-get update && apt-cache search php-mysql && apt-get install --fix-missing -y \
    gnupg \
    sudo \
    vim \
    imagemagick \
    git \
    memcached \
    libmemcached-tools \
    libmemcached-dev \
    libpng-dev \
    libjpeg62-turbo-dev \
    mysql-client \
    zip \
    wget \
    linux-libc-dev \
    libssl-dev \
    zlib1g-dev \
    libicu-dev \
    g++

# Install Memcached
RUN curl -L -o /tmp/memcached.tar.gz "https://github.com/php-memcached-dev/php-memcached/archive/v3.1.3.tar.gz" \
    && mkdir -p /usr/src/php/ext/memcached \
    && tar -C /usr/src/php/ext/memcached -zxvf /tmp/memcached.tar.gz --strip 1 \
    && docker-php-ext-configure memcached \
    && docker-php-ext-install memcached \
    && rm /tmp/memcached.tar.gz

# PHP extensions
RUN a2enmod rewrite ssl
RUN docker-php-ext-configure gd --with-jpeg-dir=/usr/include/
RUN docker-php-ext-configure intl
RUN docker-php-ext-install \
    gd \
    mbstring \
    zip \
    pdo \
    pdo_mysql \
    mysqli \
    intl
