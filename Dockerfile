FROM   dockerfile/java:oracle-java7

ENV    DEBIAN_FRONTEND noninteractive

RUN    apt-get --yes update; apt-get --yes upgrade; apt-get --yes install software-properties-common

ADD    ./minecraft/server.properties /usr/local/etc/minecraft/
ADD    ./minecraft/craftbukkit-1.7.2-R0.3.jar /usr/local/etc/minecraft/
ADD    ./scripts/start /start

RUN	   chmod +x /start
RUN	   chmod +x /usr/local/etc/minecraft/craftbukkit-1.7.2-R0.3.jar

expose 25565
volume ["/data"]
cmd    ["/start"]
