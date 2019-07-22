FROM ubuntu:latest

RUN apt-get -y update

RUN DEBIAN_FRONTEND=noninteractive \
apt-get install -y squid && rm -rf /var/lib/apt/lists/*

COPY blocklist.acl /etc/squid

COPY blockkeywords.lst /etc/squid

COPY squid.conf /etc/squid/squid.conf

EXPOSE 3128

ENTRYPOINT squid restart && bash
 

