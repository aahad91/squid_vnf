#!/bin/bash

# Set of packages and commands to build apache-bench image
#Step1:
#sudo apt update
#sudo apt-get -y install libguestfs-tools
#export LIBGUESTFS_BACKEND=direct

#Step2:
wget http://cloud-images.ubuntu.com/xenial/current/xenial-server-cloudimg-amd64-disk1.img

#Step3:
#install packages, copy files
# syntax: virt-customize -a [DOWNLOADED_FILE_NAME] --install [LIST_OF_PACKAGES]
#         virt-customize -a [DOWNLOADED_FILE_NAME] --run-command 'apt-get update'
#         virt-customize -a [DOWNLOADED_FILE_NAME] --mkdir [folder_name]
#         virt-customize -a [DOWNLOADED_FILE_NAME] --upload [src-file:dest-file]

#Run with sudo
virt-customize -a xenial-server-cloudimg-amd64-disk1.img \
      --run-command 'apt-get update' \
      --run-command 'DEBIAN_FRONTEND=noninteractive' \
      --run-command 'apt-get install -y \
                      software-properties-common \
                      net-tools \
                      iproute2 \
                      inetutils-ping \
                      iptables \
                      wget \
                      curl \
                      apache2 \
                      python \
                      python-yaml \
                      python3' \
      --run-command 'cd /' \
      --upload start.sh:/start.sh \
      --upload stop.sh:/stop.sh \
      --upload log_intf_statistics.py:/log_intf_statistics.py \
      --run-command 'chmod +x start.sh' \
      --run-command 'chmod +x stop.sh' \
      --mkdir /tngbench_share

#OpenStack command
source /opt/stack/devstack/accrc/admin/admin
openstack image create --public --disk-format qcow2 --container-format bare --file xenial-server-cloudimg-amd64-disk1.img apache-webserver
