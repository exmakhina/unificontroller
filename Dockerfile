FROM ubuntu:14.04

RUN echo 'deb http://www.ubnt.com/downloads/unifi/debian unifi5 ubiquiti' > /etc/apt/sources.list.d/ubnt.list

# for Ubiquiti
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv C0A52C50

# Modify /usr/sbin/policy-rc.d in order to be able to start all installed daemons
ADD policy-rc.d /usr/sbin/policy-rc.d

# 1st system update
RUN apt-get update && apt-get upgrade -y

# install/upgrade unifi-controller
RUN apt-get install -y unifi

EXPOSE 8080/tcp 
EXPOSE 8843/tcp 
EXPOSE 6789/tcp 
EXPOSE 27117/tcp 
EXPOSE 3478/udp 
EXPOSE 8881-8882/tcp

# Auto start unfi service, since docker does not support init scripts
ENTRYPOINT service unifi start && tail -F /var/log/unifi/server.log
