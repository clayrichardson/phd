#!/bin/bash
set -xe
/var/www/phabricator/bin/storage upgrade --force --trace
/usr/bin/supervisord
nice -n 20 sudo -u www-data /var/www/phabricator/bin/phd start
while ( true )
  do
  echo "Detach with Ctrl-p Ctrl-q. Dropping to shell"
  sleep 1
  /bin/bash
done
