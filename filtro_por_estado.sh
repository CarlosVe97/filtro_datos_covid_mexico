echo "
01	AGUASCALIENTES
02	BAJA CALIFORNIA
03	BAJA CALIFORNIA SUR
04	CAMPECHE
05	COAHUILA DE ZARAGOZA
06	COLIMA
07	CHIAPAS
08	CHIHUAHUA
09	CIUDAD DE MÉXICO
10	DURANGO
11	GUANAJUATO
12	GUERRERO
13	HIDALGO
14	JALISCO
15	MÉXICO
16	MICHOACÁN DE OCAMPO
17	MORELOS
18	NAYARIT
19	NUEVO LEÓN
20	OAXACA
21	PUEBLA
22	QUERÉTARO
23	QUINTANA ROO
24	SAN LUIS POTOSÍ
25	SINALOA
26	SONORA
27	TABASCO
28	TAMAULIPAS
29	TLAXCALA
30	VERACRUZ DE IGNACIO DE LA LLAVE
31	YUCATÁN
32	ZACATECAS
36	ESTADOS UNIDOS MEXICANOS
97	NO APLICA
98	SE IGNORA
99	NO ESPECIFICADO
-------------------------------------------------
Seleccione el numero de estado
"
read NUMESTADO
cd ./carpeta_covid
echo "Has elegido el estado $NUMESTADO"
echo "Filtrando todos los casos para ese estado..."
archivo=$(ls *MEXICO.csv)
csvgrep -c 8 -m $NUMESTADO $archivo > casos_totales_estado_$NUMESTADO.csv
csvgrep -c 36 -r [123] casos_totales_estado_$NUMESTADO.csv > confirmados_estado_$NUMESTADO.csv

echo "Se han generado las carpetas casos_totales_estado_$NUMESTADO.csv y confirmados_estado_$NUMESTADO.csv"
echo "Imprimiendo estadisticas con respecto a la edad de los casos confirmados del estado $NUMESTADO..."
csvstat -c 16 confirmados_estado_$NUMESTADO.csv
echo "Done!"