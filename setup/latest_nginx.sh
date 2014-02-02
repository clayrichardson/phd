set -xe
apt-get install -qy python-software-properties
add-apt-repository -y ppa:nginx/stable
apt-get update
apt-get install -qy nginx
nginx -v
