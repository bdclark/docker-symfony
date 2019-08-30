
Run composer without installing PHP locally:
```
docker run --rm -it \
  -e USER_ID=$(id -u) \
  -e GROUP_ID=$(id -g) \
  -v $(pwd):/srv \
  -v ~/.ssh:/composer/.ssh \
  -v ~/.composer:/composer/.composer \
  steadyserv/composer install
```

Composer using specific SSH key, known_hosts, auth.json, etc:
```
docker run --rm -it \
  -e USER_ID=$(id -u) \
  -e GROUP_ID=$(id -g) \
  -v $(pwd):/srv \
  -v /path/to/ssh_key:/composer/.ssh/id_rsa \
  -v /path/to/known_hosts:/composer/.ssh/known_hosts \
  -v /path/to/cachedir:/composer/.composer/cache \
  -v /path/to/auth.json:/composer/.composer/auth.json \
  steadyserv/composer install
```

```
curl -XGET https://raw.githubusercontent.com/docker/docker/master/contrib/completion/bash/docker > `brew --prefix`/etc/bash_completion.d/docker
```

