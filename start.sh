#!/bin/bash
if ! grep -q "eula=true" eula.txt; then
    echo "Do you agree to the Mojang EULA available at https://account.mojang.com/documents/minecraft_eula ?"
    read -N 1 -p "[y/n] " EULA
    if [ "$EULA" = "y" ]; then
        echo "eula=true" > eula.txt
        echo
    fi
fi
java -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -Xmx12G -Xms12G -jar forge-1.7.10-10.13.4.1614-1.7.10-universal.jar nogui
