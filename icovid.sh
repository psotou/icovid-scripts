#!/usr/bin/bash

EXECUTIONDATE=`date +%Y%m%d%H%M`; # YYYYMMDDHHmm

mkdir /home/pas/python/icovid-scripts/archivos-step-one/${EXECUTIONDATE};
mkdir /home/pas/python/icovid-scripts/archivos-step-two/${EXECUTIONDATE};

# python3 step_one.py ${EXECUTIONDATE}
python3 step_two.py ${EXECUTIONDATE}

# para el back-up
EXECUTIONDATEBACKUP=`date +%d%m%Y`;

mkdir /home/pas/python/icovid-scripts/backup/${EXECUTIONDATEBACKUP};

cp -r /home/pas/data-gob/icovid/ICOVID/dimension1 /home/pas/python/icovid-scripts/backup/${EXECUTIONDATEBACKUP};
cp -r /home/pas/data-gob/icovid/ICOVID/dimension2 /home/pas/python/icovid-scripts/backup/${EXECUTIONDATEBACKUP};
cp -r /home/pas/data-gob/icovid/ICOVID/dimension3 /home/pas/python/icovid-scripts/backup/${EXECUTIONDATEBACKUP};
cp -r /home/pas/data-gob/icovid/ICOVID/dimension4 /home/pas/python/icovid-scripts/backup/${EXECUTIONDATEBACKUP};