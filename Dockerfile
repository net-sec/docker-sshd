FROM walser/python:latest

MAINTAINER Claudio Walser

RUN apk add --update openssh
ADD entrypoint.sh /usr/local/bin

# ensure key renewal
RUN rm -rf /etc/ssh/ssh_host_rsa_key /etc/ssh/ssh_host_dsa_key



EXPOSE 22
ENTRYPOINT ["entrypoint.sh"]
CMD ["/usr/sbin/sshd","-D"]