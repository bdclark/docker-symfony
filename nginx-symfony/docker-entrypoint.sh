#!/bin/bash
set -e

if [ "$NGINX_ENABLE_DEV" = true ]; then
    sed -i 's/<NGINX_ENV>/(app|app_dev|config)/' /etc/nginx/conf.d/default.conf
else
    sed -i 's/<NGINX_ENV>/app/' /etc/nginx/conf.d/default.conf
fi

exec "$@"
