FROM steadyserv/php

RUN apt-get update && apt-get install -y php5-fpm && rm -rf /var/lib/apt/lists/*

COPY php_additional.ini /etc/php5/fpm/conf.d/
COPY php-fpm.conf /etc/php5/fpm/

VOLUME ["/srv"]

EXPOSE 9000
CMD ["php5-fpm"]
