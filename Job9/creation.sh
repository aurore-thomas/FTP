#!/bin/bash

# ---------------------------------------------------------------------------------------------

#  			/!\ Il faut se mettre en su avant d'exécuter le script /!\
#				Il faut mettre le fichier .csv en argument

# ---------------------------------------------------------------------------------------------



#On définit le séparateur dans le fichier .csv
IFS=","

cat $1 | sed 1d $1 | sed -e 's/ //g' | while read id prenom nom mdp role || [ -n "$role" ];
do
	pseudo="$prenom"-"$nom"
#	echo "$prenom $nom $mdp $role"
	echo -ne "$mdp$mdp\n$mdp$mdp" | adduser --force-badname $pseudo
	echo "$pseudo":"$mdp$mdp" | chpasswd
	if [[ "$role" = *"Admin"* ]];
	then
		usermod -aG "$prenom-$nom"
	fi
done
