FROM walser/python:latest
MAINTAINER Claudio Walser

# install openssh and add entrypoint
RUN apk add --update openssh
ADD entrypoint.sh /usr/local/bin

# ensure key renewal
RUN rm -rf /etc/ssh/ssh_host_rsa_key /etc/ssh/ssh_host_dsa_key

# add jolly jumper without password
RUN adduser --disabled-password --shell /bin/bash --gecos "User" jolly; \
    passwd -u jolly;

# copy custom sshd config
COPY sshd_config /etc/ssh/sshd_config

EXPOSE 22
ENTRYPOINT ["entrypoint.sh"]
CMD ["/usr/sbin/sshd", "-D", "-e"]
