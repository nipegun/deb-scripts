#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software de dominio público".
# Puedes hacer lo que quieras con él porque es libre de verdad; no libre con condiciones como las licencias GNU y otras patrañas similares.
# Si se te llena la boca hablando de libertad entonces hazlo realmente libre.
# No tienes que aceptar ningún tipo de términos de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

#-------------------------------------------------------------------------
#  SCRIPT DE NIPEGUN PARA INSTALAR Y CONFIGURAR LAS MONITORIZACIÓN SMART
#-------------------------------------------------------------------------

EXPECTED_ARGS=2
E_BADARGS=65

if [ $# -ne $EXPECTED_ARGS ]
  then
    echo ""
    echo "--------------------------------------------------------------------------------------------"
    echo "  Mal uso del script."
    echo ""
    echo "  El uso correcto sería:"
    echo "  $0 DiscoAMonitorizar MailANotificar"
    echo ""
    echo "  Ejemplo:"
    echo "  $0 /dev/sda pepe@pepe.com"
    echo "--------------------------------------------------------------------------------------------"
    echo ""
    exit $E_BADARGS
  else
    echo ""
    echo "----------------------------------------"
    echo "  PREPARANDO LA MONITORIZACIÓN DEL SSD"
    echo "----------------------------------------"
    echo ""
    echo "---------------------------------------"
    echo "  INSTALANDO EL PAQUETE smartmontools"
    echo "---------------------------------------"
    echo ""
    apt-get -y install smartmontools
    
    echo ""
    echo "---------------------------------------"
    echo "  ACTIVANDO SMART EN EL DISCO $1"
    echo "---------------------------------------"
    echo ""
    smartctl -s on $1
    
    echo ""
    echo "----------------------------"
    echo "  CONFIGURANDO EL SERVICIO"
    echo "----------------------------"
    echo ""
    sed -i -e 's|#start_smartd=yes|start_smartd=yes|g' /etc/default/smartmontools
    cp /etc/smartd.conf /etc/smartd.conf.bak
    echo "$1 -a -m $2 -M exec /root/deb-scripts/nofadis" > /etc/smartd.conf
    echo ""
fi

