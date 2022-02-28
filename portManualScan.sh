#!/bin/bash

if [ $1 ]; then
	ip=$1
	for port in $(seq 1 65535); do
		timeout 1 bash -c "echo '' > /dev/tcp/$ip/$port" 2>/dev/null && echo "[-] Puerto $port - ABIERTO" &
	done
else
	echo -e "\n\t[-] Hay que indicar la dirección IP de la máquina"
fi
