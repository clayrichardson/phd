FROM ubuntu:latest

RUN apt-key update
RUN apt-get update 

RUN apt-get install -qy python-software-properties
RUN apt-get install -qy python-software-properties
RUN add-apt-repository -y ppa:nginx/stable
RUN apt-get update

RUN apt-get install -qy nginx
RUN apt-get install -qy vim
RUN apt-get install -qy supervisor
RUN apt-get install -qy git
RUN apt-get install -qy dpkg-dev
RUN apt-get install -qy php5
RUN apt-get install -qy php5-mysql
RUN apt-get install -qy php5-gd
RUN apt-get install -qy php5-dev
RUN apt-get install -qy php5-curl
RUN apt-get install -qy php-apc
RUN apt-get install -qy php5-cli
RUN apt-get install -qy php5-json
RUN apt-get install -qy php5-fpm

RUN mkdir -p /var/run/nginx
RUN mkdir -p /var/run/php5-fpm
RUN mkdir -p /var/log/supervisor
RUN mkdir -p /var/nginx/cache/phab

RUN git clone git://github.com/facebook/libphutil.git /var/www/libphutil
RUN git clone git://github.com/facebook/arcanist.git /var/www/arcanist
RUN git clone git://github.com/facebook/phabricator.git /var/www/phabricator

RUN sed -i 's/;daemonize = yes/daemonize = no/g' /etc/php5/fpm/php-fpm.conf
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

ADD ./ssl /ssl
ADD ./setup /setup
ADD ./conf/nginx/default /etc/nginx/sites-available/default
ADD ./conf/nginx/nginx.conf /etc/nginx/nginx.conf
ADD ./conf/supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN /bin/bash /setup/phabricator.sh

EXPOSE 80/tcp 443/tcp

CMD ["/usr/bin/supervisord", "--nodaemon"]
