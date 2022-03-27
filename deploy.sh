#!/usr/bin/env bash

WORKDIR=/opt/reddit
mkdir $WORKDIR

exec &>deploy.log

if ! which git
  then apt install -y git
fi

cd $WORKDIR && git clone -b monolith https://github.com/express42/reddit.git .
cd $WORKDIR && bundle install && puma -d

IP=$(wget -O - -q icanhazip.com)
PORT=$(ps aux | grep puma | awk -F'[:)]' '{print $5}')

echo "Deploy finished"
echo "Your add is available on the $IP:$PORT"
