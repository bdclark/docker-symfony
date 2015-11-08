FROM steadyserv/php

RUN apt-get update && \
  apt-get install -y git curl ca-certificates && \
  rm -rf /var/lib/apt/lists/*

RUN php -r "readfile('https://getcomposer.org/installer');" | \
  php -- --install-dir=/usr/local/bin --filename=composer

# grab gosu for easy step-down from root
RUN gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
RUN curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.6/gosu-$(dpkg --print-architecture)" \
  && curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.6/gosu-$(dpkg --print-architecture).asc" \
  && gpg --verify /usr/local/bin/gosu.asc \
  && rm /usr/local/bin/gosu.asc \
  && chmod +x /usr/local/bin/gosu

VOLUME ["/srv"]
WORKDIR /srv

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
