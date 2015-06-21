#!/bin/bash

if [ "$0"  == ./Getopts06.sh -a ! -d "$1" ]; then
	logger -p error -t GESTOR_ALARMAS Falta Argumento válido
	echo "Missing dirname ("./Getopts06.sh --help" for help)"


elif [ "$0"  == ./Getopts06.sh -a -d "$1" ] ; then
	TMPDIR=$1
	echo "El directorio que usted ingreso es: "$TMPDIR
	echo '\n'

		#var1=`ls -l ${TMPDIR} | egrep -c ^-`
		find ${TMPDIR} -type f > /home/maryuri/Escritorio/var1.txt
		var1=`egrep -c "*" /home/maryuri/Escritorio/var1.txt`

		find ${TMPDIR} -type f | egrep "txt" > /home/maryuri/Escritorio/txt.txt
		txt=`egrep -c "*.txt" /home/maryuri/Escritorio/txt.txt`

		find ${TMPDIR} -type f | egrep "pdf" > /home/maryuri/Escritorio/pdf.txt
		pdf=`egrep -c "pdf" /home/maryuri/Escritorio/pdf.txt`

		find ${TMPDIR} -type f | egrep "mp3" > /home/maryuri/Escritorio/mp3.txt
		mp3=`egrep -c "mp3" /home/maryuri/Escritorio/mp3.txt`

		find ${TMPDIR} -type f | egrep "png" > /home/maryuri/Escritorio/png.txt
		png=`egrep -c "png" /home/maryuri/Escritorio/png.txt`

		find ${TMPDIR} -type f | egrep "odt" > /home/maryuri/Escritorio/odt.txt
		odt=`egrep -c "odt" /home/maryuri/Escritorio/odt.txt`

      		suma=$(($txt+$pdf+$mp3+$png+$odt))
      		otros=$(($var1-$suma))

	echo "La cantidad de ficheros es: "${var1}
	echo "lo que guarda txt es: "${txt}
      	echo "lo que guarda pdf es: "${pdf}
      	echo "lo que guarda mp3 es: "${mp3}
      	echo "lo que guarda png es: "${png}
      	echo "lo que guarda odt es: "${odt}
      	echo "lo que guarda otros es: "${otros}
	echo "Lo que guarda varl1 es: "$varl1
	
echo "Es un directoriooooo" 
fi

exit 0
