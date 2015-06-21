#!/bin/bash

AYUDA=0
PORCENTAJE=0
DPROFUNDIDAD=1
TMPDIR=

function AYUDA(){
   echo "*Mostrar sólo ayuda*"
}

function PROCESO(){
   ArchivosReglaresT=`find ${TMPDIR} -maxdepth 1 -type f | egrep -c "*"`
      
      #IMAGENES:
      sumaImagenes=`find ${TMPDIR} -maxdepth 1 -type f | grep -E -c "*\.(png|cdr|cpt|jpeg|jfif|ppt|pps|jpg|raw|psd|tiff|xcf|gif|eps|dng|psb|jp2|JPG)$"`

      #DOCUMENTOS:
      sumaDocumentos=`find ${TMPDIR} -maxdepth 1 -type f | grep -E -c "*\.(txt|css|htm|ps|xlsx|txt|odf|odt|ods|odg|odp|pdf|ott|fodt|uot|docx|xml|doc|dot|html|rtf)$"`

      #AUDIO:
      sumaAudio=`find ${TMPDIR} -maxdepth 1 -type f | grep -E -c "*\.(cda|mp3|ogg|wav|au|uLaw|MuLaw|aiff|mid|midi|rmi|wav|ra)$"`
         
      #VIDEO:
      sumaVideo=`find ${TMPDIR} -maxdepth 1 -type f | grep -E -c "*\.(avi|mov|movie|mpg|mpeg|qt|ram|mp4|wmv|ogv|AVI)$"`

      #COMPRIMIDOS:
      sumaComprimidos=`find ${TMPDIR} -maxdepth 1 -type f | grep -E -c "*\.(gz|gzip|tar|tar.gz|tar.Z|tgz|zip|arj|rar|Z)$"`

      #EJECUTABLES
      sumaEjecutables=`find ${TMPDIR} -maxdepth 1 -type f | grep -E -c "*\.(bas|bat|bin|cfg|dll|com|drv|exe|vxd|elf|pl|py|sh)$"`

      #CODIGOS FUENTES Y LIBRERIAS
      sumaCoFuLibrerias=`find ${TMPDIR} -maxdepth 1 -type f | grep -E -c "*\.(a|c|cpp|diff|h|lo|o|so|jar|rkt)$"`
      
      #ARCHIVOS DEL SISTEMA:
      sumaArchSistema=`find ${TMPDIR} -maxdepth 1 -type f | grep -E -c "*\.(conf|ko|lock|log|pid|socket|tmp)$"`

      suma=$(($sumaImagenes+$sumaDocumentos+$sumaAudio+$sumaVideo+$sumaComprimidos+$sumaEjecutables+$sumaCoFuLibrerias+$sumaArchSistema))
      		
      otros=$(($ArchivosReglaresT-$suma))
}

function PROCESO_RECURSIVO(){
   ArchivosReglaresT=`find ${TMPDIR} -type f | egrep -c "*"`
      
      #IMAGENES:
      sumaImagenes=`find ${TMPDIR} -type f | grep -E -c "*\.(png|cdr|cpt|jpeg|jfif|ppt|pps|jpg|raw|psd|tiff|xcf|gif|eps|dng|psb|jp2|JPG)$"`

      #DOCUMENTOS:
      sumaDocumentos=`find ${TMPDIR} -type f | grep -E -c "*\.(txt|css|htm|ps|xlsx|txt|odf|odt|ods|odg|odp|pdf|ott|fodt|uot|docx|xml|doc|dot|html|rtf)$"`

      #AUDIO:
      sumaAudio=`find ${TMPDIR} -type f | grep -E -c "*\.(cda|mp3|ogg|wav|au|uLaw|MuLaw|aiff|mid|midi|rmi|wav|ra)$"`
         
      #VIDEO:
      sumaVideo=`find ${TMPDIR} -type f | grep -E -c "*\.(avi|mov|movie|mpg|mpeg|qt|ram|mp4|wmv|ogv|AVI)$"`

      #COMPRIMIDOS:
      sumaComprimidos=`find ${TMPDIR} -type f | grep -E -c "*\.(gz|gzip|tar|tar.gz|tar.Z|tgz|zip|arj|rar|Z)$"`

      #EJECUTABLES
      sumaEjecutables=`find ${TMPDIR} -type f | grep -E -c "*\.(bas|bat|bin|cfg|dll|com|drv|exe|vxd|elf|pl|py|sh)$"`

      #CODIGOS FUENTES Y LIBRERIAS
      sumaCoFuLibrerias=`find ${TMPDIR} -type f | grep -E -c "*\.(a|c|cpp|diff|h|lo|o|so|jar|rkt)$"`
      
      #ARCHIVOS DEL SISTEMA:
      sumaArchSistema=`find ${TMPDIR} -type f | grep -E -c "*\.(conf|ko|lock|log|pid|socket|tmp)$"`

      suma=$(($sumaImagenes+$sumaDocumentos+$sumaAudio+$sumaVideo+$sumaComprimidos+$sumaEjecutables+$sumaCoFuLibrerias+$sumaArchSistema))
      		
      otros=$(($ArchivosReglaresT-$suma))
}

