FROM debian:jessie
MAINTAINER George Murphy <gmurphy@decisiv.com>

RUN apt-get update \
    && apt-get install -y --no-install-recommends vsftpd openssh-server \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/vsftpd/empty \
 && mkdir -p /var/run/sshd \
 && mkdir -p /var/ftp \
 && cp /etc/vsftpd.conf /etc/vsftpd.orig \
 && cp /etc/hosts.allow /etc/hosts.allow.orig \
 && rm -f /etc/ssh/ssh_host_*key*

COPY etc/hosts.allow /etc/  
COPY etc/vsftpd.conf /etc/
COPY etc/ssh/* /etc/ssh/
COPY entrypoint /

EXPOSE 21-22 21100-21105

ENTRYPOINT ["/entrypoint"]

