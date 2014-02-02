#!/bin/bash
# install script adapted from:
# http://www.phabricator.com/docs/phabricator/article/Installation_Guide.html
# http://www.phabricator.com/rsrc/install/install_ubuntu.sh
set -xe

HAVEPCNTL=`php -r "echo extension_loaded('pcntl');"`
if [ $HAVEPCNTL != "1" ]
then
  echo "Installing pcntl...";
  echo
  apt-get source php5
  PHP5=`ls -1F | grep '^php5-.*/$'`
  (cd $PHP5/ext/pcntl && phpize && ./configure && make && sudo make install)
else
  echo "pcntl already installed";
fi

echo "Install probably worked mostly correctly. Continue with the 'Configuration Guide':";
echo
echo "    http://www.phabricator.com/docs/phabricator/article/Configuration_Guide.html";
echo
echo "You can delete any php5-* stuff that's left over in this directory if you want.";
