#!/usr/bin/env bash


while pgrep -a apt; do echo 'Waiting for apt...'; sleep 1; done

sudo apt update
sudo apt install -y ruby-full ruby-bundler build-essential
