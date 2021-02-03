#!/usr/bin/bash

EXECUTIONDATE=`date +%Y%m%d%H%M`; # YYYYMMDDHHmm

mkdir /home/pas/python/icovid-scripts/archivos-step-one/${EXECUTIONDATE};
mkdir /home/pas/python/icovid-scripts/archivos-step-two/${EXECUTIONDATE};

# python3 step_one.py ${EXECUTIONDATE}
python3 step_two.py ${EXECUTIONDATE}

# para el back-up
EXECUTIONDATEBACKUP=`date +%d%m%Y`;

mkdir /home/pas/python/icovid-scripts/backup/generated/${EXECUTIONDATEBACKUP};

cp /home/pas/python/icovid-scripts/archivos-step-one/${EXECUTIONDATE}/*.xlsx /home/pas/python/icovid-scripts/backup/generated/${EXECUTIONDATEBACKUP};
cp /home/pas/python/icovid-scripts/archivos-step-two/${EXECUTIONDATE}/*.xlsx /home/pas/python/icovid-scripts/backup/generated/${EXECUTIONDATEBACKUP};

mkdir /home/pas/python/icovid-scripts/backup/repo/${EXECUTIONDATEBACKUP};

cp -r /home/pas/datagovuc/icovid/ICOVID/dimension1 /home/pas/python/icovid-scripts/backup/repo/${EXECUTIONDATEBACKUP};
cp -r /home/pas/datagovuc/icovid/ICOVID/dimension2 /home/pas/python/icovid-scripts/backup/repo/${EXECUTIONDATEBACKUP};
cp -r /home/pas/datagovuc/icovid/ICOVID/dimension3 /home/pas/python/icovid-scripts/backup/repo/${EXECUTIONDATEBACKUP};
cp -r /home/pas/datagovuc/icovid/ICOVID/dimension4 /home/pas/python/icovid-scripts/backup/repo/${EXECUTIONDATEBACKUP};