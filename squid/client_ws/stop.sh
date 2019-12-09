#! /bin/bash
pkill apache2
sleep 2
cp /var/log/apache2/access.log /tngbench_share/
python ./log_intf_statistics.py /tngbench_share/result.yml
date > /tngbench_share/stop.txt
#date > /mnt/share/stop.txt
