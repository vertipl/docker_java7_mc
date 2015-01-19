FROM   ubuntu:14.04

ENV    DEBIAN_FRONTEND noninteractive

RUN    apt-get --yes update; apt-get --yes upgrade; apt-get --yes install software-properties-common

# Install Java.
RUN \
  apt-get update && \
  apt-get install --yes openjdk-7-jre && \
  rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
  
#RUN \
#  apt-get update && \
#  apt-get install --yes oracle-java7-installer
#  rm -rf /var/lib/apt/lists/*
 
#ENV JAVA_HOME /usr/lib/jvm/java-7-oracle  

ADD    ./minecraft/server.properties /usr/local/etc/minecraft/
ADD    ./minecraft/craftbukkit-1.7.2-R0.3.jar /usr/local/etc/minecraft/
ADD    ./scripts/start /start

RUN	   chmod +x /start
RUN	   chmod +x /usr/local/etc/minecraft/craftbukkit-1.7.2-R0.3.jar

expose 25565
volume ["/data"]
cmd    ["/start"]
