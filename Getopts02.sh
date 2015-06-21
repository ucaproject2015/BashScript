#!/bin/bash

SKIPBLANKS=
TMPDIR=/tmp
CASE=lower

while getopts :bt:u arg
do
   case $arg in
      b)   SKIPBLANKS=TRUE ;;
      t)   if [ -d "$OPTARG" ]
           then
              TMPDIR=$OPTARG
		echo "El valor de TMPDIR: "$TMPDIR
		var1=`ls -l ${TMPDIR} | egrep -c ^-`
		find ${TMPDIR} -type f | egrep "txt" > /home/maryuri/Escritorio/hola.txt
		varg1=`egrep -c "$txt" /home/maryuri/Escritorio/hola.txt`



		echo "La cantidad de ficheros es: "${var1}
		echo "lo que guarda varg1 es: "${varg1}
		echo "Lo que guarda varl1 es: "$varl1
		
#- archivos regulares
#d directorios
#c dispositivos de caracter
#b dispositivos de bloque
#s sockets
#p tuberías
#l links		
	
		#var1=`ls -l ${TMPDIR} | egrep -c ^-`
		var2= ls -l ${TMPDIR} | egrep -c ^d
                var3= ls -l ${TMPDIR} | egrep -c ^d
                var4= ls -l ${TMPDIR} | egrep -c ^d
                var5= ls -l ${TMPDIR} | egrep -c ^d
                var6= ls -l ${TMPDIR} | egrep -c ^d
                var7= ls -l ${TMPDIR} | egrep -c ^d
                var8= ls -l ${TMPDIR} | egrep -c ^d
		
              echo 'Se selecciono la opcion d' 
           else
              echo "$0: $OPTARG no es un directorio." >&2
              exit 1
           fi ;;
      u)   CASE=upper
           echo 'Se selecciono la opcion u'
           ;;
      :)   echo "$0: Must supply an argument to -$OPTARG" >&2
           exit 1 ;;
      \?)  echo "Opción inválida -$OPTARG ingnorada. holis" >>error.txt ;;
   esac
done

echo 'skip: '$SKIPBLANKS
echo 'tmp: '$TMPDIR
echo 'case: '$CASE

exit 0

