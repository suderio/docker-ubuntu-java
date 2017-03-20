FROM ubuntu:16.10
MAINTAINER paulo.suderio@gmail.com <Paulo Suderio>

RUN apt-get update
RUN apt-get -y install curl

RUN cd /opt &&  curl -L 'http://download.oracle.com/otn-pub/java/jdk/8u121-b13/jdk-8u121-linux-x64.tar.gz' -H 'Cookie: oraclelicense=accept-securebackup-cookie; gpw_e24=Dockerfile' | tar -xz

ENV JAVA_HOME /opt/jdk1.8.0_121

