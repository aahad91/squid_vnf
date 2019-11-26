#!/bin/bash
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
