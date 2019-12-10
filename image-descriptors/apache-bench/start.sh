#!/bin/bash
date > /tngbench_share/start.txt
while true;
do
 case "$1"
 in
 mp.input) shift;INPUT=$1;;
 mp.output) shift;OUTPUT=$1;;
 vnf) shift;VNF=$1;;
 esac
 shift;
 if [ "$1" = "" ]; then
  break
 fi
done
echo "Apache Bench started ..."
ab -c 9999 -r -t 60 -n 99999999 -e /tngbench_share/ab_logs2.csv -s 60 -k -X $VNF:3128 https://www.google.com/
