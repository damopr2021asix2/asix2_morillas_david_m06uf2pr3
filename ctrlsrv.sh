#!/bin/bash
#
if [ $EUID -ne 0 ]
then
	echo "This script must be run as root"
	exit 1
fi

mostra_serveis(){
	clear
	echo "Opcions Disponibles:"
	echo "	a) cups"
	echo "	b) ssh"
	echo "	c) apache2"
	echo ""
	echo -n "Escribi el nom del servei desitjat: "
	read Opcio
}

ctrl_servei(){
	case $Opcio in
		'cups')
			systemctl status cups > /dev/null
			if [[ $? -ne 0 ]]
			then
				systemctl start cups
				echo "Iniciant Servei."
			else
				echo "El programa ja estaba iniciat o no existeix."
			fi
			;;
			
		'ssh')
			systemctl status ssh > /dev/null
			if [[ $? -ne 0 ]]
			then
				systemctl start ssh
				echo "Iniciant Servei."
			else
				echo "El programa ja estaba iniciat o no existeix."
			fi
			;;
		'apache2')
			systemctl status apache2 > /dev/null
			if [[ $? -ne 0 ]]
			then
				systemctl start apache2
				echo "Iniciant Servei."
			else
				echo "El programa ja estaba iniciat o no existeix."
			fi
			;;
		
		*)
			echo "Opcio no Acceptada. Tancant programa."
			exit 1
	esac
	echo ""
	echo "Que tingi un bon dia/tarda/nit."
}
##############
mostra_serveis
ctrl_servei
exit
