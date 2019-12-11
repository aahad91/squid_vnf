#!/bin/bash
date > /tngbench_share/stop.txt

/usr/sbin/apache2ctl -D FOREGROUND &

echo "Apache VNF started ..."
