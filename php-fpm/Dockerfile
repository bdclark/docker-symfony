FROM debian:jessie

RUN apt-get update && \
  apt-get install -y php5-fpm php5-curl php5-mysqlnd php5-mongo php5-xdebug && \
  php5dismod xdebug

RUN php -r "readfile('https://getcomposer.org/installer');" | \
  php -- --install-dir=/usr/local/bin --filename=composer

COPY php_additional.ini /etc/php5/fpm/conf.d/
COPY php_additional.ini /etc/php5/cli/conf.d/
COPY php-fpm.conf /etc/php5/fpm/

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 9000
CMD ["php5-fpm"]
