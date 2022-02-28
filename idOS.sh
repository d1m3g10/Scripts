#!/bin/bash
if [ $1 ]; then
	dir_ip=$1
	comando=$(ping -c 1 $dir_ip)
	status=$?
	completado=0
	if [ "$status" -eq "$completado" ]; then
		ttl=$(ping -c 1 $dir_ip | grep "ttl" | awk '{print $6}' FS=" " | awk '{print $2}' FS="=")
		linux=64
		if [ "$ttl" -gt "$linux" ]; then
			echo "Windows"
		else
			echo "Linux"
		fi
	else
		echo -e "\n\t[-] El equipo no está activo."
	fi
else
	echo -e "\n\t[-] Hay que indicar la dirección ip del equipo."
fi
