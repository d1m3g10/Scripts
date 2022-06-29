#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"


#Custom Aliases
alias cat='/usr/bin/bat'
alias catn='/usr/bin/cat'
alias catnl='/usr/bin/bat --paging=never'
alias lk='lsd -l --group-dirs=first'


#ExtractPorts
function extractPorts(){
	ip_maquina=$(cat allPorts | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort -u)
	puertos_ab=$(cat allPorts | grep -oP '\d{1,5}/open' | awk '{print $1}' FS="/" | xargs | tr ' ' ',')
	echo -e "\n\t${greenColour}[-] Puertos abiertos de la máquina "$ip_maquina": ${endColour}${grayColour}"$puertos_ab"${endColour}"
	echo $puertos_ab | tr -d '\n' | xclip -sel clip
	echo -e "\t${greenColour}[-] Puertos copiados en la clipboard. ${endColourColour}"

}

#Kill python http server on the in port 80
function killPythonServerHTTP80(){
	kill -9 $(lsof -ti tcp:80)
}


function selectorVentana(){
        xprop WM_CLASS
}

#Volvemos a la pantalla de bloqueo sin salirnos de la sesión del usuario
function screenlock(){
        dm-tool lock
}

function upvup(){
        nmcli con up VPN\ a\ UPV -a
}

function upvdown(){
        nmcli con down VPN\ a\ UPV -a
}
