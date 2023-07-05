#!/bin/bash

echo "Bonjour $(whoami)"
echo "Date execution script : $(date)"
echo "Mon adresse IP privée est $(ifconfig | grep broadcast | awk '{ print $2 }')" 

echo -e "\n*********************"

echo "Traitement des fichiers\n"

if [ -z $1 ]
then
	echo "Le répertoire est absent"
else
	echo -e "Nombre de fichiers dans $1 : $(find $1 -type f | wc -l)\n"
	echo -e "Fichiers AVANT la suppression:\n$(find $1 -type f -exec -ls -l {} +)\n"
	find $1 -type f -size +115k -size -300k -delete
	echo -e "Fichiers APRES la suppression:\n$(find $1 -type f -exec ls -l {} +)\n"
fi

