#!/bin/bash
#custom ubuntu-cloud-image for squid vnf
virt-customize -v -a xenial-server-cloudimg-amd64-disk1.img \
      --run-command 'apt-get update' \
      --run-command 'DEBIAN_FRONTEND=noninteractive' \
      --run-command 'apt-get install -y \
                      net-tools \
                      iproute2 \
                      inetutils-ping \
                      iptables \
                      squid3 \
                      curl \
                      python \
                      python-yaml \
                      python3 \
                      python3-pip' \
      --run-command 'cd /' \
      --upload image-descriptors/squid/squid.conf:/etc/squid/squid.conf \
      --upload image-descriptors/squid/start.sh:/start.sh \
      --upload image-descriptors/squid/stop.sh:/stop.sh \
      --run-command 'chmod +x start.sh' \
      --run-command 'chmod +x stop.sh' \
      --mkdir /tngbench_share

# custom ubuntu-cloud-image for apache-bench
mkdir apache-bench
cd apache-bench
wget http://cloud-images.ubuntu.com/xenial/current/xenial-server-cloudimg-amd64-disk1.img

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
      --run-command 'cd /' \
      --upload image-descriptors/apache-bench/start.sh:/start.sh \
      --upload image-descriptors/apache-bench/stop.sh:/stop.sh \
      --run-command 'chmod +x start.sh' \
      --run-command 'chmod +x stop.sh' \
      --mkdir /tngbench_share
