FROM ubuntu:16.04
# FROM tomcat:8.0

# ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

# RUN apt-get install -y default-jre
# # RUN apt-get install -y tomcat8

# ADD ./project/target /usr/local/tomcat/webapps
# WORKDIR /usr/local/tomcat/webapps
# RUN pwd && ls

# ENTRYPOINT ["catalina.sh","run"]

# FROM centos

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
# RUN curl -O -L https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war
ADD ./project/target .

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
