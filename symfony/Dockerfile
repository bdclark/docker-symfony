FROM debian:jessie

# NGINX repo
RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62
RUN echo "deb http://nginx.org/packages/mainline/debian/ jessie nginx" >> /etc/apt/sources.list

ENV NGINX_VERSION 1.9.6-1~jessie

RUN apt-get update && apt-get install -y \
  ca-certificates \
  git \
  nginx=${NGINX_VERSION} \
  php5-cli \
  php5-curl \
  php5-fpm \
  php5-intl \
  php5-mongo \
  php5-mysqlnd \
  php5-xdebug \
  php5-xsl \
  && rm -rf /var/lib/apt/lists/*

RUN php -r "readfile('https://getcomposer.org/installer');" | \
  php -- --install-dir=/usr/local/bin --filename=composer

ENV S6_VERSION v1.16.0.0
ADD https://github.com/just-containers/s6-overlay/releases/download/${S6_VERSION}/s6-overlay-amd64.tar.gz /tmp/
RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C /

COPY etc /etc/
COPY php/php_additional.ini /etc/php5/cli/conf.d/
COPY php/php_additional.ini /etc/php5/fpm/conf.d/

VOLUME ["/srv", "/log"]

EXPOSE 80 443

ENTRYPOINT ["/init"]
