#FROM   ubuntu:14.04
#
#ENV    DEBIAN_FRONTEND noninteractive
#
#RUN    apt-get --yes update; apt-get --yes upgrade; apt-get --yes install software-properties-common
#RUN    apt-get --yes install default-jre
#
#ADD    ./minecraft/server.properties /usr/local/etc/minecraft/
#ADD    ./minecraft/craftbukkit-1.7.2-R0.3.jar /usr/local/etc/minecraft/
#ADD    ./scripts/start /start
#
#RUN	   chmod +x /start
#RUN	   chmod +x /usr/local/etc/minecraft/craftbukkit-1.7.2-R0.3.jar
#
#expose 25565
#volume ["/data"]
#cmd    ["/start"]
#
#
#
FROM   ubuntu:14.04

ENV    DEBIAN_FRONTEND noninteractive

RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list; echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886

RUN apt-get --yes update; apt-get --yes upgrade; apt-get --yes install software-properties-common

RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections

RUN apt-get install oracle-java7-installer: apt-get install oracle-java7-set-default

ADD    ./minecraft/server.properties /usr/local/etc/minecraft/
ADD    ./minecraft/craftbukkit-1.7.2-R0.3.jar /usr/local/etc/minecraft/
ADD    ./scripts/start /start

RUN	   chmod +x /start
RUN	   chmod +x /usr/local/etc/minecraft/craftbukkit-1.7.2-R0.3.jar

expose 25565
volume ["/data"]
cmd    ["/start"]
