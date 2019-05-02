#!/bin/bash

#Variables

año=2018
usuario="Jaime"
edad=16
mood=""
moodbin=""
bluegreen="01010100 01100101 00100000 01010001 01110101 01101001 01100101 01110010 01101111"
#Funciones


function newyear(){
	read -p "Resumen de tu año: $año?" mood #Guardar resumen en variable mood
	traducirBin #Traducir resumen a binario 
	clear
	:comprobar
	if [[ $mood == $bluegreen  ]]; then #comprobar si el resumen es igual a $bluegreen
		clear
		echo -e "Bienvenido Jaime"
	else
		echo -e "No se quien eres pero tan mal no te ha ido"
	fi
}

function traducirBin() {

	get $mood 
	bintotext $mood > $moodbin
	goto comprobar
}




newyear