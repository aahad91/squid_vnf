#!/bin/bash

pkill squid
sleep 2
python ./log_intf_statistics.py /tngbench_share/result.yml
cp /var/log/squid/access.log /tngbench_share/
chown ubuntu /tngbench_share/access.log
date > /tngbench_share/stop.txt
