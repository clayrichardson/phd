FROM ubuntu:latest

RUN apt-key update
RUN apt-get update 

RUN apt-get install -qy python-software-properties
RUN apt-get install -qy python-software-properties
RUN add-apt-repository -y ppa:nginx/stable
RUN apt-get update
RUN apt-get install -qy nginx supervisor git dpkg-dev php5 php5-mysql php5-gd php5-dev php5-curl php-apc php5-cli php5-json php5-fpm
RUN mkdir -p /var/run/nginx
RUN mkdir -p /var/log/supervisor
RUN mkdir -p /var/nginx/cache/phab

RUN git clone git://github.com/facebook/libphutil.git /var/www/libphutil
RUN git clone git://github.com/facebook/arcanist.git /var/www/arcanist
RUN git clone git://github.com/facebook/phabricator.git /var/www/phabricator


ADD ./ssl /ssl
ADD ./setup /setup

RUN /bin/bash /setup/phabricator.sh

ADD ./conf/nginx/default /etc/nginx/sites-available/default
ADD ./conf/nginx/nginx.conf /etc/nginx/nginx.conf
VOLUME /var/www/phabricator
ADD ./conf/supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
EXPOSE 80/tcp 443/tcp
CMD ["/usr/bin/supervisord", "--nodaemon"]
