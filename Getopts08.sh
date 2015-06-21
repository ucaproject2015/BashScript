#!/bin/bash

AYUDA=0
PORCENTAJE=0
DPROFUNDIDAD=0
TMPDIR=

   while getopts :dhp: arg
      do
      case $arg in
         d)   DPROFUNDIDAD=1 ;;
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
                 DPROFUNDIDAD=1
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
      echo "*Mostrar todo normal*"
      exit 0
   elif [ "$AYUDA" == 1 ]; then
      echo "*Mostrar sólo ayuda*"
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
   if [ "$PORCENTAJE" == 1 -a "$DPROFUNDIDAD" == 1 ]; then
      echo "*Mostrar porcentaje 1 y recursivo*"
   elif [ "$PORCENTAJE" == 1 ]; then
      echo "*Mostrar porcentaje 1*"
   elif [ "$DPROFUNDIDAD" == 1 ]; then
      echo "*Mostrar recursivo*"
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

echo "Cantidad: "$#
echo "Ayuda: "$AYUDA
echo "Porcentaje: "$PORCENTAJE
echo "Profundidad: "$DPROFUNDIDAD
echo "TMPDIR: "$TMPDIR

exit 0






#gato=$#
#$1=$gato

#echo "kokokoko $1"

#if [ "$0"  == ./Getopts08.sh -a ! -d "$gato" ]; then
#	logger -p error -t GESTOR_ALARMAS Falta Argumento válido
#	echo "Missing dirname ("./Getopts07.sh --help" for help)"


