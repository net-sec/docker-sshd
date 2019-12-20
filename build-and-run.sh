#!/bin/bash

docker build --rm -t net-sec/sshd ./
docker rm -f sshd
docker run -itd \
  -v /Users/walsercl/.ssh/id_rsa.pub:/home/jolly/.ssh/authorized_keys \
	-p 2222:22 \
	--name sshd net-sec/sshd
