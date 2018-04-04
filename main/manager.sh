#!/bin/bash
#Normal variables
module_list_file="$working_path/modules/installed"
working_path=$(pwd)
ProgressCounter=0
ProgressPercentage=0
module_list=$(cat $working_path/modules/installed)

#color variables
bold="\033[1m"
blink="\033[5m"
under="\033[4m"
normal="\033[0m"
green="\033[32m"
red="\033[31m"
blue="\033[34m"


clear


#aqui empiezan las funciones
#Barra progreso
function ProgressBar() {

	while [[ $ProgressCounter -le 10 ]]; do
		let ProgressCounter=$((ProgressCounter+1))
		echo -e "$ProgressPercentage"
		let ProgressPercentage=$((ProgressPercentage+10))
		sleep 1
	done | zenity --progress 










}
#menu de eleccion
function init {
	
	clear
	while [[ $REPLY != 0 ]]; do
		clear
		echo -e "\n\n               $green 1) $red Ver Lista De Modulos Y Elegir"
		echo -e "               $green 0) $red Salir $normal \n\n\n"
		echo -e "$blue"

		read -p "P3rl4> "
		echo -e "$normal"
		if [[ $REPLY =~ ^[0-2]$ ]]; then
			if [[ $REPLY == 1 ]]; then
				funml			
			fi
			if [[ $REPLY == 0 ]]; then
				clear 
				echo -e "$red Cerrando Todo Y Saliendo....$normal"
				sleep 2
				exit
			fi
		else	
			clear
			echo -e "$red Pon Un Numero Valido"
			sleep 2
		fi
	done
}		
#Vista de modulo y eleccion
function funml {
	clear
	echo -e "$green $module_list"
	read	








}
#menu principal
function main() {
	clear
	resize -s 32 68 > /dev/null
	echo -e $red""
	echo "	 									"
	echo "   	                  ..:::::::::..		"
	echo "   	               ..:::aad8888888baa:::..	"
	echo "   	           .::::d:?88888888888?::8b::::.	"
	echo "   	         .:::d8888:?88888888??a888888b:::.	"
	echo "   	       .:::d8888888a8888888aa8888888888b:::.	"
	echo "   	      ::::dP::::::::88888888888::::::::Yb::::	"
	echo "   	     ::::dP:::::::::Y888888888P:::::::::Yb::::	"
	echo "   	    ::::d8:::::::::::Y8888888P:::::::::::8b::::	"
	echo "   	   .::::88::::::::::::Y88888P::::::::::::88::::.	"
	echo "   	   :::::Y8baaaaaaaaaa88P:T:Y88aaaaaaaaaad8P:::::	"
	echo "   	   :::::::Y88888888888P::|::Y88888888888P:::::::	"
	echo "   	   ::::::::::::::::888:::|:::888::::::::::::::::	"
	echo "   	    :::::::::::::::8888888888888b::::::::::::::	"
	echo "   	    :::::::::::::::88888888888888::::::::::::::	"
	echo "   	     :::::::::::::d88888888888888::::::::::::: 	"
	echo "   	      ::::::::::::88::88::88:::88::::::::::::	"
	echo "   	        ::::::::::88::88::88:::88::::::::::	"
	echo "   	          ::::::::88::88::P::::88::::::::	"
	echo "   	            ::::::88::88:::::::88::::::	"
	echo "   	                :::::::::::::::::::	"
	echo "   	                     ::::::::: 	"
	echo -e "$normal"
	echo -e "$green Presiona [ENTER] Para Continuar"
	read
	init
}

function TestInstalation() {

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
fi
sleep 0.7
#msfvenom
hash msfvenom
if [[ $? -eq 0 ]]; then
	echo -e "$normal \n\n[$green ✔$normal ]$red Msfvenom Esta Instalado"
else
	echo -e "$normal [$green x$normal ]$red Msfvenom No Esta Instalado Y Es Necesario"
fi
sleep 1.5
main
}

TestInstalation













