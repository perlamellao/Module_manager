#!/bin/bash
#instalation

install_path="/.modman"
git_path=$(pwd)
fails=0



#color variables
bold="\033[1m"
blink="\033[5m"
under="\033[4m"
normal="\033[0m"
green="\033[32m"
red="\033[31m"
blue="\033[34m"




function ins1() {
	

	clear
	cp -r $git_path/main $install_path/
	cd 	$install_path/modules
	chmod +x dns_spoof android_payload	

}
function checkins() {

	clear
	echo -e "$green   ____ _               _    _                   "
	echo "  / ___| |__   ___  ___| | _(_)_ __   __ _             "
	echo " | |   | '_ \ / _ \/ __| |/ / | '_ \ / _\ |            "
	echo " | |___| | | |  __/ (__|   <| | | | | (_| |  _   _   _ "
	echo "  \____|_| |_|\___|\___|_|\_\_|_| |_|\__/ | (_) (_) (_)"
	echo "                                     	|___/    "
	echo -e "$normal"
	#metasploit
	hash msfconsole
	if [[ $? -eq 0 ]]; then
		echo -e "$normal \n\n[$green ✔$normal ]$red Metasploit Esta Instalado"
	else
		echo -e "$normal [$green x$normal ]$red Metasploit No Esta Instalado Y Es Necesario"
		fails=$((fails + 1))
	fi
	sleep 0.7
	#msfvenom
	hash msfvenom
	if [[ $? -eq 0 ]]; then
		echo -e "$normal \n\n[$green ✔$normal ]$red Msfvenom Esta Instalado"
	else
		echo -e "$normal [$green x$normal ]$red Msfvenom No Esta Instalado Y Es Necesario"
		fails=$((fails + 1))
	fi
	sleep 1.5

	if [[ $fails -ge 1  ]]; then
		clear
		echo -e "\n\n $blue No Se Ha Podido Instalar Debido A Que Faltan $fails Programas."
		echo -e "\n $red Abortando...."
		exit
	else
	ins1	

	fi




}
checkins