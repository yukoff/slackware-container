#!/bin/sh
set -x
set -e

user=${SUDO_USER:-${USER}}
LATEST="14.2"
VERSIONS="13.37 14.0 14.1 14.2 current"

for version in ${VERSIONS} ; do
  make VERSION=${version}
  make VERSION=${version} clean
  docker tag ${user}/slackware-base-32bit:${version} ${user}/slackware-32bit:${version}
done
docker tag ${user}/slackware-base-32bit:${LATEST} ${user}/slackware-32bit:latest
