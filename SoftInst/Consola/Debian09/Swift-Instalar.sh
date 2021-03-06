#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software de dominio público".
# Puedes hacer lo que quieras con él porque es libre de verdad; no libre con condiciones como las licencias GNU y otras patrañas similares.
# Si se te llena la boca hablando de libertad entonces hazlo realmente libre.
# No tienes que aceptar ningún tipo de términos de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

#--------------------------------------------------------------------
#  Script de NiPeGun para instalar el lenguaje de prograación Swift
#--------------------------------------------------------------------

apt-get update
apt-get -y install dialog
InstallFolder=~/Swift/
SwiftLangURL=https://swift.org
SwiftLangDownloadFolder=/download/
VersSwift31610=3.1.1
VersSwift41610=4.1.3
VersSwift41804=4.2.4
VersSwift51804=5.1.2

cmd=(dialog --checklist "¿Qué versión de Swift quieres instalar?:" 22 50 16)
options=(1 "Swift 3 ($VersSwift31610) (Ubuntu 16.10)" off
         2 "Swift 4 ($VersSwift41610) (Ubuntu 16.10)" off
         3 "Swift 4 ($VersSwift41804) (Ubuntu 18.04)" off
         4 "Swift 5 ($VersSwift51804) (Ubuntu 18.04)" on)
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
clear
for choice in $choices
do
  case $choice in

    1)
      mkdir $InstallFolder
      cd $InstallFolder
      echo ""
      echo "  Instalando herramientas para el script y dependencias para el lenguaje Swift..."
      echo ""
      apt-get -y install curl tar clang libicu-dev
      SwiftFileLocation=$(curl --silent $SwiftLangURL$SwiftLangDownloadFolder | grep -v DEVELOPMENT | grep -v SNAPSHOT | grep -v Signature | grep ubuntu16.10 | grep $VersSwift31610 | sed 's/\.gz.*/.gz/' | cut -d\" -f2)
      echo ""
      echo "  Descargando la versión de Swift seleccionada..."
      echo ""
      wget $SwiftLangURL$SwiftFileLocation -O Swift-$VersSwift31610.tar.gz
      echo ""
      echo "  Descomprimiendo el archivo..."
      echo ""
      tar -xzf Swift-$VersSwift31610.tar.gz
      rm -rf $VersSwift31610
      mv swift-$VersSwift31610-RELEASE-ubuntu16.10 $VersSwift31610
      rm Swift-$VersSwift31610.tar.gz
      echo ""
      echo "  Agregando la versión $VersSwift31610 de Swift al Path..."
      echo ""
      cp ~/.bashrc ~/.bashrc.bak
      sh -c "echo 'export PATH=$PATH:$InstallFolder$VersSwift31610/usr/bin/' >> ~/.bashrc"
      source  ~/.bashrc
    ;;

    2)
      mkdir $InstallFolder
      cd $InstallFolder
      echo ""
      echo "  Instalando herramientas para el script y dependencias para el lenguaje Swift..."
      echo ""
      apt-get -y install curl tar clang libicu-dev
      SwiftFileLocation=$(curl --silent $SwiftLangURL$SwiftLangDownloadFolder | grep -v DEVELOPMENT | grep -v SNAPSHOT | grep -v Signature | grep ubuntu16.10 | grep $VersSwift41610 | sed 's/\.gz.*/.gz/' | cut -d\" -f2)
      echo ""
      echo "  Descargando la versión de Swift seleccionada..."
      echo ""
      wget $SwiftLangURL$SwiftFileLocation -O Swift-$VersSwift41610.tar.gz
      echo ""
      echo "  Descomprimiendo el archivo..."
      echo ""
      tar -xzf Swift-$VersSwift41610.tar.gz
      rm -rf $VersSwift41610
      mv swift-$VersSwift41610-RELEASE-ubuntu16.10 $VersSwift41610
      rm Swift-$VersSwift41610.tar.gz
      echo ""
      echo "  Agregando la versión $VersSwift41610 de Swift al Path..."
      echo ""
      cp ~/.bashrc ~/.bashrc.bak
      sh -c "echo 'export PATH=$PATH:$InstallFolder$VersSwift41610/usr/bin/' >> ~/.bashrc"
      source  ~/.bashrc
    ;;

    3)
      mkdir $InstallFolder
      cd $InstallFolder
      echo ""
      echo "  Instalando herramientas para el script y dependencias para el lenguaje Swift..."
      echo ""
      apt-get -y install curl tar clang libicu-dev
      SwiftFileLocation=$(curl --silent $SwiftLangURL$SwiftLangDownloadFolder | grep -v DEVELOPMENT | grep -v SNAPSHOT | grep -v Signature | grep ubuntu18.04 | grep $VersSwift41804 | sed 's/\.gz.*/.gz/' | cut -d\" -f2)
      echo ""
      echo "  Descargando la versión de Swift seleccionada..."
      echo ""
      wget $SwiftLangURL$SwiftFileLocation -O Swift-$VersSwift41804.tar.gz
      echo ""
      echo "  Descomprimiendo el archivo..."
      echo ""
      tar -xzf Swift-$VersSwift41804.tar.gz
      rm -rf $VersSwift41804
      mv swift-$VersSwift41804-RELEASE-ubuntu18.04 $VersSwift41804
      rm Swift-$VersSwift41804.tar.gz
      echo ""
      echo "  Agregando la versión $VersSwift41804 de Swift al Path..."
      echo ""
      cp ~/.bashrc ~/.bashrc.bak
      sh -c "echo 'export PATH=$PATH:$InstallFolder$VersSwift41804/usr/bin/' >> ~/.bashrc"
      source  ~/.bashrc
    ;;

    4)
      mkdir $InstallFolder
      cd $InstallFolder
      echo ""
      echo "  Instalando herramientas para el script y dependencias para el lenguaje Swift..."
      echo ""
      apt-get -y install curl tar clang libicu-dev
      SwiftFileLocation=$(curl --silent $SwiftLangURL$SwiftLangDownloadFolder | grep -v DEVELOPMENT | grep -v SNAPSHOT | grep -v Signature | grep ubuntu18.04 | grep $VersSwift51804 | sed 's/\.gz.*/.gz/' | cut -d\" -f2)
      echo ""
      echo "  Descargando la versión de Swift seleccionada..."
      echo ""
      wget $SwiftLangURL$SwiftFileLocation -O Swift-$VersSwift51804.tar.gz
      echo ""
      echo "  Descomprimiendo el archivo..."
      echo ""
      tar -xzf Swift-$VersSwift51804.tar.gz
      rm -rf $VersSwift51804
      mv swift-$VersSwift51804-RELEASE-ubuntu18.04 $VersSwift51804
      rm Swift-$VersSwift51804.tar.gz
      echo ""
      echo "  Agregando la versión $VersSwift51804 de Swift al Path..."
      echo ""
      cp ~/.bashrc ~/.bashrc.bak
      sh -c "echo 'export PATH=$PATH:$InstallFolder$VersSwift51804/usr/bin/' >> ~/.bashrc"
      source  ~/.bashrc
    ;;

    esac

done

