FROM ubuntu:latest
ADD ./ssl /ssl
ADD ./setup /setup
RUN /bin/bash /setup/setup.sh
ADD ./conf/nginx/default /etc/nginx/sites-available/default
VOLUME /var/www/phabricator
ADD ./conf/supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord"]
