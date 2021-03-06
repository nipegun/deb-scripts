#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software de dominio público".
# Puedes hacer lo que quieras con él porque es libre de verdad; no libre con condiciones como las licencias GNU y otras patrañas similares.
# Si se te llena la boca hablando de libertad entonces hazlo realmente libre.
# No tienes que aceptar ningún tipo de términos de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

#--------------------------------------------------------------------
#  SCRIPT DE NIPEGUN PARA BORRAR TAGs DE ARCHIVOS MP3 DE UNA CARPETA
#  X Y TAMBIÉN DE SUS SUB-CARPETAS DE FORMA RECURSIVA
#----------------------------------------------------------------------

EXPECTED_ARGS=1
E_BADARGS=65

if [ $# -ne $EXPECTED_ARGS ]
  then
    echo ""
    echo "##################################################"
    echo "Mal uso del script."
    echo ""
    echo "El uso correcto sería: $0 ruta"
    echo ""
    echo "Ejemplo:"
    echo "&0 /etc/"
    echo "##################################################"
    echo ""
    exit $E_BADARGS
  else
    echo ""
    apt-get -qq -y install eyed3
    eyeD3 --remove-all $1
    echo ""
fi

