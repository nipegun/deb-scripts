#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software de dominio público".
# Puedes hacer lo que quieras con él porque es libre de verdad; no libre con condiciones como las licencias GNU y otras patrañas similares.
# Si se te llena la boca hablando de libertad entonces hazlo realmente libre.
# No tienes que aceptar ningún tipo de términos de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

#----------------------------------------------------------------------------
#  Script de NiPeGun para instalar el servidor gaming de Minecraft mcserver
#----------------------------------------------------------------------------

ColorRojo='\033[1;31m'
ColorVerde='\033[1;32m'
FinColor='\033[0m'

echo ""
echo -e "${ColorVerde}Instalando el servidor mcserver...${FinColor}"
echo ""

echo ""
echo "  Instalando dependencias..."
echo ""
dpkg --add-architecture i386
apt-get -y update
apt-get -y install mailutils
apt-get -y install postfix
apt-get -y install curl
apt-get -y install wget
apt-get -y install file
apt-get -y install tar
apt-get -y install bzip2
apt-get -y install gzip
apt-get -y install unzip
apt-get -y install bsdmainutils
apt-get -y install python
apt-get -y install util-linux
apt-get -y install ca-certificates
apt-get -y install binutils
apt-get -y install bc
apt-get -y install jq
apt-get -y install tmux
apt-get -y install netcat
apt-get -y install default-jre

# Comandos a ejecutar manualmente
# adduser mcserver
# su - mcserver
# wget -O linuxgsm.sh https://linuxgsm.sh
# chmod +x linuxgsm.sh
# bash linuxgsm.sh mcserver
# ./mcserver install
