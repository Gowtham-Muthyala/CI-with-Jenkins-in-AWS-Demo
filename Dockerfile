FROM ubuntu:16.04
FROM tomcat:8.0

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

RUN apt-get install -y default-jre
# RUN apt-get install -y tomcat8

ADD ./project/target /usr/local/tomcat/webapps
RUN pwd && ls

ENTRYPOINT ["catalina.sh","run"]
