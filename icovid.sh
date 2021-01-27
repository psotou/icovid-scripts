#!/usr/bin/bash

EXECUTIONDATE=`date +%Y%m%d%H%M`; # YYYYMMDDHHmm

mkdir /home/pas/python/icovid-scripts/archivos-step-one/${EXECUTIONDATE};
mkdir /home/pas/python/icovid-scripts/archivos-step-two/${EXECUTIONDATE};

# python3 step_one.py ${EXECUTIONDATE}
python3 step_two.py ${EXECUTIONDATE}