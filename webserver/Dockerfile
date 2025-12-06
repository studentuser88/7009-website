# Webserver Dockerfile
# Multi-stage build for webserver
FROM alpine:3.18 AS builder
RUN apk add --no-cache nginx php php-fpm php-mysqlnd

FROM alpine:3.18
# Install only runtime essentials; removed SSH for security
RUN apk add --no-cache nginx php php-fpm php-mysqlnd && \
    rm -rf /var/cache/apk/*

# Create non-root user
RUN addgroup -g 1001 www && \
    adduser -D -u 1001 -G www www

COPY --from=builder /usr/sbin/nginx /usr/sbin/
COPY --from=builder /usr/bin/php* /usr/bin/
COPY webfiles/ /usr/share/nginx/html
COPY configfiles/nginx.conf /etc/nginx/nginx.conf
COPY configfiles/php.ini /etc/php.ini
COPY configfiles/www.conf /etc/php-fpm.d/www.conf
COPY configfiles/docker-entrypoint.sh /

# Secure permissions
RUN chown -R www:www /usr/share/nginx/html /var/log/nginx /run && \
    chmod +x /docker-entrypoint.sh

USER www
EXPOSE 80
ENTRYPOINT ["/docker-entrypoint.sh"]

