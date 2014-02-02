#!/bin/bash
set -xe
apt-get install -qy supervisor
mkdir -p /var/run/nginx
mkdir -p /var/log/supervisor
