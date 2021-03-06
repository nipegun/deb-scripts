#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software de dominio público".
# Puedes hacer lo que quieras con él porque es libre de verdad; no libre con condiciones como las licencias GNU y otras patrañas similares.
# Si se te llena la boca hablando de libertad entonces hazlo realmente libre.
# No tienes que aceptar ningún tipo de términos de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

#------------------------------------------------------
#  SCRIPT DE NIPEGUN PARA INSTALAR Y CONFIGURAR BIND9
#------------------------------------------------------

echo ""
echo "-----------------------------------"
echo "  INSTALANDO Y CONFIGURANDO bind9"
echo "-----------------------------------"
echo ""
apt-get -y install bind9 dnsutils

echo "//DIRECTA"
echo "zone "dnsbind.com" {"
echo "        type master;"
echo "        file "/etc/bind/miszonas/db.directa";"
echo "};"
echo ""
echo "//INVERSA"
echo "zone "1.168.192.in-addr-arpa" {"
echo "        type master;"
echo "        file "/etc/bind/miszonas/db.inversa";"
echo "};"

mkdir /etc/bind/miszonas/
cp /etc/bind/db.local /etc/bind/miszonas/db.directa

named-checkzone dnsbind.com /etc/bind/miszonas/db.directa

cp /etc/bind/db.127 /etc/bind/miszonas/db.inversa
named-checkzone 1.168.192.in-addr-arpa /etc/bind/miszonas/db.inversa

# FORWARDERS
nano /etc/bind/named.conf.options

# RESOLV
echo "nameserver 212.166.132.117" > /etc/resolv.conf
echo "domain dnsbind.com" >> /etc/resolv.conf
echo "search dnsbind.com" >> /etc/resolv.conf
echo ""
cat /etc/resolv.conf
echo ""
chattr +i /etc/resolv.conf

