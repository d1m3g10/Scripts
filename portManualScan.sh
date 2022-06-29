#!/bin/bash

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"


if [ $1 ]; then
        ip=$1
        echo -e "\n${redColour}[*] Escaneando puertos...${endColour}\n"
        for port in $(seq 1 65535); do
                timeout 1 bash -c "echo '' > /dev/tcp/$ip/$port" 2>/dev/null && echo -e "\t[-] Puerto $port - ABIERTO" &
        done
        echo -e "\n${redColour}[*] El escaneo ha terminado.${endColour}"
        exit 0
else
        echo -e "\n\t${redColour}[*] Hay que indicar la dirección IP de la máquina${endColour}"
fi
