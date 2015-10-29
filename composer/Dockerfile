FROM steadyserv/php

RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

RUN php -r "readfile('https://getcomposer.org/installer');" | \
  php -- --install-dir=/usr/local/bin --filename=composer

VOLUME ["/srv"]
WORKDIR /srv

ENTRYPOINT ["composer", "--ansi"]
