# PT_IAVH_prioritizr
Este repositorio contiene los archivos y scripts utilizados para un ejercicio simple utilizando prioritizr.

1. Carpetas:
- DATOS: Esta carpeta contiene los datos utilizados en los scrips (un archivo gpkg y un tif). Los archivos están comprimidos para facilitar su cargue en este repositorio. El archivo gpkg contiene las unidades espaciales de análisis con información de costos por BNT (atributo 'ZS_sum'), costos por IHEH (atributo 'IHEH_mean'), presencia de áreas protegidas (atributo 'RUNAP') y áreas de paramo no protegidas (atributo 'Param_noP'). El archivo tif contiene un raster con 11 bandas correspondientes a los rangos altitudinales utilizados (cada 500 m).
- FIGURES: Esta carpeta contiene las figuras resultantes de los 4 ejercicios de priorización ejecutados en cada uno de los 4 scripts disponibles.
- PRIORIZ_GPKG: Esta carpeta contiene los archivos vectoriales resultantes del ejercicio de priorización, 1 para cada uno de los 4 ejercicios realizados.

2. Scripts:
- pr_BNT_01: Ejercicio de priorización con costos del BNT sin restricciones.
- pr_BNT_02: Ejercicio de priorización con costos del BNT con restricciones.
- pr_IHEH_01: Ejercicio de priorización con costos del IHEH sin restricciones.
- pr_IHEH_02: Ejercicio de priorización con costos del IHEH con restricciones.
Las restricciones 
