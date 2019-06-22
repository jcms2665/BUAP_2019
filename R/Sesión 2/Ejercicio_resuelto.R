#=================================================================================

# BASES DE DATOS EN R

#=================================================================================

# PROBLEMA:

# ¿Cuál es la diferencia entre la Población Económicamente Activa (PEA) y la
# Población No Económicamente Activa (PNEA)

# CONSIDERACIONES:

# 1. Descargar la base de datos en DBF
# 2. Usar la tabla sdemt119.dbf
# 3. La variable a usar es CLASE1
# 4. Este dato se calcula para la población mayor de 15 años


#=================================================================================


#0.  Limpiar el espacio de trabajo

rm(list=ls())     
graphics.off()    
options(warn=-1)

#=================================================================================


#1.  Instalar paquetes/librerias

# ¿Qué tipo de analisis voy a llevar a cabo?

  #1.1 Paquetes
  install.packages("foreign")
  install.packages("ggplot2")
  install.packages("questionr")
  
  #1.2 Librerías
  library(base)         # 
  library(foreign)      # 
  library(questionr)    # 
  library(readxl)       # 

#=================================================================================

#2.  Directorio de trabajo
#Nota: Recuerda usar "/" en lugar de "\"
setwd("C:/Users/jmartinez/Desktop/FLACSO_R-master/FLACSO_R-master/Datos/2019trim1_dbf") 
  
    
#=================================================================================

#3. Importar datos en .dbf
#Nota: usa la función read.dbf 
#Nota2: nombrar la base como: sdemt119

sdemt119<- data.frame(read.dbf("sdemt119.dbf"))

#=================================================================================

#4. Frecuencia de la variable CLASE1
#Nota: recuerda especificar la base de datos y la variable usando $ 

wtd.table(sdemt119$CLASE1)

#=================================================================================
  
#5. Genera un subconjunto con la población mayor de 15 años
#Nota 1: Cambia a numérico la variable Edad (ve el punto 8.1)
  
  sdemt119$EDA <-as.numeric(as.character(sdemt119$EDA))


#=================================================================================

#6. Subconjunto de datos 

#Nota 2: Crea una base (más pequeña) llamada sdemt119_bis 
#        solo con los mayores de 15 años  (ve el punto 9.2)
  
sdemt119_bis<- sdemt119[ which(sdemt119$EDA>=15), ]  
  
#=================================================================================
  
#7. Etiqueta la variable CLASE1
#Nota1: Los rangos son 1= PEA, 2=PNEA (ve el punto 7.1 )
  
sdemt119_bis$CLASE1 <- factor(sdemt119_bis$CLASE1,levels = c(1,2),labels = c("PEA","PNEA"))
  
    
#=================================================================================
      
#8. Tabular CLASE1
#Nota 1: Tabula con los datos sin ponderar, usa $ para nombrar base y variable
  
wtd.table(sdemt119_bis$CLASE1)

#=================================================================================
  
#8. Tabular CLASE1 ponderando los datos
  
#Nota 2: Tabula con los datos ponderados usando "weights = " (ve el punto 10)
  
wtd.table(sdemt119_bis$CLASE1,weights = sdemt119_bis$FAC)
  
  
#=================================================================================

# ¿Tus resultados coinciden con los tabulados del INEGI?
# Ver archivo "2019_trim_1_Nacional.xls"
  
