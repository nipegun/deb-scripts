#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software de dominio público".
# Puedes hacer lo que quieras con él porque es libre de verdad; no libre con condiciones como las licencias GNU y otras patrañas similares.
# Si se te llena la boca hablando de libertad entonces hazlo realmente libre.
# No tienes que aceptar ningún tipo de términos de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

#------------------------------------------------------------------------------------
#  Script de NiPeGun para comprobar el estado de salud de los discos duros SSD SATA
#------------------------------------------------------------------------------------

ColorVerde="\033[1;32m"
FinColor="\033[0m"

echo ""
echo -e "${ColorVerde}  Mostrando información de salud de discos SSD SATA...${FinColor}"
echo ""

echo ""
echo "  Identificando que discos SATA son SSD..."
echo ""

## Obtener la cantidad de discos SSD SATA que hay instalados en el sistema
   for LetraDiscoSATA in {a..x}
     do
       if [[ $(cat /sys/block/sd$LetraDiscoSATA/queue/rotational ) == "0" ]]; then
         ArrayDiscosSSDSATA[$LetraDiscoSATA]=$(nvme list | grep nvme$NroDiscoNVMe)
         echo "El disco sd$LetraDiscoSATA es un disco SSD"
       fi
     done

echo ""
echo "  Hay ${#ArrayDiscosTotales[@]} discos NVMe instalados en el sistema:"
echo ""

for i in "${ArrayDiscosTotales[@]}"
  do
    echo $i
    DispActual=$(echo $i | cut -d' ' -f1)
    nvme smart-log "$DispActual" | grep ercentage
    nvme smart-log "$DispActual" | grep ritten
    echo ""
  done