#!/bin/bash
set -xe
/var/www/phabricator/bin/storage upgrade --force
/usr/bin/supervisord
tail -F /var/log/supervisor/*.log /var/log/nginx/*.log