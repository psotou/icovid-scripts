# ICOVID: my touch

A continuación se detalla cómo correr el flujo que genera los archivos que se cargan en Tableau.

### Script `step_one.py`

Este script genera los primeros archivos (los cuales son consumidos por el segundo script. Los archivos que genera el script `step_one.py` son:

+ `nacional_AAAAMMDDhhmmss.csv`
+ `nacional_T1_AAAAMMDDhhmmss.csv`
+ `regional_AAAAMMDDhhmmss.csv`
+ `regional_T1_AAAAMMDDhhmmss.csv`

### Script `step_two.py`

+ `carga_nacional_paso2_promedio_AAAMMDDhhmmss.csv`
+ `carga_nacional_paso2_promedio_dif_AAAMMDDhhmmss.csv`
+ `carga_regional_paso2_promedio_AAAMMDDhhmmss.csv`
+ `carga_regional_paso2_promedio_dif_AAAMMDDhhmmss.csv`
+ `nacional_T1_paso2_AAAMMDDhhmmss.csv`
+ `nacional_T1_paso2_promedio_AAAMMDDhhmmss.csv`
+ `regional_T1_paso2_AAAMMDDhhmmss.csv`
+ `regional_T1_paso2_promedio_AAAMMDDhhmmss.csv`
+ `nacional_T2_paso2_promedio_AAAMMDDhhmmss.csv`
+ `regional_T2_paso2_promedio_AAAMMDDhhmmss.csv`


Donde **AAAAMMDDhhmmss** es un string con la fecha en formato año-mes-día-hora-minuto-segundo, por ejemplo, 20210119115432

## Cómo ejecutar el proceso

Primero hacer un git clone de este repo, y luego correr lo siguiente (para linux):

```bash
python3 step_two.py
```