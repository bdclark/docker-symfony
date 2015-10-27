FROM nginx:latest

COPY default.conf /etc/nginx/conf.d/

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
