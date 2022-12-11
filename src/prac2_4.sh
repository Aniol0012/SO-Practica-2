#!/bin/bash

#------------------------------------------------------------------
# PRA2: Guions bash
# Codi font: pra2_4.sh
#
# Aleix Segura Paz
# Aniol Serrano Ortega
#------------------------------------------------------------------

# Definim una funció que agafa el nom del fitxer com a argument

tipFitxer() {
	# Guardem el nom del fitxer en una variable
	local filename=$1

	# Usem la comanda "file" per a obtenir el tipus de fitxer i el format
	local file_output=$(file $filename)


	# Guardem l'estat de la comanda "file" prèviament realitzada
	local exit_status=$?

	if [ $exit_status -lt 0 ]
		then
		echo "ERROR en l'execució de la funció tipFitxer. Codi retorn: $exit_status"
	fi
	
	echo "El nom i el tipus del fitxer és => $file_output"
}

# En el cas que passem almenys 1 paràmetre
if [ $# -ne 0 ]
	then 
	echo "Llistat de fitxers pasats com a parametre: [$@]"
	echo ""
	for variable_param # Ho comprovem únicament pels paràmetres passats ($@)
		do	
		if [ -d "$variable_param" ] # En cas que existeixi i sigui un directori
			then
			echo "$variable_param es un directori"
		elif [ -f "$variable_param" ]
			then # En cas que existeixi i sigui un fitxer
			tipFitxer $variable_param
		else
			echo "$variable_param no es ni directori ni fitxer regular"			
		fi
	done
else # En el cas que no passem cap paràmetre
	ruta=$(pwd)
	echo "Llistat de fitxers del directori [$ruta]"
	echo ""

	# Creem el llistat de fitxers del directori en cas que sigui possible
	
	for variable_param in *
		do
		if [ -d "$variable_param" ] # En cas que existeixi i sigui un directori
			then
			echo "$variable_param es un directori"
		elif [ -f "$variable_param" ]
			then # En cas que existeixi i sigui un fitxer
			tipFitxer $variable_param
		else
			echo "$variable_param no es ni directori ni fitxer regular"			
		fi
	done
fi