#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software de dominio público".
# Puedes hacer lo que quieras con él porque es libre de verdad; no libre con condiciones como las licencias GNU y otras patrañas similares.
# Si se te llena la boca hablando de libertad entonces hazlo realmente libre.
# No tienes que aceptar ningún tipo de términos de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

#----------------------------------------------------------------------
#  Script de NiPeGun para instalar y configurar OpenVPN Access Server
#----------------------------------------------------------------------

ColorRojo='\033[1;31m'
ColorVerde='\033[1;32m'
FinColor='\033[0m'

IPDelServidor=$(hostname -I)

echo ""
echo -e "${ColorVerde}Instalando paquetes requeridos...${FinColor}"
echo ""
apt-get -y install net-tools

echo ""
echo -e "${ColorVerde}Instalando OpenVPN Access Server...${FinColor}"
echo ""
mkdir -p /root/Paquetes
wget --no-check-certificate -P /root/Paquetes/ https://openvpn.net/downloads/openvpn-as-latest-debian9.amd_64.deb
dpkg -i /root/Paquetes/openvpn-as-latest-debian9.amd_64.deb
echo -e "openvpn\nopenvpn" | passwd openvpn

echo ""
echo -e "${ColorVerde}OpenVPN Access Server se ha terminado de instalar...${FinColor}"
echo ""
echo "  Podrás conectarte al Web UI de OpenVPN Access Server mediante las siguientes direcciones:"
echo "  $IPDelServidor:943       (para los usuarios normales)"
echo "  $IPDelServidor:943/admin (para los administradores)"
echo ""
echo "  Para la primera conexión utiliza el usuario openvpn y el password openvpn."
echo ""
echo "  Cambia el password en cuanto puedas."
echo ""
echo "  Para ver el log ejecuta tailf /var/log/openvpnas.log"
echo ""

