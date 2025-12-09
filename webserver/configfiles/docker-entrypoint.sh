#!/bin/sh
set -e

# 1. Dynamic PHP-FPM Binary Detection
# We look for any binary starting with php-fpm inside /usr/sbin
PHP_FPM_BIN=$(ls /usr/sbin/php-fpm* | head -n 1)

if [ -z "$PHP_FPM_BIN" ]; then
    echo "Error: PHP-FPM binary not found."
    exit 1
fi

echo "Found PHP-FPM binary: $PHP_FPM_BIN"

# 2. Start PHP-FPM in the background (-D for daemonize)
# We use -D so the script continues to the next line
$PHP_FPM_BIN -D

# 3. Start Nginx in the foreground
# This keeps the container alive
echo "Starting Nginx..."
nginx -g 'daemon off;'
