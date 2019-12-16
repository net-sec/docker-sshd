#!/bin/bash

podman build --rm -t net-sec/sshd ./
podman rm -f sshd
podman run -itd \
	-v /home/claudio/.ssh/authorized_keys:/home/jolly/.ssh/authorized_keys \
	-p 2222:22 \
	--name sshd net-sec/sshd
