# Welcome to the File Transfer Docker Container

## Table of Contents

1. [Mission](#mission)

## Mission

Provide a docker container that provides SFTP and FTP protocols suitable for running in an integration testing
environment.

The container is entirely influenced by the [sftp](https://github.com/atmoz/sftp) container. In fact it is configured
exactly the same way. Please refer to that project's readme for more details.

In addition this container also provides additional support for the following:

* The FTP protocol
* Stable host keys

## Cavets

This container is intended to be a tool for integration testing. It is *NOT* intended for production use.
