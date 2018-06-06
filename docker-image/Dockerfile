FROM openjdk:8u171-jdk-stretch

USER root

RUN addgroup --gid 1000 minecraft 
RUN adduser --shell /bin/bash --uid 1000 --gid 1000 --home /home/minecraft minecraft 
RUN chown -R minecraft /home/minecraft

VOLUME ["/minecraft-data"]

EXPOSE 25565
EXPOSE 33434

#WORKDIR /home/minecraft

ENV VERSION "1.12.2"

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

USER minecraft

WORKDIR /minecraft-data
CMD ["java", "-Xmx1024M", "-Xms1024M", "-jar", "/home/minecraft/server.jar", "nogui"]
