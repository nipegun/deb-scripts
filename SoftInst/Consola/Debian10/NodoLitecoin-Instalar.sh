#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software de dominio público".
# Puedes hacer lo que quieras con él porque es libre de verdad; no libre con condiciones como las licencias GNU y otras patrañas similares.
# Si se te llena la boca hablando de libertad entonces hazlo realmente libre.
# No tienes que aceptar ningún tipo de términos de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

#----------------------------------------------------------------------------------------
#  Script de NiPeGun para instalar la última versión estable de LiteCoin Core como Nodo
#----------------------------------------------------------------------------------------

ColorRojo='\033[1;31m'
ColorVerde='\033[1;32m'
FinColor='\033[0m'

# Buscar en litecoin.org una posible URL del archivo para Linux,
# quedarse con la versión de 64 bits,
# cortar del texto resultante los datos que no nos sirvan,
# dejar sólo la URL y asignarla a una variable
echo ""
echo -e "${ColorRojo}  Buscando la URL del archivo con la última versión para Linux 64 bits...${FinColor}"
echo ""
URLArchUltVersLinux64=$(wget -qO- --no-check-certificate https://litecoin.org/ | grep x86_64-linux-gnu.tar.gz | grep 64bit | cut -d\" -f2)

echo ""
echo -e "  URL encontrada: ${ColorVerde}$URLArchUltVersLinux64${FinColor}"
echo ""

NombreDelArchivo=${URLArchUltVersLinux64##*linux/}

echo ""
echo "  Intentando descargar el archivo: $NombreDelArchivo"
echo ""
cd /root
wget --no-check-certificate $URLArchUltVersLinux64

echo ""
echo "  Archivo descargado correctamente. Intentando la descompresión..."
echo ""

mkdir -p /NodoLitecoin/
tar xzf $NombreDelArchivo -C /NodoLitecoin

VersionDelCore=${NombreDelArchivo%-x86*}

echo ""
echo "  Contenido del archivo descomprimido en la carpeta /NodoLitecoin/$VersionDelCore"
echo ""

echo ""
echo "  Borrando el archivo comprimido..."
echo ""
rm /root/$NombreDelArchivo

echo ""
echo "  Instalando en /usr/local/bin la versión de Litecoin Core recién descargada"
echo ""
install -m 0755 -o root -g root -t /usr/local/bin /NodoLitecoin/$VersionDelCore/bin/*

echo ""
echo "  Creando la carpeta para el almacenamiento del nodo..."
echo ""
mkdir /NodoLitecoin/

echo ""
echo "  Agregando una línea al archivo de ComandosPostArranque"
echo "  para que se ejecute como demonio al arrancar el sistema..."
echo ""
echo "litecoind -daemon -datadir=/NodoLitecoin" >> /root/scripts/ComandosPostArranque.sh

echo ""
echo "  Creando el archivo de configuración..."
echo ""
mkdir /root/.litecoin
echo "rpcuser=litecoinuser" > /root/.litecoin/litecoin.conf
echo "rpcpassword=password" >> /root/.litecoin/litecoin.conf
echo "txindex=1" >> /root/.litecoin/litecoin.conf
echo "server=1" >> /root/.litecoin/litecoin.conf
echo "daemon=1" >> /root/.litecoin/litecoin.conf
echo "rpcbind=127.0.0.1" >> /root/.litecoin/litecoin.conf
echo "bind=127.0.0.1" >> /root/.litecoin/litecoin.conf
chmod 0600 /root/.litecoin/litecoin.conf 

echo ""
echo "  Hecho. La próxima vez que arranques el sistema"
echo "  el nodo Litecoin se iniciará de forma automática"
echo ""
echo "  Para detener en cuelquier momento en nodo ejecuta:"
echo "  litecoin-cli stop"
echo ""

