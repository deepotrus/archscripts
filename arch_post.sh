#!/bin/bash

# Create swap file
su # go root
cd /root
dd if=/dev/zero of=/swapfile bs=1M count=2048 status=progress #creates 2GB swapfile
chmod 600 /swapfile #read write permissions
mkswap /swapfile

cp /etc/fstab /etc/fstab.bak
echo '/swapfile none swap sw 0 0' | tee -a /etc/fstab
cat /etc/fstab
free -m #you have no swap
mount -a
swapon -a
free -m #now you have swap

# Timezone
timedatectl list-timezones # q to exit
timedatectl set-timezone Europe/Rome
systemctl enable systemd-timesyncd

# Hostname
#hostnamectl set-hostname mypc
#vim /etc/hosts 127.0.0.1 localhost and new line 127.0.1.1 mypc
#hostnamectl
