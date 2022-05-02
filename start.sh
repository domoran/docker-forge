#!/bin/bash
if ! grep -q "eula=true" eula.txt; then
    echo "Do you agree to the Mojang EULA available at https://account.mojang.com/documents/minecraft_eula ?"
    read -N 1 -p "[y/n] " EULA
    if [ "$EULA" = "y" ]; then
        echo "eula=true" > eula.txt
        echo
    fi
fi
java -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -Xmx12G -Xms12G -jar ${FORGE_JAR} nogui