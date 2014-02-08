#!/bin/bash
set -xe
/var/www/phabricator/bin/storage upgrade --force --trace
/usr/bin/supervisord
sudo -u www-data /var/www/phabricator/bin/phd start
tail -F /var/log/supervisor/*.log /var/log/nginx/*.log
