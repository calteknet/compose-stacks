#!/bin/sh

chown -R www-data:www-data /var/www/html
exec docker-php-entrypoint "$@"
