
FROM php:8.1-apache

# Enable required Apache modules
RUN a2enmod rewrite proxy proxy_wstunnel

# Install dependencies
RUN apt-get update && apt-get install -y \
    git unzip && \
    docker-php-ext-install sockets

# Install Composer
COPY --from=composer:2.6 /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www/html

# Copy application files
COPY src /var/www/html

# Copy custom Apache configuration
COPY apache.conf /etc/apache2/sites-available/000-default.conf

# Install WebSocket server dependencies
WORKDIR /var/www/html/ws
COPY src/ws/composer.json /var/www/html/ws/composer.json
RUN composer install

