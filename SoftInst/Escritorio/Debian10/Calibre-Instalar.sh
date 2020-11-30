#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software de dominio público".
# Puedes hacer lo que quieras con él porque es libre de verdad; no libre con condiciones como las licencias GNU y otras patrañas similares.
# Si se te llena la boca hablando de libertad entonces hazlo realmente libre.
# No tienes que aceptar ningún tipo de términos de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

#-----------------------------------------------------------
#  Script de NiPeGun para instalar Calibre en Debian 9
#-----------------------------------------------------------

ColorRojo='\033[1;31m'
ColorVerde='\033[1;32m'
FinColor='\033[0m'

echo ""
echo "  Instalando Calibre..."
echo ""
echo "  Actualizando el contenido de los repositorios..."
echo ""
apt-get -y update

echo ""
echo "  Instalando los paquetes necesarios..."
echo ""
apt-get -y install xdg-utils wget xz-utils python xvfb imagemagick

mkdir /root/paquetes/calibre
cd /root/paquetes/calibre
wget --no-check-certificate https://download.calibre-ebook.com/linux-installer.sh
sh /root/paquetes/calibre/linux-installer.sh

echo "[Unit]" > /etc/systemd/system/calibre-server.service
echo " Description=Servidor Calibre" >> /etc/systemd/system/calibre-server.service
echo " After=network.target" >> /etc/systemd/system/calibre-server.service
echo "" >> /etc/systemd/system/calibre-server.service
echo "[Service]" >> /etc/systemd/system/calibre-server.service
echo " Type=simple" >> /etc/systemd/system/calibre-server.service
echo " User=root" >> /etc/systemd/system/calibre-server.service
echo " Group=root" >> /etc/systemd/system/calibre-server.service
echo ' ExecStart=/opt/calibre/calibre-server "/Calibre"' >> /etc/systemd/system/calibre-server.service
#echo ' ExecStart=/opt/calibre/calibre-server "/Calibre" --enable-auth --access-log /Calibre/Access.log' >> /etc/systemd/system/calibre-server.service
echo "" >> /etc/systemd/system/calibre-server.service
echo "[Install]" >> /etc/systemd/system/calibre-server.service
echo " WantedBy=default.target" >> /etc/systemd/system/calibre-server.service

systemctl enable calibre-server