function NORMAL(){
   PROCESO
   echo "El directorio que usted ingreso es: "$TMPDIR
   echo "La cantidad total de archivos regulares es: "${ArchivosReglaresT}
   echo ""
   echo "IMAGENES: "$sumaImagenes
   echo "DOCUMENTOS: "$sumaDocumentos
   echo "AUDIO: "$sumaAudio
   echo "VIDEO: "$sumaVideo
   echo "COMPRIMIDOS: "$sumaComprimidos
   echo "EJECUTABLES: "$sumaEjecutables
   echo "LIBRERIAS: "$sumaCoFuLibrerias
   echo "ARCHIVOS DEL SISTEMA: "$sumaArchSistema
   echo "OTROS: "${otros}
}

function PORCENTAJE(){
   PROCESO
   echo "El directorio que usted ingreso es: "$TMPDIR
   echo "La cantidad total de archivos regulares es: "${ArchivosReglaresT}
   echo ""
   echo "IMAGENES: "$((100*$sumaImagenes/$ArchivosReglaresT))"%"
   echo "DOCUMENTOS: "$((100*$sumaDocumentos/$ArchivosReglaresT))"%"
   echo "AUDIO: "$((100*$sumaAudio/$ArchivosReglaresT))"%"
   echo "VIDEO: "$((100*$sumaVideo/$ArchivosReglaresT))"%"
   echo "COMPRIMIDOS: "$((100*$sumaComprimidos/$ArchivosReglaresT))"%"
   echo "EJECUTABLES: "$((100*$sumaEjecutables/$ArchivosReglaresT))"%"
   echo "LIBRERIAS: "$((100*$sumaCoFuLibrerias/$ArchivosReglaresT))"%"
   echo "ARCHIVOS DEL SISTEMA: "$((100*$sumaArchSistema/$ArchivosReglaresT))"%"
   echo "OTROS: "$((100*$otros/$ArchivosReglaresT))"%"
}

function RECURSIVO(){
   PROCESO_RECURSIVO
   echo "El directorio que usted ingreso es: "$TMPDIR
   echo "La cantidad total de archivos regulares es: "${ArchivosReglaresT}
   echo ""
   echo "IMAGENES: "$sumaImagenes
   echo "DOCUMENTOS: "$sumaDocumentos
   echo "AUDIO: "$sumaAudio
   echo "VIDEO: "$sumaVideo
   echo "COMPRIMIDOS: "$sumaComprimidos
   echo "EJECUTABLES: "$sumaEjecutables
   echo "LIBRERIAS: "$sumaCoFuLibrerias
   echo "ARCHIVOS DEL SISTEMA: "$sumaArchSistema
   echo "OTROS: "${otros}
}

