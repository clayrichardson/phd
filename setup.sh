#!/bin/bash

set -ex
 
# Swap file commands from:
# https://www.digitalocean.com/community/articles/how-to-add-swap-on-ubuntu-12-04

if [ $(free | grep -i swap | awk '{print $2}') -eq 0 ]
then
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
fi

# Some useful tools I like to use
# You may omit this line if you wish
apt-get install -y htop git bmon iotop traceroute

curl -sSL https://get.docker.io | bash
 
curl -sSL https://get.rvm.io | bash -s stable --ruby=1.9.3

