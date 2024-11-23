Shortens the build time needed for containers that I'm using (PHP & Apache).

Usage:
```
# Use the appropriate tag
FROM vernard/php-apache:php8.3

# Set DocumentRoot to /public folder. If you're not using Laravel, change the /public and use whatever is appropriate
ENV APACHE_DOCUMENT_ROOT=/var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# Copy the application code
COPY ./ /var/www/html

# Set the working directory
WORKDIR /var/www/html

# Install project dependencies
RUN composer install && npm install && npm run build

# Set permissions
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache
```