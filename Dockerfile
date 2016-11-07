FROM ubuntu:16.04
MAINTAINER paulo.suderio@gmail.com <Paulo Suderio>

RUN apt-get update && apt-get upgrade -y
RUN apt-get -y install curl

RUN cd /opt &&  curl -L 'http://download.oracle.com/otn/java/jdk/7u80-b15/jdk-7u80-linux-x64.tar.gz' -H 'Cookie: oraclelicense=accept-securebackup-cookie; gpw_e24=Dockerfile' | tar -xz

ENV JAVA_HOME /opt/jdk1.7.0_80

RUN ln -s /opt/jdk1.7.0_80/bin/* /usr/local/bin/

RUN apt-get -y install git maven ant unzip

RUN git clone https://github.com/suderio/java-repl.git && \
    cd java-repl && \
    ant

CMD java -jar build/artifacts/javarepl-dev.build.jar


