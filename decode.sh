#!/bin/bash

#Colores
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

trap ctrl_c INT

function ctrl_c(){
	echo -e "${yellowColour} [*] Saliendo... ${endColour}"
	exit 0
}


function banner(){

echo -e "${purpleColour}                                                                 ,,			"
echo -e "      db                               .g8'''bgd               '7MM			"
echo -e "     :MM:                            .dP'     'M                 MM			"
echo -e "    ,V^MM.    '7MMpMMMb.  '7MMpMMMb. dM'       ' ,pW'Wq.    ,M''bMM  .gP'Ya  7Mb,od8	"
echo -e "   ,M  'MM      MM    MM    MM    MM MM         6W'   'Wb ,AP    MM ,M'   Yb  MM'  Â·	"
echo -e "   AbmmmqMA     MM    MM    MM    MM MM.        8M     M8 8MI    MM 8M-----7  MM	"
echo -e "  A'     VML    MM    MM    MM    MM 'Mb.     ,'YA.   ,A9 'Mb    MM YM.    ,  MM	"
echo -e ".AMA.   .AMMA..JMML  JMML..JMML  JMML. ''bmmmd'  'Ybmd9'   'Wbmd'MML.'Mbmmd..JMML.	"
echo -e "											"
echo -e "									by: Dimitar"
echo -e "${endColour}"
}

function decodificarCadena(){
	banner;
	echo $1 | base64 -d
}


function ayuda(){
	banner;
	echo -e "${redColour}"
	echo "	Para decodificar:"
	echo -e "${endColour}"
	echo -e "	${yellowColour}[*] USO:	./decode.sh -d cadenaEncriptada ${endColour}"
	echo " "
	exit 1;
}


	declare -i parameter_enable=0; while getopts ":d:c" arg; do
		case ${arg} in
			d) 	fichero=${OPTARG}
				decodificarCadena $fichero && let parameter_enable+=1;;
			*) echo -e "\n\t Parametro no vÃ¡lido"
		esac
	done


	if [ $parameter_enable -ne 1 ]; then
		ayuda
	fi
