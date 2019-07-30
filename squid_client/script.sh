#!/bin/bash
ab -n 5000 -c 10 -X 172.20.0.2:3128 http://www.google.com/ > test1.txt
ab -n 5000 -c 5 -X 172.20.0.2:3128 http://www.facebook.com/ > test2.txt
