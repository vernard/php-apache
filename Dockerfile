FROM php:8.3-apache

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
    libzip-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libcurl4-openssl-dev \
    libxml2-dev \
    zip \
    vim \
    nano \
    npm

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Enable mod_rewrite
RUN a2enmod rewrite

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql zip gd curl xml
