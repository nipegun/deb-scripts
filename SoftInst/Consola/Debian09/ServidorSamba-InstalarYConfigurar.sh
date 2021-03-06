#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software de dominio público".
# Puedes hacer lo que quieras con él porque es libre de verdad; no libre con condiciones como las licencias GNU y otras patrañas similares.
# Si se te llena la boca hablando de libertad entonces hazlo realmente libre.
# No tienes que aceptar ningún tipo de términos de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

#------------------------------------------------------------------
#  Script de NiPeGun para instalar y configurar el servidor Samba
#
#  Para que los usuarios puedan utilizar samba es necesario crearles
#  una contraseña para samba al usuario con:
#  smbpasswd -a NombreDeUsuario
#  La contraseña samba puede ser distinta a la de la propia cuenta
#  de usuario
#-------------------------------------------------------------------

ColorRojo='\033[1;31m'
ColorVerde='\033[1;32m'
FinColor='\033[0m'

EXPECTED_ARGS=3
E_BADARGS=65

if [ $# -ne $EXPECTED_ARGS ]
  then
    echo ""
    echo "---------------------------------------------------------------"
    echo -e "${ColorRojo}Mal uso del script.${FinColor} El uso correcto sería:"
    echo -e "$0 ${ColorVerde}[GrupoDeTrabajo] [NombreNetBios] [Usuario]${FinColor}"
    echo ""
    echo "Ejemplo:"
    echo "$0 oficina ordenador pepe"
    echo "---------------------------------------------------------------"
    echo ""
    exit $E_BADARGS
  else
    apt-get update && apt-get -y install dialog
    menu=(dialog --timeout 5 --checklist "Instalación de la compartición Samba:" 22 76 16)
    opciones=(1 "Instalar los paquetes necesarios" on
              2 "Configurar las opciones globales" on
              3 "Configurar la compartición Pública anónima" off
              4 "Configurar la compartición de la carpeta del usuario" off
              5 "Configurar la compartición Multimedia" off
              6 "Configurar la compartición de Webs" off
              7 "Reiniciar el demonio y mostrar el estado" on)
    choices=$("${menu[@]}" "${opciones[@]}" 2>&1 >/dev/tty)
    clear

    for choice in $choices
      do
        case $choice in

          1)
            echo ""
            echo -e "${ColorVerde}Instalando los paquetes necesarios...${FinColor}"
            echo ""
            apt-get -y install libcups2 samba samba-common cups
            cp /etc/samba/smb.conf /etc/samba/smb.conf.bak
          ;;

          2)
            echo ""
            echo -e "${ColorVerde}Configurando las opciones globales...${FinColor}"
            echo ""
            echo "[global]" > /etc/samba/smb.conf
            echo "  workgroup = $1" >> /etc/samba/smb.conf
            echo "  server string = Servidor Samba %v" >> /etc/samba/smb.conf
            echo "  wins support = yes" >> /etc/samba/smb.conf
            echo "  netbios name = $2" >> /etc/samba/smb.conf
            echo "  security = user" >> /etc/samba/smb.conf
            echo "  guest account = nobody" >> /etc/samba/smb.conf
            echo "  map to guest = bad user" >> /etc/samba/smb.conf
            echo "  dns proxy = no" >> /etc/samba/smb.conf
            echo "  hosts allow = 192.168.0. 192.168.1. 192.168.2. 192.168.3." >> /etc/samba/smb.conf
            echo "  hosts deny = 192.168.1.255" >> /etc/samba/smb.conf
            echo "  #interfaces = lo eth1 wlan0 br0" >> /etc/samba/smb.conf
            echo "  #bind interfaces only = yes" >> /etc/samba/smb.conf
            echo "" >> /etc/samba/smb.conf
          ;;

          3)
            echo ""
            echo -e "${ColorVerde}Creando la compartición para la carpeta pública...${FinColor}"
            echo ""
            echo "[publica]" >> /etc/samba/smb.conf
            mkdir /publica/
            chown nobody:nogroup /publica/
            chmod -Rv 777 /publica/
            echo "  path = /publica/" >> /etc/samba/smb.conf
            echo "  comment = Compartida para usuarios anónimos" >> /etc/samba/smb.conf
            echo "  browseable = yes" >> /etc/samba/smb.conf
            echo "  public = yes" >> /etc/samba/smb.conf
            echo "  writeable = no" >> /etc/samba/smb.conf
            echo "  guest ok = yes" >> /etc/samba/smb.conf
            echo "" >> /etc/samba/smb.conf
          ;;
          4)
            echo ""
            echo -e "${ColorVerde}Creando la compartición para la carpeta del usuario...${FinColor}"
            echo ""
            echo "[Usuario $3]" >> /etc/samba/smb.conf
            echo "  path = /home/$3/" >> /etc/samba/smb.conf
            echo "  comment = Carpeta del usuario $3" >> /etc/samba/smb.conf
            echo "  browsable = yes" >> /etc/samba/smb.conf
            echo "  read only = no" >> /etc/samba/smb.conf
            echo "  valid users = $3" >> /etc/samba/smb.conf
          ;;

          5)
            echo ""
            echo -e "${ColorVerde}Creando la compartición de una carpeta Multimedia...${FinColor}"
            echo ""
            echo "[Multimedia]" >> /etc/samba/smb.conf
            echo "  path = /Multimedia/" >> /etc/samba/smb.conf
            echo "  comment = Pelis, Serie, Música, libros, etc" >> /etc/samba/smb.conf
            echo "  browseable = yes" >> /etc/samba/smb.conf
            echo "  public = yes" >> /etc/samba/smb.conf
            echo "  writeable = no" >> /etc/samba/smb.conf
            echo "  guest ok = yes" >> /etc/samba/smb.conf
            echo "" >> /etc/samba/smb.conf
          ;;

          6)
            echo ""
            echo -e "${ColorVerde}Creando la compartición de la carpeta de las Webs...${FinColor}"
            echo ""
            echo "[Webs]" >> /etc/samba/smb.conf
            echo "  path = /var/www/" >> /etc/samba/smb.conf
            echo "  comment = Webs" >> /etc/samba/smb.conf
            echo "  browseable = yes" >> /etc/samba/smb.conf
            echo "  public = no" >> /etc/samba/smb.conf
            echo "  guest ok = no" >> /etc/samba/smb.conf
            echo "  write list = www-data" >> /etc/samba/smb.conf
            echo "" >> /etc/samba/smb.conf
          ;;

          7)
            echo ""
            echo "  AHORA DEBERÁS INGRESAR 2 VECES LA NUEVA CONTRASEÑA SAMBA PARA EL USUARIO $3."
            echo "  PUEDE SER DISTINTA A LA DE LA PROPIA CUENTA DE USUARIO PERO SI PONES UNA"
            echo "  DISTINTA, CUANDO TE CONECTES A LA CARPETA COMPARTIDA, ACUÉRDATE DE UTILIZAR"
            echo "  LA CONTRASEÑA QUE PONGAS AHORA Y NO LA DE LA CUENTA DE USUARIO."
            echo ""
            smbpasswd -a $3
            service smbd restart
            sleep 5
            service smbd status
            echo ""
          ;;

        esac

      done
fi

