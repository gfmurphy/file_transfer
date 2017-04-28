FROM debian:jessie
MAINTAINER George Murphy <gmurphy@decisiv.com>

# - Install packages
# - OpenSSH needs /var/run/sshd to run
# - Remove generic host keys, entrypoint generates unique keys
# RUN apt-get update && \
#     apt-get -y install openssh-server && \
#     rm -rf /var/lib/apt/lists/* && \
#     mkdir -p /var/run/sshd && \
#     rm -f /etc/ssh/ssh_host_*key*

RUN apt-get update \
    && apt-get install -y --no-install-recommends vsftpd openssh-server \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/vsftpd/empty \
 && mkdir -p /var/run/sshd \
 && mkdir -p /var/ftp \
 && cp /etc/vsftpd.conf /etc/vsftpd.orig \
 && cp /etc/hosts.allow /etc/hosts.allow.orig

COPY etc/hosts.allow /etc/  
COPY etc/vsftpd.conf /etc/
COPY entrypoint /

EXPOSE 21 21100-21105

ENTRYPOINT ["/entrypoint"]

