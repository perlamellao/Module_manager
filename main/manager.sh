#!/bin/bash
#Normal variables
working_path=$(pwd)
module_list_file="$working_path/modules/installed"
modules_folder="$working_path/modules"
export working_path
export modules_folder
ProgressCounter=0
ProgressPercentage=0
module_list=$(cat $module_list_file)
errors=0
current_ip=$(hostname -I)
modules_installed=$(sed '11,99!d' $module_list_file | wc -l)


#color variables
bold="\033[1m"
blink="\033[5m"
under="\033[4m"
normal="\033[0m"
green="\e[1;32m"
red="\033[31m"
blue="\033[34m"


clear


#aqui empiezan las funciones
#barra de carga
function PBar(){
	while [[ $ProgressCounter -le 9 ]]; do
		let ProgressCounter=$((ProgressCounter+1))
		echo -e "$ProgressPercentage"
		let ProgressPercentage=$((ProgressPercentage+9))
		sleep .5s
	done | zenity --progress --no-cancel --text=Cargando.... --auto-close

}
#menu de eleccion
function init {

	resize -s 23 68 > /dev/null
	clear
	unset REPLY1
	while [[ $REPLY1 != 0 ]]; do
		clear
		echo -e "$green"
		echo -e "       ======================================================="
		echo -e '       =    _____             .___    .__        	     =
       =   /     \   ____   __| _/_ __|  |   ____            =
       =  /  \ /  \ /  _ \ / __ |  |  \  | _/ __ \           =
       = /    Y    (  <_> ) /_/ |  |  /  |_\  ___/           =
       = \____|__  /\____/\____ |____/|____/\___  >          =
       =         \/            \/               \/           =
       =   _____ _____    ____ _____     ____   ___________  =
       =  /     \\\__  \  /    \\\__  \   / ___\_/ __ \_  __ \ =
       = |  Y Y  \/ __ \|   |  \/ __ \_/ /_/  >  ___/|  | \/ =
       = |__|_|  (____  /___|  (____  /\___  / \___  >__|    =
       =       \/     \/     \/     \//_____/      \/        ='
       	echo -e "       ======================================================="
       	echo -e "       =                   $red Made By @P3rl4 $green                  ="
       	echo -e "       ======================================================="		
		echo -e "\n\n           $green 1) $red Ver Lista De Modulos Y Elegir"
		echo -e "           $green 0) $red Salir $normal \n"
		echo -e "$blue"

		read -p "P3rl4> " REPLY1
		echo -e "$normal"
		if [[ $REPLY1 =~ ^[0-2]$ ]]; then
			if [[ $REPLY1 == 1 ]]; then
				PBar
				funmle          
			elif [[ $REPLY1 == 0 ]]; then
				clear 
				echo -e "$red \n\n\n    Cerrando Todo Y Saliendo....$normal"
				sleep 2
				clear
				exit
			fi
		fi
	done
}       
#Vista de modulo y eleccion
function funmle {
	clear
	unset REPLY2
	while [[ $REPLY2 != 0 ]]; do
		clear
		echo -e "$green $module_list \n"
		echo -e "$red			0-|CANCELAR|"
		echo -e "$red"
		read -p "P3rl4> " REPLY2
		echo -e "$normal"
		if [[ $REPLY2 == 1 ]]; then		
			fish -c "exec $modules_folder/dns_spoof"
			read
		elif [[ $REPLY2 == 2 ]]; then
			fish -c "$modules_folder/android_payload"			
		elif [[ $REPLY2 == 3 ]]; then
			./$modules_folder/Wkiller
		elif [[ $REPLY2 == 0 ]]; then
			clear
			init
		fi


	done
}
#menu principal
function main() {
	jnfduis
	clear
	resize -s 27 62 > /dev/null
	echo -e $red""
	echo "                                      "
	echo "                        ..:::::::::..     "
	echo "                     ..:::aad8888888baa:::..  "
	echo "                 .::::d:?88888888888?::8b::::.    "
	echo "               .:::d8888:?88888888??a888888b:::.  "
	echo "             .:::d8888888a8888888aa8888888888b:::.    "
	echo "            ::::dP::::::::88888888888::::::::Yb::::   "
	echo "           ::::dP:::::::::Y888888888P:::::::::Yb::::  "
	echo "          ::::d8:::::::::::Y8888888P:::::::::::8b:::: "
	echo "         .::::88::::::::::::Y88888P::::::::::::88::::.    "
	echo "         :::::Y8baaaaaaaaaa88P:T:Y88aaaaaaaaaad8P:::::    "
	echo "         :::::::Y88888888888P::|::Y88888888888P:::::::    "
	echo "         ::::::::::::::::888:::|:::888::::::::::::::::    "
	echo "          :::::::::::::::8888888888888b:::::::::::::: "
	echo "          :::::::::::::::88888888888888:::::::::::::: "
	echo "           :::::::::::::d88888888888888:::::::::::::  "
	echo "            ::::::::::::88::88::88:::88::::::::::::   "
	echo "              ::::::::::88::88::88:::88:::::::::: "
	echo "                ::::::::88::88::P::::88::::::::   "
	echo "                  ::::::88::88:::::::88:::::: "
	echo "                      ::::::::::::::::::: "
	echo "                           :::::::::  "
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
echo "                                      |___/    "
echo -e "$normal"
#metasploit
hash msfconsole
if [[ $? -eq 0 ]]; then
	echo -e "$normal \n\n[$green ✔$normal ]$red Metasploit Esta Instalado"
else
	echo -e "$normal [$green x$normal ]$red Metasploit No Esta Instalado Y Es Necesario"
	errors=$((errors+1))

fi
sleep 0.7
#msfvenom
hash msfvenom
if [[ $? -eq 0 ]]; then
	echo -e "$normal \n\n[$green ✔$normal ]$red Msfvenom Esta Instalado"
else
	echo -e "$normal [$green x$normal ]$red Msfvenom No Esta Instalado Y Es Necesario"
	errors=$((errors+1))
fi
sleep 0.7
#zenity
hash zenity
if [[ $? -eq 0 ]]; then
	echo -e "$normal \n\n[$green ✔$normal ]$red Zenity Esta Instalado"
else
	echo -e "$normal [$green x$normal ]$red Zenity No Esta Instalado Y Es Necesario"
	errors=$((errors+1))
fi

sleep 1.5
if [[ $errors == 0 ]]; then
	sleep 1 
	main
elif [[ $errors -gt 0 ]]; then
	echo -e "\n\n Instala Los Paquetes Necesarios Y Reintentalo"
	read
	clear
	exit
else
	exit
fi
}

TestInstalation













