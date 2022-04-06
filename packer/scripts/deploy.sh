#!/usr/bin/env bash

WORKDIR=/opt/reddit
mkdir $WORKDIR

if ! which git
  then apt install -y git
fi

cd $WORKDIR && git clone -b monolith https://github.com/express42/reddit.git .
cd $WORKDIR && bundle install

cp /tmp/reddit.service /etc/systemd/system/reddit.service

sudo systemctl daemon-reload
sudo systemctl start reddit.service
sudo systemctl enable reddit.service
sudo systemctl status reddit.service
