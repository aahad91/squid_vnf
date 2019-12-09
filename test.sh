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
      --run-command 'useradd -s /bin/bash -d /home/ubuntu -m ubuntu' \
      --run-command 'cd /home/ubuntu/' \
      --upload squid.conf:/etc/squid/squid.conf \
      --upload start.sh:/start.sh \
      --upload stop.sh:/stop.sh \
      --run-command 'chown ubuntu start.sh' \
      --run-command 'chown ubuntu stop.sh' \
      --run-command 'chmod +x start.sh' \
      --run-command 'chmod +x stop.sh' \
      --mkdir /tngbench_share

# custom ubuntu-cloud-image for apache-bench
wget http://cloud-images.ubuntu.com/xenial/current/xenial-server-cloudimg-amd64-disk1.img

virt-customize -a xenial-server-cloudimg-amd64-disk1.img.1 \
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
