#!/bin/bash
#
clear
echo -n "Escriba el nombre del archivo que quiere copiar: "
read archivo
echo -n "Escriba la directorio (acabada en /) donde esta el archivo especificado: "
read directorio

if [[ ! -d $directorio ]]
then
	echo "El directorio no existe"
else
	if [[ ! -e $directorio$archivo ]]
	then
		echo "El archivo no existe"
	else
		if [[ ! -d ~/Backup-sh ]]
		then
			mkdir ~/Backup-sh
		fi
		if [[ -e ~/Backup-sh/$archivo ]]
		then
			grep '^[^#]' "$directorio""$archivo" > ~/Backup-sh/"$archivo"
		else
			grep '^[^#]' "$directorio""$archivo" >> ~/Backup-sh/"$archivo"
		fi
	fi
fi
exit 
