#!/bin/sh

# create runtime dirs
mkdir -p /run/php-fpm
chown www:www /run/php-fpm || true
# start nginx (daemonized)
/usr/sbin/nginx

# run php-fpm in foreground (replace shell)
exec /usr/sbin/php-fpm -F
