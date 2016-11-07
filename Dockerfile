FROM suderio/ubuntu-java:8
MAINTAINER paulo.suderio@gmail.com <Paulo Suderio>

RUN apt-get update && apt-get upgrade -y
RUN apt-get -y install hg alsa freetype cups xrender
CMD java -jar build/artifacts/javarepl-dev.build.jar


