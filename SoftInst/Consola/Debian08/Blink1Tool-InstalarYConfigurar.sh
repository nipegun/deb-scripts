#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software de dominio público".
# Puedes hacer lo que quieras con él porque es libre de verdad; no libre con condiciones como las licencias GNU y otras patrañas similares.
# Si se te llena la boca hablando de libertad entonces hazlo realmente libre.
# No tienes que aceptar ningún tipo de términos de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

#-------------------------------------------------------------------------
#  SCRIPT DE NIPEGUN PARA INSTALAR Y CONFIGURAR LA HERRAMIENTA DE BLINK1
#-------------------------------------------------------------------------

echo ""
echo "----------------------------------------------"
echo "  INSTALACIÓN Y CONFIGURACIÓN DE blink1-tool"
echo "----------------------------------------------"
echo ""
sleep 3
apt-get -y install pkg-config libusb-1.0-0-dev
mkdir /root/git/
cd /root/git/
git clone https://github.com/todbot/blink1.git
cd /root/git/blink1/commandline
make

