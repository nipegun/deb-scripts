#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software de dominio público".
# Puedes hacer lo que quieras con él porque es libre de verdad; no libre con condiciones como las licencias GNU y otras patrañas similares.
# Si se te llena la boca hablando de libertad entonces hazlo realmente libre.
# No tienes que aceptar ningún tipo de términos de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

#----------------------------------------------------------
#  Script de NiPeGun para instalar y configurar NextCloud
#----------------------------------------------------------

CantArgsCorrectos=1
ArgsInsuficientes=65

if [ $# -ne $CantArgsCorrectos ]
  then
    echo ""
    echo "------------------------------------------------------------------------------"
    echo "Mal uso del script."
    echo ""
    echo "El uso correcto sería: InstalarYConfigurarServidorNextCloud [Password]"
    echo ""
    echo "Ejemplo:"
    echo ' InstalarYConfigurarServidorNextCloud ausdhg76atsd'
    echo "------------------------------------------------------------------------------"
    echo ""
    exit $ArgsInsuficientes
  else
    echo ""
    echo "------------------------------------------------------"
    echo "  Instalando y configurando el servidor NextCloud..."
    echo "------------------------------------------------------"
    echo ""
    apt-get -y update
    tasksel install web-server
    systemctl enable apache2
    apt-get -y install mariadb-server
    systemctl enable mysql
    apt-get -y install php7.0-xml php7.0-cgi php7.0-cli php7.0-gd php7.0-curl php7.0-zip php7.0-mysql php7.0-mbstring 
    systemctl start apache2
    systemctl start mysql
    mysql_secure_installation
    cbddyu nextcloud nextcloud $1
    mkdir /var/www/html/nextcloud
    cd /var/www/html
    apt-get -y install wget
    wget --no-check-certificate http://hacks4geeks.com/_/premium/descargas/debian/root/paquetes/nextcloud/nextcloud.zip
    apt-get -y install unzip
    unzip nextcloud.zip
    
fi
