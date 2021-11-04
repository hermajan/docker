FROM php:8.0-apache

# System packages
RUN apt-get clean && apt-get update && apt-cache search php-mysql && apt-get install --fix-missing -y \
    curl libcurl4-openssl-dev \
    default-mysql-client \
    g++ \
    git \
    gnupg \
    imagemagick \
    libfreetype6-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libssl-dev \
    libwebp-dev \
    linux-libc-dev \
    sudo \
    vim \
    wget \
    zip libzip-dev

# Apache
RUN a2enmod rewrite ssl headers

# PHP extensions
RUN docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg --with-webp
RUN docker-php-ext-install \
    curl \
    gd \
    intl \
    mysqli \
    pdo \
    pdo_mysql \
    zip

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

# Node.js and npm
RUN echo "Package: *\nPin: origin deb.nodesource.com\nPin-Priority: 600" > "/etc/apt/preferences.d/nodesource" && sudo apt-cache policy nodejs
RUN rm -rf /var/lib/apt/lists/ && \
    curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -&& \
    apt-get clean && apt-get update && apt-get install -y nodejs && \
    npm install npm@latest -g && \
    npm install gulp-cli -g
