#!/bin/bash

set -ex

if [ -f /ssl/server.crt ] && [ -f /ssl/server.key ];
then
  echo 'ssl directory contains server.crt & server.key'
  mv /conf/nginx/ssl /etc/nginx/sites-available/ssl
  ln -s /etc/nginx/sites-available/ssl /etc/nginx/sites-enabled/ssl
else
  echo 'ssl directory is empty'
  mv /conf/nginx/default /etc/nginx/sites-available/default
  ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
fi

