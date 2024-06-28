#!/bin/bash
######## update / upgrade ########
# update
sudo apt update

# upgrade
sudo apt upgrade -y

######## mount the ebs volume ########

# directory to mount
sudo mkdir -p /mnt/data

# build the filesystem
sudo mkfs -t ext4 /dev/xvdf

# mount the volume
sudo mount /dev/xvdf /mnt/data

# mount on boot
sudo echo "/dev/xvdf   /mnt/data   ext4   defaults,nofail   0   2" | sudo tee -a /etc/fstab

######## install mysql ########
sudo apt-get install mysql-server

# acess mysql
sudo mysql

# Update permissions
ALTER USER 'root'@'localhost' IDENTIFIED WITH 'mysql_native_password' BY '<your-new-root-password>';

# Reread permissions
FLUSH PRIVILEGES;

# exit mysql
exit
