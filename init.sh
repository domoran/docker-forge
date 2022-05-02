#!/bin/bash

CONTAINER_ALREADY_STARTED="/minecraft/eula.txt"
cd /minecraft
if [ ! -e $CONTAINER_ALREADY_STARTED ]; then
  java -jar ${FORGE_INSTALLER} --installServer
  java -jar ${FORGE_JAR}
  echo eula=true > $CONTAINER_ALREADY_STARTED
  cp /install/start.sh ./start.sh
  chmod u+x start.sh

  # /install/serverinstall_4_153 --auto --path /minecraft

  # sed -i -E 's/-Xm([xs])[0-9]+[MG]/-Xm\110G/g' /minecraft/start.sh
  /minecraft/start.sh
else
  /minecraft/start.sh
fi