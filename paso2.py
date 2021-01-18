import pandas as pd
import time

#########################################
#####      GVARIABLES GLOBALES      #####
#########################################

hoy = time.strftime("%Y%m%d%H%M%S")                            # guardamos la fecha de generación del archivo en formato YYYYMMDDhhmmss
ruta_base = "/home/pas/data-gob/python/icovid-scripts/archivos-resumen/"
ruta_base_paso2 = "/home/pas/data-gob/python/icovid-scripts/archivos-paso2/"

###############################################################################
#####      GENERACIÓN DATAFRAME DE MAESTRO DIMENSIÓN TIEMPO/PERIODOS      #####
###############################################################################

url_dimension_tiempo = "https://icovid.blob.core.windows.net/datos-dimensiones/dimension_tiempo.csv?sp=r&st=2021-01-17T20:00:23Z&se=2023-01-01T04:00:23Z&spr=https&sv=2019-12-12&sr=b&sig=nFvI4GcNskkysnT1GrxOOiHVIr6gqLIb2z64ZmV5v%2BA%3D"
dim_periodos = pd.read_csv(url_dimension_tiempo)
dim_periodos.sort_values(by=["fecha"])                         # hacemos un sort por el campo fecha just in case
dim_periodos["fecha"] = pd.to_datetime(dim_periodos["fecha"])  # cambiamos el tipo de dato del campo fecha a datetime64

########################################################################################
#####      ARCHIVOS .CSV NACIONAL Y REGIONAL TABLA 1 GENERADOS POR RESUMEN.PY      #####
########################################################################################

regional_T1 = pd.read_csv(ruta_base + "regional_T1_20210117232717.csv")
nacional_T1 = pd.read_csv(ruta_base + "nacional_T1_20210117232717.csv")
regional_T2 = pd.read_csv(ruta_base + "regional_20210117232717.csv")
nacional_T2 = pd.read_csv(ruta_base + "nacional_20210117232717.csv")

regional_T1["fecha"] = pd.to_datetime(regional_T1["fecha"])    # cambiamos el tipo de dato del campo fecha a datetime64
nacional_T1["fecha"] = pd.to_datetime(nacional_T1["fecha"])    # cambiamos el tipo de dato del campo fecha a datetime64
regional_T2["fecha"] = pd.to_datetime(regional_T2["fecha"])    # cambiamos el tipo de dato del campo fecha a datetime64
nacional_T2["fecha"] = pd.to_datetime(nacional_T2["fecha"])    # cambiamos el tipo de dato del campo fecha a datetime64

###########################################################################################
#####      CRUCE PARA CALCULAR LOS PROMEDIOS DE LA DATA GENERADA PARA LA TABLA 1      #####
###########################################################################################

########## REGIONAL ##########
regional_T1_merged = regional_T1.merge(dim_periodos, how="left", on="fecha")
regional_T1_usefulcols = regional_T1_merged[["fecha","cod_region", "Estimado", "Indicador", "Inferior", "Superior", "Domingo_semana"]]                                           # dejamos las columnas que nos interesan
regional_T1_mean = regional_T1_usefulcols.groupby(["Domingo_semana", "Indicador", "cod_region"]).agg({"Estimado":"mean", "Inferior":"mean", "Superior":"mean"}).reset_index()    # agrupamos y aplicamos el promedio

##### Exportamos a .csv
regional_T1_usefulcols_csv = regional_T1_usefulcols.dropna()                                            # just in case
regional_T1_usefulcols_csv.to_csv(ruta_base_paso2 + f"regional_T1_paso2_{hoy}.csv", index=False)

regional_T1_mean_csv = regional_T1_mean.dropna()                                                        # just in case
regional_T1_mean_csv.to_csv(ruta_base_paso2 + f"regional_T1_paso2_promedio_{hoy}.csv", index=False)

########## NACIONAL ##########
nacional_T1_merged = nacional_T1.merge(dim_periodos, how="left", on="fecha")
nacional_T1_usefulcols = nacional_T1_merged[["fecha","Estimado", "Indicador", "Inferior", "Superior", "Domingo_semana"]]                                                        # dejamos las columnas que nos interesan
nacional_T1_mean = nacional_T1_usefulcols.groupby(["Domingo_semana", "Indicador"]).agg({"Estimado":"mean", "Inferior":"mean", "Superior":"mean"}).reset_index()                 # agrupamos y aplicamos el promedio

##### Exportamos a .csv
nacional_T1_usefulcols_csv = nacional_T1_usefulcols.dropna()                                            # just in case
nacional_T1_usefulcols_csv.to_csv(ruta_base_paso2 + f"nacional_T1_paso2_{hoy}.csv", index=False)

nacional_T1_mean_csv = nacional_T1_mean.dropna()                                                        # just in case
nacional_T1_mean_csv.to_csv(ruta_base_paso2 + f"nacional_T1_paso2_promedio_{hoy}.csv", index=False)
