FROM nginx:1.25-alpine

WORKDIR /

# Install PHP + dependencies and update packages
RUN apk update && \
    apk add --no-cache php php-fpm php-mysqlnd curl

# Create www user with UID 1001 (Matching permissions)
RUN addgroup -g 1001 www && \
    adduser -D -u 1001 -G www www

# --- COPY FILES ---
COPY webfiles/ /usr/share/nginx/html
COPY configfiles/nginx.conf /etc/nginx/nginx.conf

# FIX: Copy PHP configs to the generic /etc/php path for better version compatibility
COPY configfiles/php.ini /etc/php/php.ini
COPY configfiles/www.conf /etc/php/php-fpm.d/www.conf
COPY configfiles/php-fpm.conf /etc/nginx/conf.d/php-fpm.conf
COPY configfiles/docker-entrypoint.sh /

# --- PERMISSIONS FIXES (CRITICAL) ---

RUN mkdir -p /run/php-fpm && \
    chown -R www:www /usr/share/nginx/html /run/php-fpm

RUN chown -R root:www /var/cache/nginx && \
    chown -R root:www /var/log/nginx && \
    chmod -R 775 /var/cache/nginx && \
    chmod -R 775 /var/log/nginx && \
    chmod +x /docker-entrypoint.sh

EXPOSE 80

ENTRYPOINT ["/docker-entrypoint.sh"]
