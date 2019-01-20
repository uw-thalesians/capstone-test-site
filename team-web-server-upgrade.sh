#!/usr/bin/env bash
docker rm --force capstone-test
docker pull spirrochet/capstone-test

TLSCERT="/etc/letsencrypt/live/uw-thalesians.spirrochet.com/fullchain.pem"
TLSKEY="/etc/letsencrypt/live/uw-thalesians.spirrochet.com/privkey.pem"

docker run \
--detach \
--env TLSCERT=$TLSCERT \
--env TLSKEY=$TLSKEY \
--name=capstone-test \
--publish 80:80 \
--publish 443:443 \
--restart=on-failure \
--volume /etc/letsencrypt:/etc/letsencrypt:ro \
spirrochet/capstone-test

#Remove unused images
docker image prune --force
