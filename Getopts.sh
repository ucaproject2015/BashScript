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
