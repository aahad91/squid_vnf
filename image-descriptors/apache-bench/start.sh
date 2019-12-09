#!/bin/bash
date > /tngbench_share/start.txt
echo "Apache Bench started ..."
ab -c 9999 -r -t 60 -n 99999999 -e /tngbench_share/ab_logs2.csv -s 60 -k -X $0:3128 https://www.google.com/
