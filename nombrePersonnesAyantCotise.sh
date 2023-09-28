#!/bin/sh

if [ $# -eq 0 ]
then
	echo ""
	echo "USAGE"
	echo "	$0 <fichiers.csv>"
	exit
fi

echo -n "" > nombrePersonnesAyantCotise.csv

for fichier in $@
do
	annee=$(head -n 1 $fichier)
	annee=$((annee+0))
	nbLigne=$(cut -d',' -f3,4,5 $fichier | grep -E [0-9] | wc -l)
	nbPersonnesAyantCotise=$((nbLigne - 1))
	echo $annee,$nbPersonnesAyantCotise >> nombrePersonnesAyantCotise.csv
done
