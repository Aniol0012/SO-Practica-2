#!/bin/bash

#------------------------------------------------------------------
# PRA2: Guions bash
# Codi font: pra2_2.sh
#
# Aleix Segura Paz
# Aniol Serrano Ortega
#------------------------------------------------------------------


if [[ $# -eq 2 && $1 =~ ^[0-9]+$ && $2 =~ ^[0-9]+$ ]]
	then
		echo "$0 suma els dos nombres passats com a parametres"
	else
		echo "Paràmetres incorrectes"
		echo "Ús: $0 <nombre1> <nombre2>"
		exit -1
fi

echo "$1 + $2 = `expr $(($1+$2))` "

#Altres mètodes per fer la suma."
echo -e "\n"

let "a=$1" "b=$2"
let c=a+b
echo $c

echo -e "\n"

let "suma=0"
for i in $1 $2
do
	 let "suma+=$i"
done

echo $suma
