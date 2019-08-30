#!/bin/bash
set -e

if [ "$PHP_XDEBUG" = true ]; then
    php5enmod xdebug
else
    php5dismod xdebug
fi

# rm -rf /srv/app/cache/*

# run php command as www-data
if [ "$1" = 'php' ]; then
	exec gosu www-data "$@"
fi

exec "$@"
