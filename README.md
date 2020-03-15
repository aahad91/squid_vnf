[![Build Status](https://travis-ci.com/aahad91/squid_vnf.svg?branch=tng-benchmarking)](https://travis-ci.com/aahad91/squid_vnf)
# squid_vnf
PG-Backflip candidate VNF (Proxy)
## Installation
Step 1: Clone the repo
```bash
git clone https://github.com/aahad91/squid_vnf.git
```

Step 2: Execute the docker-compose.yaml file [note: ensure that docker-compose is installed on your system]
```bash
cd squid_vnf
docker-compose up --build -d
```

Step 3: Check if containers "squidvnf_squid_id" & "squidvnf_client_id" is running
```bash
docker ps -a
```
## Execution
if possible open two terminal to get the real-time visualization of execution.

Execute the following command to get the access logs of squid.
```bash
docker exec -it squidvnf_squid_1_id tail -f /var/log/squid/access.log  #id can checked from docker ps -a container name
```
Execute the following command to start the testing of the squid.
```bash
docker exec -it squidvnf_client_1_id ./script.sh
```
After the requests are completed, testing results can be seen by executing the folloing commands.
```bash
docker exec -it squidvnf_client_1_id cat test1.txt   # www.google.com
docker exec -it squidvnf_client_1_id cat test2.txt   # www.facebbok.com