if [ "$0"  == ./Getopts08.sh -a -d "$gato" ] ; then
	TMPDIR=$gato
   echo ""
	echo "El directorio que usted ingreso es: "$TMPDIR

	ArchivosReglaresT=`find ${TMPDIR} -type f | egrep -c "*"`
      echo "La cantidad total de archivos regulares es: "${ArchivosReglaresT}
      echo ""

      #IMAGENES:
      png=`find ${TMPDIR} -type f | grep -E -c "*\.png$"`
      cdr=`find ${TMPDIR} -type f | grep -E -c "*\.cdr$"`
      cpt=`find ${TMPDIR} -type f | grep -E -c "*\.cpt$"`
      jpeg=`find ${TMPDIR} -type f | grep -E -c "*\.jpeg$"`
      jfif=`find ${TMPDIR} -type f | grep -E -c "*\.jfif$"`
      ppt=`find ${TMPDIR} -type f | grep -E -c "*\.ppt$"`
      pps=`find ${TMPDIR} -type f | grep -E -c "*\.pps$"`
      jpg=`find ${TMPDIR} -type f | grep -E -c "*\.jpg$"`
      raw=`find ${TMPDIR} -type f | grep -E -c "*\.raw$"`
      psd=`find ${TMPDIR} -type f | grep -E -c "*\.psd$"`
      tiff=`find ${TMPDIR} -type f | grep -E -c "*\.tiff$"`
      xcf=`find ${TMPDIR} -type f | grep -E -c "*\.xcf$"`
      gif=`find ${TMPDIR} -type f | grep -E -c "*\.gif$"`
      eps=`find ${TMPDIR} -type f | grep -E -c "*\.eps$"`
      dng=`find ${TMPDIR} -type f | grep -E -c "*\.dng$"`
      psb=`find ${TMPDIR} -type f | grep -E -c "*\.psb$"`
      jp2=`find ${TMPDIR} -type f | grep -E -c "*\.jp2$"`
      JPG=`find ${TMPDIR} -type f | grep -E -c "*\.JPG$"`
      		sumaImagenes=$(($png+$cdr+$cpt+$jpeg+$jfif+$ppt+$pps+$jpg+$raw+$psd+$tiff+$xcf+$gif+$eps+$dng+$psb+$jp2+$JPG))
            echo "IMAGENES: "$sumaImagenes

      #DOCUMENTOS:
      txt=`find ${TMPDIR} -type f | grep -E -c "*\.txt$"`
      css=`find ${TMPDIR} -type f | grep -E -c "*\.css$"`
      htm=`find ${TMPDIR} -type f | grep -E -c "*\.htm$"`
      ps=`find ${TMPDIR} -type f | grep -E -c "*\.ps$"`
      xlsx=`find ${TMPDIR} -type f | grep -E -c "*\.xlsx$"`
      ppt=`find ${TMPDIR} -type f | grep -E -c "*\.txt$"`
      odf=`find ${TMPDIR} -type f | grep -E -c "*\.odf$"`
      odt=`find ${TMPDIR} -type f | grep -E -c "*\.odt$"`
      ods=`find ${TMPDIR} -type f | grep -E -c "*\.ods$"`
      odg=`find ${TMPDIR} -type f | grep -E -c "*\.odg$"`
      odp=`find ${TMPDIR} -type f | grep -E -c "*\.odp$"`
      pdf=`find ${TMPDIR} -type f | grep -E -c "*\.pdf$"`
      ott=`find ${TMPDIR} -type f | grep -E -c "*\.ott$"`
      fodt=`find ${TMPDIR} -type f | grep -E -c "*\.fodt$"`
      uot=`find ${TMPDIR} -type f | grep -E -c "*\.uot$"`
      docx=`find ${TMPDIR} -type f | grep -E -c "*\.docx$"`
      xml=`find ${TMPDIR} -type f | grep -E -c "*\.xml$"`
      doc=`find ${TMPDIR} -type f | grep -E -c "*\.doc$"`
      dot=`find ${TMPDIR} -type f | grep -E -c "*\.dot$"`
      html=`find ${TMPDIR} -type f | grep -E -c "*\.html$"`
      rtf=`find ${TMPDIR} -type f | grep -E -c "*\.rtf$"`
         sumaDocumentos=$(($txt+$odf+$odt+$ods+$odg+$odp+$pdf+$ott+$fodt+$uot+$docx+$xml+$doc+$dot+$html+$rtf))
         echo "DOCUMENTOS: "$sumaDocumentos

      #AUDIO:
      cda=`find ${TMPDIR} -type f | grep -E -c "*\.cda$"`
      mp3=`find ${TMPDIR} -type f | grep -E -c "*\.mp3$"`
      ogg=`find ${TMPDIR} -type f | grep -E -c "*\.ogg$"`
      wav=`find ${TMPDIR} -type f | grep -E -c "*\.wav$"`
      au=`find ${TMPDIR} -type f | grep -E -c "*\.au$"`
      uLaw=`find ${TMPDIR} -type f | grep -E -c "*\.uLaw$"`
      MuLaw=`find ${TMPDIR} -type f | grep -E -c "*\.MuLaw$"`
      aiff=`find ${TMPDIR} -type f | grep -E -c "*\.aiff$"`
      mid=`find ${TMPDIR} -type f | grep -E -c "*\.mid$"`
      midi=`find ${TMPDIR} -type f | grep -E -c "*\.midi$"`
      imi=`find ${TMPDIR} -type f | grep -E -c "*\.rmi$"`
      wav=`find ${TMPDIR} -type f | grep -E -c "*\.wav$"`
      ra=`find ${TMPDIR} -type f | grep -E -c "*\.ra$"`
         sumaAudio=$(($cda+$mp3+$ogg+$wav+$au+$uLaw+$MuLaw+$aiff+$mid+$midi+$rmi+$wav+$ra))
         echo "AUDIO: "$sumaAudio
         
      #VIDEO:
      avi=`find ${TMPDIR} -type f | grep -E -c "*\.avi$"`
      mov=`find ${TMPDIR} -type f | grep -E -c "*\.mov$"`
      movie=`find ${TMPDIR} -type f | grep -E -c "*\.movie$"`
      mpg=`find ${TMPDIR} -type f | grep -E -c "*\.mpg$"`
      mpeg=`find ${TMPDIR} -type f | grep -E -c "*\.mpeg$"`
      qt=`find ${TMPDIR} -type f | grep -E -c "*\.qt$"`
      ram=`find ${TMPDIR} -type f | grep -E -c "*\.ram$"`
      mp4=`find ${TMPDIR} -type f | grep -E -c "*\.mp4$"`
      wmv=`find ${TMPDIR} -type f | grep -E -c "*\.wmv$"`
      ogv=`find ${TMPDIR} -type f | grep -E -c "*\.ogv$"`
      AVI=`find ${TMPDIR} -type f | grep -E -c "*\.AVI$"`
         sumaVideo=$(($avi+$mov+$movie+$mpg+$mpeg+$qt+$ram+$mp4+$wmv+$ogv+$AVI))
         echo "VIDEO: "$sumaVideo

      #COMPRIMIDOS:
      gz=`find ${TMPDIR} -type f | grep -E -c "*\.gz$"`
      gzip=`find ${TMPDIR} -type f | grep -E -c "*\.gzip$"`
      tar=`find ${TMPDIR} -type f | grep -E -c "*\.tar$"`
      targz=`find ${TMPDIR} -type f | grep -E -c "*\.tar.gz$"`
      tarZ=`find ${TMPDIR} -type f | grep -E -c "*\.tar.Z$"`
      tgz=`find ${TMPDIR} -type f | grep -E -c "*\.tgz$"`
      zip=`find ${TMPDIR} -type f | grep -E -c "*\.zip$"`
      arj=`find ${TMPDIR} -type f | grep -E -c "*\.arj$"`
      rar=`find ${TMPDIR} -type f | grep -E -c "*\.rar$"`
      z=`find ${TMPDIR} -type f | grep -E -c "*\.Z$"`     
         sumaComprimidos=$(($gz+$gzip+$tar+$targz+$tarZ+$tgz+$zip+$arj+$rar+$z))
         echo "COMPRIMIDOS: "$sumaComprimidos

		#find ${TMPDIR} -type f | egrep "mp3" > /var/tmp/Proyecto/pdf.txt
		#mp3=`egrep -c "mp3" /var/tmp/Proyecto/pdf.txt`

      #EJECUTABLES
      bas=`find ${TMPDIR} -type f | grep -E -c "*\.bas$"`
      bat=`find ${TMPDIR} -type f | grep -E -c "*\.bat$"`
      bin=`find ${TMPDIR} -type f | grep -E -c "*\.bin$"`
      cfg=`find ${TMPDIR} -type f | grep -E -c "*\.cfg$"`
      dll=`find ${TMPDIR} -type f | grep -E -c "*\.dll$"`
      com=`find ${TMPDIR} -type f | grep -E -c "*\.com$"`
      drv=`find ${TMPDIR} -type f | grep -E -c "*\.drv$"`
      exe=`find ${TMPDIR} -type f | grep -E -c "*\.exe$"`
      vxd=`find ${TMPDIR} -type f | grep -E -c "*\.vxd$"`
      elf=`find ${TMPDIR} -type f | grep -E -c "*\.elf$"` 
      pl=`find ${TMPDIR} -type f | grep -E -c "*\.pl$"`
      py=`find ${TMPDIR} -type f | grep -E -c "*\.py$"`
      sh=`find ${TMPDIR} -type f | grep -E -c "*\.sh$"`
          sumaEjecutables=$(($bas+$bat+$bin+$cfg+$dlll+$com+$drv+$exe+$vxd+$elf+$pl+$py+$sh))
         echo "EJECUTABLES: "$sumaEjecutables

      #CODIGOS FUENTES Y LIBRERIAS
      a=`find ${TMPDIR} -type f | grep -E -c "*\.a$"`
      c=`find ${TMPDIR} -type f | grep -E -c "*\.c$"`
      cpp=`find ${TMPDIR} -type f | grep -E -c "*\.cpp$"`
      diff=`find ${TMPDIR} -type f | grep -E -c "*\.diff$"`
      h=`find ${TMPDIR} -type f | grep -E -c "*\.h$"`
      lo=`find ${TMPDIR} -type f | grep -E -c "*\.lo$"`
      o=`find ${TMPDIR} -type f | grep -E -c "*\.o"`
      so=`find ${TMPDIR} -type f | grep -E -c "*\.so$"`
      jar=`find ${TMPDIR} -type f | grep -E -c "*\.jar$"`
      rkt=`find ${TMPDIR} -type f | grep -E -c "*\.rkt$"`
         sumaCoFuLibrerias=$(($a+$c+$cpp+$diff+$h+$lo+$o+$so))
         echo "LIBRERIAS: "$sumaCoFuLibrerias
      
      #ARCHIVOS DEL SISTEMA:
      conf=`find ${TMPDIR} -type f | grep -E -c "*\.conf$"`
      ko=`find ${TMPDIR} -type f | grep -E -c "*\.ko$"`
      lock=`find ${TMPDIR} -type f | grep -E -c "*\.lock$"`
      log=`find ${TMPDIR} -type f | grep -E -c "*\.log$"`
      pid=`find ${TMPDIR} -type f | grep -E -c "*\.pid"`
      socket=`find ${TMPDIR} -type f | grep -E -c "*\.socket$"`
      tmp=`find ${TMPDIR} -type f | grep -E -c "*\.tmp$"`
         sumaArchSistema=$(($conf+$ko+$lock+$log+$pid+$socket+$tmp))
         echo "ARCHIVOS DEL SISTEMA: "$sumaArchSistema


      		suma=$(($sumaImagenes+$sumaDocumentos+$sumaAudio+$sumaVideo+$sumaComprimidos+$sumaEjecutables+$sumaCoFuLibrerias+$sumaArchSistema))
      		otros=$(($ArchivosReglaresT-$suma))

      echo ""
     	echo "lo que guarda otros es: "${otros}
	   echo "Es un directoriooooo"

#elif [ "$0"  == ./Getopts07.sh -a -d "$2" ] ; then
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
         \?)  echo "Opción inválida -$OPTARG ingnorada. holis" >>error.txt 
              logger -p auth.error -t GESTOR_ALARMAS sdgsdfg
              ;;
      esac
done     














 
fi
exit 0

























