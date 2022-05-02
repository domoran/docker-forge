#!/bin/bash

CONTAINER_ALREADY_STARTED="/minecraft/eula.txt"
cd /minecraft
if [ ! -e $CONTAINER_ALREADY_STARTED ]; then
  java -jar /install/forge-1.7.10-10.13.4.1614-1.7.10-installer.jar --installServer
  java -jar forge-1.7.10-10.13.4.1614-1.7.10-universal.jar
  echo eula=true > /minecraft/eula.txt
  cp /install/start.sh ./start.sh
  chmod u+x start.sh

  # /install/serverinstall_4_153 --auto --path /minecraft

  # sed -i -E 's/-Xm([xs])[0-9]+[MG]/-Xm\110G/g' /minecraft/start.sh
  /minecraft/start.sh
else
  /minecraft/start.sh
fi
