FROM ubuntu:latest

RUN apt-get update   #if error try with --fix-missing
RUN apt-get install -y \
    software-properties-common \
    wget \
    net-tools \
    iproute2 \
    inetutils-ping \
		curl \
    apache2 \
    python \
    python-yaml \
    python

ADD www /var/www/site
ADD apache.conf /etc/apache2/sites-enabled/000-default.conf
WORKDIR /

ADD start.sh start.sh
RUN chmod +x start.sh
ADD stop.sh stop.sh
RUN chmod +x stop.sh
ADD log_intf_statistics.py log_intf_statistics.py
RUN mkdir /tngbench_share

CMD /bin/bash
