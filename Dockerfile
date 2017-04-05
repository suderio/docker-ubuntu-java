FROM ubuntu:16.10
MAINTAINER paulo.suderio@gmail.com <Paulo Suderio>

ENV DEBIAN_FRONTEND noninteractive
ENV JAVA_HOME       /usr/lib/jvm/java-8-oracle

## UTF-8
RUN locale-gen en_US.UTF-8
ENV LANG       en_US.UTF-8
ENV LC_ALL     en_US.UTF-8

RUN apt-get update && apt-get dist-upgrade -y

RUN apt-get update
RUN apt-get install -y python-software-properties
RUN apt-get install -y apt-file
RUN apt-file update
RUN apt-get install -y software-properties-common

RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update && \
  echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections && \
  apt-get install -y --no-install-recommends oracle-java8-installer \
  oracle-java8-unlimited-jce-policy oracle-java8-set-default

RUN apt-get -y remove python-software-properties software-properties-common apt-file && \
    apt-get -y autoremove
 
RUN apt-get clean all && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*



