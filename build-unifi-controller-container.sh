#!/bin/bash
docker build -t unifi . && \
docker create -p 8080:8080 -p 8181:8181 -p 8443:8443 -p 8843:8843 -p 8880:8880 -p 3478:3478 -v /home/thomas/workspace/Terpon/unifi-config:/var/lib/unifi --name unify_instance -it unifi
