#!/bin/sh
# Ce script prend en parametre un fichier ou un repertoire contenant des fichiers
# et genere le nombre de membres par fichier

if [ $# -eq 0 ]
then
	echo ""
	echo "USAGE"
	echo "	$0 <fichiers.csv>"
	exit
fi

echo -n "" > nombreInscritParAnnee.csv # vider le fichier

for fichier in $@
do
	annee=$(cat $fichier | head -n 1) # on recupere la premiere ligne
	nbLigne=$(cat $fichier | wc -l) # on compte le nombre de ligne
	nbLigne=$((nbLigne-2)) # retrait des deux premieres ligne
	annee=$((annee+0)) # convertion de la variable annee en nombre
	echo $annee,$nbLigne >> nombreInscritParAnnee.csv
done
