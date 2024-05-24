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

######## install ansible ########

# software-properties-common
sudo apt install software-properties-common

# repository
sudo add-apt-repository --yes --update ppa:ansible/ansible

# ansible install
sudo apt install ansible -y

# git install
sudo apt-get install git-all

# download ansible recipes
git clone https://github.com/BrunoHigino06/ansible_recipes.git