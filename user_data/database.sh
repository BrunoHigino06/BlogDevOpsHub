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

# Firewall configuration
sudo ufw default allow incoming
sudo ufw default allow outgoing
sudo ufw enable

######## install mysql ########
sudo apt-get install -y mysql-server

# acess mysql
sudo mysql

# Update permissions
ALTER USER 'root'@'localhost' IDENTIFIED WITH 'mysql_native_password' BY '<password_here>';

# Reread permissions
FLUSH PRIVILEGES;

# exit mysql
exit

# Restart
shutdown -r
