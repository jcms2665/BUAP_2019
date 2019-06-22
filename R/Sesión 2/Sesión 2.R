#=================================================================================

# BASES DE DATOS EN R

#=================================================================================

# OBJETIVO: Importar, exportar archivos con diferentes formatos y
#           crear subconjunto de datos

# CONTENIDO

#0. Limpiar el espacio de trabajo
#1. Instalar paquetes/librerias
#2. Directorio de trabajo
#3. Importar datos
#4. Exportar datos
#5. Frecuencias
#6. Tabulados
#7. Etiquetar variables
#8. Recodificar variables
#9. Subconjunto de datos

# PROBLEMA:
# ¿Cuántas mujeres en edad reproductiva trabajan en México?

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

setwd("C:/Users/jmartinez/Desktop/FLACSO_R-master/FLACSO_R-master/Datos") 

#=================================================================================

#3. Importar datos

excel<-data.frame(read_excel("sdemt119.xlsx"))
dbf<-data.frame(read.dbf("sdemt119.dbf"))
stata<-data.frame(read.dta("sdemt119.dta"))
cvs<- data.frame(read.table("sdemt119.csv", header=TRUE, sep=","))

#=================================================================================

#4. Exportar datos

  #4.1 Guardar en DTA (stata)
      write.dta(cvs, "Julio_R.dta")
  
  #4.2 Guardar en DBF (foxpro)
      write.dbf(cvs, "Julio_R.dbf")
  
  #4.3 Descripción de la base 
      names(cvs)
      head(cvs,2)

#=================================================================================
      
#5. Frecuencias

wtd.table(cvs$CLASE2)

#=================================================================================
      
#6. Tabulados

wtd.table(cvs$SEX,cvs$CLASE1)

#=================================================================================
      
#7. Etiquetar variables

#Para generar las etiquetas se debe usar la función factor y se debe especificar:
#  1. La variable que se va etiquetar
#  2. Los valores (levels)
#  3. Las etiquetas (labels)

      
#7.1 Generar etiquetas
    cvs$SEX <- factor(cvs$SEX,levels = c(1,2),labels = c("Hombre","Mujer"))
    
    cvs$CLASE2 <- factor(cvs$CLASE2,levels = c(1,2,3,4),labels = c("Ocupada","Desocupada","Disponibles","No disponible" ))
      
      
#7.2 Tabular las variables etiquetadas
  wtd.table(cvs$SEX,cvs$CLASE2)

#=================================================================================

#8. Recodificar variables

    #8.1 Convertir las variables a numérico
    cvs$EDA <-as.numeric(as.character(cvs$EDA))
    
    #8.2 Crear nueva variable
    cvs$edad_reproductiva<-0
    
    #8.3 Establecer los rangos
    cvs$edad_reproductiva[cvs$EDA >= 15 & cvs$EDA <=54] <- 1
    cvs$edad_reproductiva[cvs$EDA >= 54] <- 2

    #8.3 Validar con un tabulado
    wtd.table(cvs$edad_reproductiva)

#=================================================================================
    
#9. Subconjunto de datos

  #9.1 Seleccionar variables
  
        #9.1.1 Definimos las variables
        var<-c("SEX", "CLASE2","FAC")
        
        #9.1.2 Seleccionamos SÓLO esas variables
        nueva_csv_1 <- cvs[,var]

  #9.2 Seleccionar casos
          
  nueva_csv_2 <- cvs[ which(as.numeric(cvs$edad_reproductiva)==1), ]
  
  #9.3 Seleccionar variables y casos
  nueva_csv_3 <- cvs[ which(as.numeric(cvs$edad_reproductiva)==1),var ]

#=================================================================================

#10. Respuesta al problema:
  
  # ¿Cuántas mujeres en edad reproductiva trabajan en México?
  
    wtd.table(nueva_csv_3$SEX,nueva_csv_3$CLASE2)
    
    wtd.table(nueva_csv_3$SEX,nueva_csv_3$CLASE2, weights =nueva_csv_3$FAC)
  
  
