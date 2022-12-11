#!/bin/bash

#------------------------------------------------------------------
# PRA2: Guions bash
# Codi font: pra2_3.sh
#
# Aleix Segura Paz
# Aniol Serrano Ortega
#------------------------------------------------------------------

#Funció que evalua si els parametres que passem a l'script son correctes.
# Que siguin 2, que el primer sigui un directori, que el segon sigui un numero i que es correspongui a $HOME.

check_parameters(){
	if [[ $1 == 2 && $2 =~ ^[0-9]+$ && $3 == *"$4"* && $4 == *"/"* ]]
		then
			true
		else
			false
	fi
}

# Si els parametres són vàlids enmagatzemem en un array tots els usuaris. 
# Si no són vàlids indiquem l'ús correcte.

if check_parameters $# $2 $HOME $1
	then
		array_users=( $1/*/ )
	else
		echo "Ús: prac2_3.sh <ruta home usuaris> <MB llindar>"
fi


#Funció que obté la capacitat en MB d'un directori concret.

get_capacity(){  
	command=$(du -ms -x $1)
	capacity=${command:0:length -${#1}}
}

#Analitzem cada un dels usuaris, mirem si tenim permís d'execució, en aquest cas evaluem
# si els MB que té ocupats l'usuari són majors o no als passats per paràmetre.

for (( i=0; i<${#array_users[@]}; i++))
do
	echo "Analitzant home de ${array_users[i]:${#1}+1:length-1} ... "
	sleep 2
	if [[ -x ${array_users[i]} ]]
		then get_capacity ${array_users[i]}
			if test $capacity -gt $2
				then
				echo "L'usuari ${array_users[i]:${#1}+1:length-1} excedeix la quota de $2 MB, té $capacity MB ocupats."
			else
				echo "L'usuari ${array_users[i]:${#1}+1:length-1} no excedeix la quota de $2 MB, tot correcte."
			fi
	else echo "No puc llegir ${array_users[i]}"
	echo "... Ok!"
	fi
done












