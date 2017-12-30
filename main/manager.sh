#!/bin/bash
Install_path="/root/Documents/pro/P3rl4_Manager/"



#color variables
bold="\033[1m"
blink="\033[5m"
under="\033[4m"
normal="\033[0m"
green="\033[32m"
red="\033[31m"
blue="\033[34m"


clear


#functions

#Main Menu
function init {
	
	clear
	while [[ $REPLY != 0 ]]; do
		clear
		echo -e "\n\n               $green 1) $red Ver Lista De Modulos"
		echo -e "               $green 2) $red Elegir Modulo Por Su Numero"
		echo -e "               $green 0) $red Salir $normal \n\n\n"
		echo -e "$blue"

		read -p "P3rl4> "
		echo -e "$normal"
		if [[ $REPLY =~ ^[0-2]$ ]]; then
			if [[ $REPLY == 1 ]]; then
				funml			
			fi
			if [[ $REPLY == 2 ]]; then
				funcm
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
#Module List, If You Add A Module Add It Here Too
function funml {
	clear
	echo -e "$red 1) $green dns_spoof $normal"
	echo -e "$red 2) $green android_payload $normal"
	read
}
#Choose Module And Execute It
function funcm {


	clear
	cd $Install_path/modules

	echo -e "\n\n$green |Que modulo quiere elegir?"
	read -p " | > " cmodule
	echo -e "$normal"
	
	case $cmodule in
		1)
			clear
			./dns_spoof
			;;
		2)
			./android_payload
			clear
			;;
		*)
		clear
		echo -e "$red Ese Modulo No Existe$normal"
		sleep 2
	esac
}
#main menu
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
main