function PORCENTAJE_RECURSIVO(){
   PROCESO_RECURSIVO
   echo "El directorio que usted ingreso es: "$TMPDIR
   echo "La cantidad total de archivos regulares es: "${ArchivosReglaresT}
   echo ""
   echo "IMAGENES: "$((100*$sumaImagenes/$ArchivosReglaresT))"%"
   echo "DOCUMENTOS: "$((100*$sumaDocumentos/$ArchivosReglaresT))"%"
   echo "AUDIO: "$((100*$sumaAudio/$ArchivosReglaresT))"%"
   echo "VIDEO: "$((100*$sumaVideo/$ArchivosReglaresT))"%"
   echo "COMPRIMIDOS: "$((100*$sumaComprimidos/$ArchivosReglaresT))"%"
   echo "EJECUTABLES: "$((100*$sumaEjecutables/$ArchivosReglaresT))"%"
   echo "LIBRERIAS: "$((100*$sumaCoFuLibrerias/$ArchivosReglaresT))"%"
   echo "ARCHIVOS DEL SISTEMA: "$((100*$sumaArchSistema/$ArchivosReglaresT))"%"
   echo "OTROS: "$((100*$otros/$ArchivosReglaresT))"%"
}

################## FIN DE LAS FUNCIONES ##########################

   while getopts :dhp: arg
      do
      case $arg in
         d)   DPROFUNDIDAD=0 ;;
         h)   if [ $# == 1 ]; then
                 AYUDA=1
              else
                 echo "Opción -h no se puede combinar."
                 logger -p error -t PROYECTO_IASGL Combinación inválida
                 exit 1
              fi ;;
         p)   NUMERO=$(echo $OPTARG | egrep --only-matching '^[0-9]+')
              if [ "$NUMERO" == 1 ]; then
                 PORCENTAJE=$NUMERO
              else
                 echo "Sólo se admite -p1 (Seleccione -h para ver la ayuda)."
                 logger -p error -t PROYECTO_IASGL Argumento inválido
                 exit 1
              fi

              OPCION=$(echo $OPTARG | egrep --only-matching 'd$')
              if [ "$OPCION" == "d" ]; then
                 DPROFUNDIDAD=0
              fi ;;
         :)   echo "Debe meter un argumento a la opción: -p1"
              logger -p auth.error -t PROYECTO_IASGL Falta argumento opción -p
              exit 1 ;;
         \?)  echo "Opción inválida -$OPTARG ignorada."
              logger -p auth.error -t PROYECTO_IASGL Opción inválida
              exit 1 ;;
      esac
   done

if [ $# == 0 ]; then
   echo "Es necesario un directorio (Seleccione -h para ver la ayuda)."
   logger -p error -t PROYECTO_IASGL Falta directorio
   exit 1
elif [ $# == 1 ]; then
   TMPDIR=$1

   if [ -d "$TMPDIR" ]; then
      RECURSIVO
      exit 0
   elif [ "$AYUDA" == 1 ]; then
      AYUDA
      exit 0
   else
      echo "Argumento NO es directorio."
      logger -p error -t PROYECTO_IASGL Falta Argumento válido
      exit 1
   fi      
elif [ $# == 2 ]; then
   TMPDIR=$2

elif [ $# == 3 ]; then
   TMPDIR=$3

else
   echo "Cantidad argumentos inválida."
   logger -p error -t PROYECTO_IASGL Cantidad argumentos inválida
   exit 1
fi

#Verificación si meten parámetros#
if [ -d "$TMPDIR" ]; then
   if [ "$PORCENTAJE" == 1 -a "$DPROFUNDIDAD" == 0 ]; then
      PORCENTAJE
   elif [ "$PORCENTAJE" == 1 ]; then
      PORCENTAJE_RECURSIVO
   elif [ "$DPROFUNDIDAD" == 0 ]; then
      NORMAL
   else
      echo "*Algo salió mal*"
      logger -p error -t PROYECTO_IASGL Error desconocido
      exit 1
   fi   
else
   echo "Argumento NO es directorio."
   logger -p error -t PROYECTO_IASGL Falta Argumento válido
   exit 1
fi

exit 0

echo "Cantidad: "$#
echo "Ayuda: "$AYUDA
echo "Porcentaje: "$PORCENTAJE
echo "Profundidad: "$DPROFUNDIDAD
echo "TMPDIR: "$TMPDIR

exit 0
