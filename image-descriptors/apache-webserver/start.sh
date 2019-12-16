#!/bin/bash
date > /tngbench_share/start.txt

/usr/sbin/apache2ctl -D FOREGROUND &

echo "Apache VNF started ..."
