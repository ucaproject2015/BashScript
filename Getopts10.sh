#!/bin/bash

ls /var/Proyecto 1>/dev/null 2>/dev/null
if [ ! $? == 0 ]; then #no existe esa carpeta
   mkdir /var/Proyecto 2>/dev/null
   #echo "*******?"$?
   if [ ! $? == 0 ]; then
      echo "Error."
      echo "NO SE PUEDE CREAR. VERIFIQUE SUS PERMISOS."
      echo "Sus permisos para el directorio /var/ deben de ser: drwxrwxrwx"
      echo "Sus permisos para el directorio /etc/ deben de ser: drwxrwxrwx"
      exit 1
   fi
fi

#VARIABLES CAMBIABLES
AYUDA=`grep "^AYUDA" /etc/VariablesConfigurables.sh | sed 's/AYUDA=\(.*\)/\1/g'`
PORCENTAJE=`grep "^PORCENTAJE" /etc/VariablesConfigurables.sh | sed 's/PORCENTAJE=\(.*\)/\1/g'`
DPROFUNDIDAD=`grep "^DPROFUNDIDAD" /etc/VariablesConfigurables.sh | sed 's/DPROFUNDIDAD=\(.*\)/\1/g'`
TMPDIR=

function AYUDA(){
   echo "*Mostrar sólo ayuda*"
}

function PROCESO(){
   ArchivosReglaresT_A=`find ${TMPDIR} -maxdepth 1 -type f 2>/dev/null`

   if [ ! $? == 0 ]; then
      date > /var/Proyecto/ArchivoProyecto
      echo "Error." > /var/Proyecto/ArchivoProyecto
      echo "Su computadora no cumple con los requisitos mínimos para poder ejecutar este comando." > /var/Proyecto/ArchivoProyecto
      #echo "Error." 
      #echo "Su computadora no cumple con los requisitos mínimos para poder ejecutar este comando."
      logger -p auth.error -t PROYECTO_IASGL No cumple requerimientos mínimos
      exit 1
   fi

   ArchivosReglaresT=`find ${TMPDIR} -maxdepth 1 -type f | egrep -c "*" 2>/dev/null`
      
      #IMAGENES:
      sumaImagenes=`find ${TMPDIR} -maxdepth 1 -type f | grep -E -c "*\.(png|cdr|cpt|jpeg|jfif|ppt|pps|jpg|raw|psd|tiff|xcf|gif|eps|dng|psb|jp2|JPG)$" 2>/dev/null`

      #DOCUMENTOS:
      sumaDocumentos=`find ${TMPDIR} -maxdepth 1 -type f | grep -E -c "*\.(txt|css|htm|ps|xlsx|txt|odf|odt|ods|odg|odp|pdf|ott|fodt|uot|docx|xml|doc|dot|html|rtf)$" 2>/dev/null`

      #AUDIO:
      sumaAudio=`find ${TMPDIR} -maxdepth 1 -type f | grep -E -c "*\.(cda|mp3|ogg|wav|au|uLaw|MuLaw|aiff|mid|midi|rmi|wav|ra)$" 2>/dev/null`
         
      #VIDEO:
      sumaVideo=`find ${TMPDIR} -maxdepth 1 -type f | grep -E -c "*\.(avi|mov|movie|mpg|mpeg|qt|ram|mp4|wmv|ogv|AVI)$" 2>/dev/null`

      #COMPRIMIDOS:
      sumaComprimidos=`find ${TMPDIR} -maxdepth 1 -type f | grep -E -c "*\.(gz|gzip|tar|tar.gz|tar.Z|tgz|zip|arj|rar|Z)$" 2>/dev/null`

      #EJECUTABLES
      sumaEjecutables=`find ${TMPDIR} -maxdepth 1 -type f | grep -E -c "*\.(bas|bat|bin|cfg|dll|com|drv|exe|vxd|elf|pl|py|sh)$" 2>/dev/null`

      #CODIGOS FUENTES Y LIBRERIAS
      sumaCoFuLibrerias=`find ${TMPDIR} -maxdepth 1 -type f | grep -E -c "*\.(a|c|cpp|diff|h|lo|o|so|jar|rkt)$" 2>/dev/null`
      
      #ARCHIVOS DEL SISTEMA:
      sumaArchSistema=`find ${TMPDIR} -maxdepth 1 -type f | grep -E -c "*\.(conf|ko|lock|log|pid|socket|tmp)$" 2>/dev/null`

      suma=$(($sumaImagenes+$sumaDocumentos+$sumaAudio+$sumaVideo+$sumaComprimidos+$sumaEjecutables+$sumaCoFuLibrerias+$sumaArchSistema))
      		
      otros=$(($ArchivosReglaresT-$suma))
}

