FROM debian:jessie

RUN apt-get update && \
  apt-get install -y php5-cli php5-curl php5-mysqlnd php5-mongo php5-xdebug

COPY php_additional.ini /etc/php5/cli/conf.d/

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["php", "-a"]
