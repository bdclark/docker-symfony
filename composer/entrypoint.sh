#!/bin/bash
set -e

USER_ID=${USER_ID:-0}
GROUP_ID=${GROUP_ID:-0}

groupadd --force --gid $GROUP_ID composer
useradd --non-unique --uid $USER_ID --gid $GROUP_ID --home-dir /composer composer

exec gosu composer composer --ansi "$@"
