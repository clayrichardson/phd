#!/bin/bash
 
# Swap file commands from:
# https://www.digitalocean.com/community/articles/how-to-add-swap-on-ubuntu-12-04
 
# Create swapfile
echo "Creating swap file..."
dd if=/dev/zero of=/swapfile bs=1024 count=4096k
 
# Create linux swap area
mkswap /swapfile
 
# Activate the swap file
swapon /swapfile
 
# Display summary
swapon -s
 
# Add entry to fstab
# Notice: running this script multiple times
# will append duplicate entries in fstab
echo "/swapfile none swap sw 0 0" >> /etc/fstab
 
# Set swapiness to 0, so swap is only used when
# physical memory is not available
echo 0 | sudo tee /proc/sys/vm/swappiness
echo vm.swappiness = 0 | sudo tee -a /etc/sysctl.conf
 
# Change ownership, so only root can view
chown root:root /swapfile
chmod 0600 /swapfile
 
# Some useful tools I like to use
# You may omit this line if you wish
apt-get install -y htop git bmon iotop traceroute

\curl -sSL https://get.docker.io
 
# Add the docker group if it doesn't already exist.

getent group docker
if [ $? -ne 0 ] ;
then
  echo "group docker does not exist, adding..."
  sudo groupadd docker
else
  echo "group docker already exists"
fi
# Add the connected user "${USER}" to the docker group.
# Change the user name to match your preferred user.
# You may have to logout and log back in again for
# this to take effect.
sudo gpasswd -a ubuntu docker
# Restart the docker daemon.
sudo service docker restart
 
\curl -sSL https://get.rvm.io | bash -s stable --ruby=1.9.3

