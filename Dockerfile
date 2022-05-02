from openjdk:8-slim as builder

ENV FORGE_VER=1.12.2-14.23.5.2860
ENV FORGE_DOWNLOAD=https://maven.minecraftforge.net/net/minecraftforge/forge/1.12.2-14.23.5.2860/forge-1.12.2-14.23.5.2860-installer.jar
ENV FORGE_INSTALLER=/install/forge-${FORGE_VER}-installer.jar
ENV FORGE_JAR=/minecraft/forge-${FORGE_VER}.jar

RUN apt update && \
    apt install --yes wget unzip

WORKDIR /minecraft

RUN mkdir /install && \
    wget ${FORGE_DOWNLOAD} -O ${FORGE_INSTALLER}

#RUN mkdir /install && \
#    wget https://api.modpacks.ch/public/modpack/4/153/server/linux -O /install/serverinstall_4_153 && \
#    chmod +x /install/serverinstall_4_153

ADD init.sh /install/init.sh
ADD start.sh /install/start.sh

RUN chmod u+x /install/init.sh

CMD ["/install/init.sh"]