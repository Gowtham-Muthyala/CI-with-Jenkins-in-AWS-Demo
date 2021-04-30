FROM ubuntu:16.04

RUN apt-get update

MAINTAINER GowthaMuthyala

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN apt-get -y install wget
RUN wget https://www-eu.apache.org/dist/tomcat/tomcat-8/v8.5.65/bin/apache-tomcat-8.5.65.tar.gz
RUN tar xvzf apache*.tar.gz
RUN mv apache-tomcat-8.5.65/* /opt/tomcat/.
RUN apt-get -y install default-jdk
RUN java -version
RUN apt-get update

WORKDIR /opt/tomcat/webapps
ADD ./project/target .
RUN pwd && ls

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
