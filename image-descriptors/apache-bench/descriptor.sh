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
                      aptitude \
                      wget \
                      curl \
                      iperf3 \
                  		iperf \
                      siege \
                  		httperf \
                      hping3 \
                  		polygraph \
                      apache2-utils \
                      python \
                      python-yaml \
                      python3 \
                      python3-pip' \
      --run-command 'useradd -s /bin/bash -d /home/ubuntu -m ubuntu'\
      --run-command 'cd /home/ubuntu' \
      --upload start.sh:/start.sh \
      --upload stop.sh:/stop.sh \
      --run-command 'chown ubuntu start.sh' \
      --run-command 'chown ubuntu stop.sh' \
      --run-command 'chmod +x start.sh' \
      --run-command 'chmod +x stop.sh' \
      --mkdir /tngbench_share

#OpenStack command
#openstack image create --public --disk-format qcow2 --container-format bare --file xenial-server-cloudimg-amd64-disk1.img apache-bench-ubuntu