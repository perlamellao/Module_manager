#!/bin/bash

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

		read -p "P3rl4> "
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
			echo -e "\n\n\033[42mPon Un Numero [0-1]\033[0m"
			sleep 2
		fi
	done
}		
#Module List, If You Add A Module Add It Here Too
function funml {
	clear
	echo -e "$red 1) $green dns_spoof $normal"
	read
}
#Choose Module And Execute It
function funcm {


	clear
	cd /root/Documents/pro/Mi\ Proyect/modules

	echo -e "\n\n$green |Que modulo quiere elegir?$normal"
	read -p " | > " cmodule
	
	case $cmodule in
		1)
			./dns_spoof
			read
			;;
		*)
		echo -e "$red Ese Modulo No Existe$normal"
		sleep 2
	esac
}






























echo -e "------------------------"
echo -e "|\033[42m         HOLA         \033[0m|"
echo -e "------------------------\n\n"
read
init
