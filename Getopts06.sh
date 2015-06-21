#!/bin/bash

if [ "$0"  == ./Getopts06.sh -a ! -d "$1" ]; then
	logger -p error -t GESTOR_ALARMAS Falta Argumento válido
	echo "Missing dirname ("./Getopts06.sh --help" for help)"


elif [ "$0"  == ./Getopts06.sh -a -d "$1" ] ; then
	TMPDIR=$1
   echo ""
	echo "El directorio que usted ingreso es: "$TMPDIR

		ArchivosReglaresT=`find ${TMPDIR} -type f | egrep -c "*"`
      echo "La cantidad total de archivos regulares es: "${ArchivosReglaresT}
      echo ""

      #IMAGENES:
      png=`find ${TMPDIR} -type f | grep -E -c "*\.png$"`

      jpg=`find ${TMPDIR} -type f | egrep -c "*\jpg"`
      raw=`find ${TMPDIR} -type f | egrep -c "*\raw"`
      psd=`find ${TMPDIR} -type f | egrep -c "*\psd"`
      tiff=`find ${TMPDIR} -type f | egrep -c "*\tiff"`
      xcf=`find ${TMPDIR} -type f | egrep -c "*\xcf"`
      gif=`find ${TMPDIR} -type f | egrep -c "*\gif"`
      eps=`find ${TMPDIR} -type f | egrep -c "*\eps"`
      dng=`find ${TMPDIR} -type f | egrep -c "*\dng"`
      psb=`find ${TMPDIR} -type f | egrep -c "*\psb"`
      jp2=`find ${TMPDIR} -type f | egrep -c "*\jp2"`
      		sumaImagenes=$(($png+$jpg+$raw+$psd+$tiff+$xcf+$gif+$eps+$dng+$psb+$jp2))
            echo "IMAGENES: "$sumaImagenes

      #DOCUMENTOS
		#find ${TMPDIR} -type f | egrep "[A-Za-z]\.txt" > /var/tmp/Proyecto/aux.txt
		#txt=`egrep -c "*\.txt" /var/tmp/Proyecto/aux.txt`

      txt=`find ${TMPDIR} -type f | egrep -c "*\.txt"`
      odf=`find ${TMPDIR} -type f | egrep -c "*\.odf"`
      odt=`find ${TMPDIR} -type f | egrep -c "*\.odt"`
      ods=`find ${TMPDIR} -type f | egrep -c "*\.ods"`
      odg=`find ${TMPDIR} -type f | egrep -c "*\.odg"`
      odp=`find ${TMPDIR} -type f | egrep -c "*\.odp"`
      pdf=`find ${TMPDIR} -type f | egrep -c "*\.pdf"`
      ott=`find ${TMPDIR} -type f | egrep -c "*\.ott"`
      fodt=`find ${TMPDIR} -type f | egrep -c "*\.fodt"`
      uot=`find ${TMPDIR} -type f | egrep -c "*\.uot"`
      docx=`find ${TMPDIR} -type f | egrep -c "*\.docx"`
      xml=`find ${TMPDIR} -type f | egrep -c "*\.xml"`
      doc=`find ${TMPDIR} -type f | egrep -c "*\.doc"`
      dot=`find ${TMPDIR} -type f | egrep -c "*\.dot"`
      html=`find ${TMPDIR} -type f | egrep -c "*\.html"`
      rtf=`find ${TMPDIR} -type f | egrep -c "*\.rtf"`
         sumaDocumentos=$(($txt+$odf+$odt+$ods+$odg+$odp+$pdf+$ott+$fodt+$uot+$docx+$xml+$doc+$dot+$html+$rtf))
         echo "DOCUMENTOS: "$sumaDocumentos



		find ${TMPDIR} -type f | egrep "mp3" > /var/tmp/Proyecto/pdf.txt
		mp3=`egrep -c "mp3" /var/tmp/Proyecto/pdf.txt`


      		suma=$(($txt+$pdf+$mp3+$png+$odt))
      		otros=$(($ArchivosReglaresT-$suma))

      echo ""
     	echo "lo que guarda otros es: "${otros}
	
echo "Es un directoriooooo" 
fi

exit 0
