#!/usr/bin/bash

EXECUTIONDATE=`date +%Y%m%d%H%M`;   # YYYYMMDDHHmm
EXECUTIONDATEBACKUP=`date +%d%m%Y`; # para los bakcups
UNIXTIME=`date +%s`;                # genera unix time para diferencias las carpetas de backup cuando hay más de una generada por día

echo "[`(date +"%F %T")`] Generamos las carpetas con la fecha en formato YYYYMMDDHHmm de acuerdo al momento de ejecución"

mkdir /home/pas/python/icovid-scripts/archivos-step-one/${EXECUTIONDATE};
mkdir /home/pas/python/icovid-scripts/archivos-step-two/${EXECUTIONDATE};

echo "[`(date +"%F %T")`] Ejecutamos el py script que generas los archivos para el sitio ICOVID"

python3 step_two.py ${EXECUTIONDATE};

echo "[`(date +"%F %T")`] Copiamos los archivos generados para el sitio ICOVID en la ruta /backup/generated/"

if [ ! -d "/home/pas/python/icovid-scripts/backup/generated/${EXECUTIONDATEBACKUP}" ]; then
  mkdir /home/pas/python/icovid-scripts/backup/generated/${EXECUTIONDATEBACKUP};
  cp /home/pas/python/icovid-scripts/archivos-step-one/${EXECUTIONDATE}/*.xlsx /home/pas/python/icovid-scripts/backup/generated/${EXECUTIONDATEBACKUP};
  cp /home/pas/python/icovid-scripts/archivos-step-two/${EXECUTIONDATE}/*.xlsx /home/pas/python/icovid-scripts/backup/generated/${EXECUTIONDATEBACKUP};
else
  mkdir /home/pas/python/icovid-scripts/backup/generated/${EXECUTIONDATEBACKUP}_${UNIXTIME};
  mv /home/pas/python/icovid-scripts/backup/generated/${EXECUTIONDATEBACKUP}/* /home/pas/python/icovid-scripts/backup/generated/${EXECUTIONDATEBACKUP}_${UNIXTIME};
  cp /home/pas/python/icovid-scripts/archivos-step-one/${EXECUTIONDATE}/*.xlsx /home/pas/python/icovid-scripts/backup/generated/${EXECUTIONDATEBACKUP};
  cp /home/pas/python/icovid-scripts/archivos-step-two/${EXECUTIONDATE}/*.xlsx /home/pas/python/icovid-scripts/backup/generated/${EXECUTIONDATEBACKUP};
fi

echo "[`(date +"%F %T")`] Copiamos las carpetas de interés del repo actualizadas en la ruta /backup/repo/"


if [ ! -d "/home/pas/python/icovid-scripts/backup/repo/${EXECUTIONDATEBACKUP}" ]; then
  mkdir /home/pas/python/icovid-scripts/backup/repo/${EXECUTIONDATEBACKUP};
  cp -r /home/pas/datagovuc/icovid/ICOVID/dimension1 /home/pas/python/icovid-scripts/backup/repo/${EXECUTIONDATEBACKUP};
  cp -r /home/pas/datagovuc/icovid/ICOVID/dimension2 /home/pas/python/icovid-scripts/backup/repo/${EXECUTIONDATEBACKUP};
  cp -r /home/pas/datagovuc/icovid/ICOVID/dimension3 /home/pas/python/icovid-scripts/backup/repo/${EXECUTIONDATEBACKUP};
  cp -r /home/pas/datagovuc/icovid/ICOVID/dimension4 /home/pas/python/icovid-scripts/backup/repo/${EXECUTIONDATEBACKUP};
else
  mkdir /home/pas/python/icovid-scripts/backup/repo/${EXECUTIONDATEBACKUP}_${UNIXTIME};
  mv /home/pas/python/icovid-scripts/backup/repo/${EXECUTIONDATEBACKUP}/* /home/pas/python/icovid-scripts/backup/repo/${EXECUTIONDATEBACKUP}_${UNIXTIME};
  cp -r /home/pas/datagovuc/icovid/ICOVID/dimension1 /home/pas/python/icovid-scripts/backup/repo/${EXECUTIONDATEBACKUP};
  cp -r /home/pas/datagovuc/icovid/ICOVID/dimension2 /home/pas/python/icovid-scripts/backup/repo/${EXECUTIONDATEBACKUP};
  cp -r /home/pas/datagovuc/icovid/ICOVID/dimension3 /home/pas/python/icovid-scripts/backup/repo/${EXECUTIONDATEBACKUP};
  cp -r /home/pas/datagovuc/icovid/ICOVID/dimension4 /home/pas/python/icovid-scripts/backup/repo/${EXECUTIONDATEBACKUP};
fi

echo "[`(date +"F T")`] Proceso finalizado con éxito"
