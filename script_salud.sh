# script_salud.sh
# Este script descarga una base de datos de Datos Abiertos Dirección General de Epidemiología
# Y limpia los datos de tal manera que genera 3 archivos
# * 'factores_de_riesgo.csv' -> archivo que contiene las columnas de edad,fecha,sexo,fecha de defuncion, factores de riesgo y resultado final
# * 'confirmados_factores_de_riesgo.csv' -> archivo que contiene las columnas de edad,fecha,sexo,fecha de defuncion, factores de riesgo 
#    para todos los casos confirmados en México
# * 'negativos_factores_de_riesgo.csv' -> archivo que contiene las columnas de edad,fecha,sexo,fecha de defuncion, factores de riesgo 
#    para todos los casos negativos en México
# * 'fallecidos_factores_de_riesgo.csv' archivo que contiene las columnas de edad,fecha,sexo,fecha de defuncion, factores de riesgo 
#    para todos los casos fallecidos en México

mkdir carpeta_covid
cd carpeta_covid
curl  http://datosabiertos.salud.gob.mx/gobmx/salud/datos_abiertos/datos_abiertos_covid19.zip -o datos_covid.zip
unzip datos_covid.zip
datos=$(ls *.csv)
csvcut -c 6,13,14,16,22,23,24,25,27,28,30,36 $datos > factores_de_riesgo.csv 
echo "Columnas filtradas con exito..."
echo "Creando archivos de confirmados, negativos y fallecidos.."
echo "Puede tardar 4 mins aprox..."
csvgrep -c 12 -r [123] factores_de_riesgo.csv > confirmados_factores_de_riesgo.csv
csvgrep -i -c 12 -r [123] factores_de_riesgo.csv > negativos_factores_de_riesgo.csv
csvgrep -i -c 2 -m '9999-99-99' factores_de_riesgo.csv > fallecidos_factores_de_riesgo.csv
echo "Done"