function PROCESO_RECURSIVO(){
   ArchivosReglaresT_A=`find ${TMPDIR} -type f 2>/dev/null`
   
   if [ ! $? == 0 ]; then
      date > /var/Proyecto/ArchivoProyecto
      echo "Error." >> /var/Proyecto/ArchivoProyecto
      echo "Su computadora no cumple con los requisitos mínimos para poder ejecutar este comando." >> /var/Proyecto/ArchivoProyecto
      #echo "Error."
      #echo "Su computadora no cumple con los requisitos mínimos para poder ejecutar este comando."
      logger -p auth.error -t PROYECTO_IASGL No cumple requerimientos mínimos
      exit 1
   fi
   ArchivosReglaresT=`find ${TMPDIR} -type f | egrep -c "*"`   
   
      #IMAGENES:
      sumaImagenes=`find ${TMPDIR} -type f | grep -E -c "*\.(png|cdr|cpt|jpeg|jfif|ppt|pps|jpg|raw|psd|tiff|xcf|gif|eps|dng|psb|jp2|JPG)$" 2>/dev/null`

      #DOCUMENTOS:
      sumaDocumentos=`find ${TMPDIR} -type f | grep -E -c "*\.(txt|css|htm|ps|xlsx|txt|odf|odt|ods|odg|odp|pdf|ott|fodt|uot|docx|xml|doc|dot|html|rtf)$" 2>/dev/null`

      #AUDIO:
      sumaAudio=`find ${TMPDIR} -type f | grep -E -c "*\.(cda|mp3|ogg|wav|au|uLaw|MuLaw|aiff|mid|midi|rmi|wav|ra)$" 2>/dev/null`
         
      #VIDEO:
      sumaVideo=`find ${TMPDIR} -type f | grep -E -c "*\.(avi|mov|movie|mpg|mpeg|qt|ram|mp4|wmv|ogv|AVI)$" 2>/dev/null`

      #COMPRIMIDOS:
      sumaComprimidos=`find ${TMPDIR} -type f | grep -E -c "*\.(gz|gzip|tar|tar.gz|tar.Z|tgz|zip|arj|rar|Z)$" 2>/dev/null`

      #EJECUTABLES
      sumaEjecutables=`find ${TMPDIR} -type f | grep -E -c "*\.(bas|bat|bin|cfg|dll|com|drv|exe|vxd|elf|pl|py|sh)$" 2>/dev/null`

      #CODIGOS FUENTES Y LIBRERIAS
      sumaCoFuLibrerias=`find ${TMPDIR} -type f | grep -E -c "*\.(a|c|cpp|diff|h|lo|o|so|jar|rkt)$" 2>/dev/null`
      
      #ARCHIVOS DEL SISTEMA:
      sumaArchSistema=`find ${TMPDIR} -type f | grep -E -c "*\.(conf|ko|lock|log|pid|socket|tmp)$" 2>/dev/null`

      suma=$(($sumaImagenes+$sumaDocumentos+$sumaAudio+$sumaVideo+$sumaComprimidos+$sumaEjecutables+$sumaCoFuLibrerias+$sumaArchSistema))
      		
      otros=$(($ArchivosReglaresT-$suma))
}

function NORMAL(){
   PROCESO
   if [ "$ArchivosReglaresT" == 0 ]; then
      echo "El directorio que usted ingreso es: "$TMPDIR
      echo "El directorio que usted ingreso se encuentra vacío."
   else
      echo "El directorio que usted ingreso es: "$TMPDIR > /var/
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
   fi
}

function PORCENTAJE(){
   PROCESO
   if [ "$ArchivosReglaresT" == 0 ]; then
      echo "El directorio que usted ingreso es: "$TMPDIR
      echo "El directorio que usted ingreso se encuentra vacío."
   else
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
   fi
}

function RECURSIVO(){
   PROCESO_RECURSIVO
   if [ "$ArchivosReglaresT" == 0 ]; then
      echo "El directorio que usted ingreso es: "$TMPDIR
      echo "El directorio que usted ingreso se encuentra vacío."
   else
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
   fi
}

function PORCENTAJE_RECURSIVO(){
   PROCESO_RECURSIVO
   if [ "$ArchivosReglaresT" == 0 ]; then
      echo "El directorio que usted ingreso es: "$TMPDIR
      echo "El directorio que usted ingreso se encuentra vacío."
   else
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
   fi
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

   if [ "$AYUDA" == 1 ]; then
      AYUDA
      exit 0
   elif [ -d "$TMPDIR" ]; then
      if [ "$PORCENTAJE" == 1 ]; then
         if [ "$DPROFUNDIDAD" == 1 ]; then
            PORCENTAJE_RECURSIVO
         else
            PORCENTAJE
         fi         
      else
         if [ "$DPROFUNDIDAD" == 1 ]; then
            RECURSIVO
         else
            NORMAL
         fi
      fi

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
