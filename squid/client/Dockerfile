FROM ubuntu:latest

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
    software-properties-common \
    aptitude \
    wget \
    net-tools \
    iproute2 \
    inetutils-ping \
		curl \
		iperf3 \
		iperf \
    siege \
		httperf \
    apache2-utils \
    hping3 \
		polygraph \
    python \
    python-yaml \
    python
WORKDIR /

ADD start.sh start.sh
RUN chmod +x start.sh
ADD stop.sh stop.sh
RUN chmod +x stop.sh
ADD process_ab_results.py process_ab_results.py
ADD log_intf_statistics.py log_intf_statistics.py

RUN mkdir /tngbench_share
CMD /bin/bash
