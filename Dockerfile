FROM walser/python:latest
MAINTAINER Claudio Walser


RUN apk add --update openssh
ADD entrypoint.sh /usr/local/bin

# ensure key renewal
RUN rm -rf /etc/ssh/ssh_host_rsa_key /etc/ssh/ssh_host_dsa_key

RUN adduser \
   --system \
   --shell /bin/bash \
   --gecos 'User for jumping around' \
   --disabled-password \
   --home /home/jolly \
   jolly


EXPOSE 22
ENTRYPOINT ["entrypoint.sh"]
CMD ["/usr/sbin/sshd","-D"]
