#!/bin/bash
set -e

cat << EOF > /etc/nginx/conf.d/00-upstream.conf
upstream php_fpm {
    server $PHP_FPM_PORT_9000_TCP_ADDR:$PHP_FPM_PORT_9000_TCP_PORT;
}
EOF

if [ "$NGINX_ENABLE_DEV" = true ]; then
    sed -i 's/<NGINX_ENV>/(app|app_dev|config)/' /etc/nginx/conf.d/default.conf
else
    sed -i 's/<NGINX_ENV>/app/' /etc/nginx/conf.d/default.conf
fi

if [[ $# -eq 0 ]]; then
    exec nginx -g 'daemon off;'
else
    exec "$@"
fi
