#!/bin/bash

SKIPBLANKS=
TMPDIR=/tmp
CASE=lower
#CONT=0

while getopts :bt:u arg
do
   case $arg in
      b)   SKIPBLANKS=TRUE ;;
      t)   if [ -d "$OPTARG" ]
           then
              TMPDIR=$OPTARG
		echo "El valor de TMPDIR: "$TMPDIR
		
		var1=`ls -l ${TMPDIR} | egrep -c ^-`
		var2= ls -l ${TMPDIR} | egrep -c ^d
                var3= ls -l ${TMPDIR} | egrep -c ^d
                var4= ls -l ${TMPDIR} | egrep -c ^d
                var5= ls -l ${TMPDIR} | egrep -c ^d
                var6= ls -l ${TMPDIR} | egrep -c ^d
                var7= ls -l ${TMPDIR} | egrep -c ^d
                var8= ls -l ${TMPDIR} | egrep -c ^d
	

		#var= find ${TMPDIR} -type f | ls -l ${TMPDIR} #| egrep -c ^-

 		#M=1
		#find $TMPDIR -type f -exec ls -l {} \; | while read dir ; do
		#	#let X=$X+1
		#	((++M))
		#	echo "Valor de dir" $dir
		#done
		#echo "El valor de X es: "$M

		echo "La cantidad de ficheros es: "${var1}
		#var=find $OPTARG -type f 
		#echo "Los datos encontrados son"$var		



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

#((++CONT))
echo "El contador es: "$CONT

exit 0

