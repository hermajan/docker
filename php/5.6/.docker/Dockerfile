FROM php:5.6-apache

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
    g++ \
    firebird-dev \
    libc-client-dev \
    libkrb5-dev && rm -r /var/lib/apt/lists/*

# Install Memcached
RUN curl -L -o /tmp/memcached.tar.gz "https://github.com/php-memcached-dev/php-memcached/archive/2.2.0.tar.gz" \
    && mkdir -p /usr/src/php/ext/memcached \
    && tar -C /usr/src/php/ext/memcached -zxvf /tmp/memcached.tar.gz --strip 1 \
    && docker-php-ext-configure memcached \
    && docker-php-ext-install memcached \
    && rm /tmp/memcached.tar.gz \
    && service memcached start

# PHP extensions
RUN a2enmod rewrite ssl
RUN docker-php-ext-configure gd --with-jpeg-dir=/usr/include/
RUN docker-php-ext-configure intl
RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl
RUN docker-php-ext-install \
    gd \
    mbstring \
    zip \
    pdo \
    pdo_mysql \
    mysqli \
    intl \
    interbase \
    mysql \
    imap

RUN	service memcached restart
