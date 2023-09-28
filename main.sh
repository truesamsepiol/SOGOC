#!/bin/sh

if [ $# -eq 0 ]
then
	echo ""
	echo "USAGE"
	echo "	$0 <fichiers/csv>"
	exit
fi

/bin/sh nombreInscritParAnnee.sh $@
/bin/sh nombrePersonnesAyantCotise.sh $@
python3 generationCourbe.py
