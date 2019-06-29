#=================================================================================

# ESTADÍSTICA DESCRIPTIVA

#=================================================================================

# OBJETIVO: El objetivo de esta sección es hacer inferencia de los
#           datos a partir de medidas de tendencia central

#=================================================================================

#CONTENIDO

#0. Preparar el entorno de trabajo
#1. Importar datos
#2. Descripción de la base 
#3. Subconjuntos (hombres y mujeres)
#4. Medidas de tendencia central
#5. Gráficas (ggplot)
#6. Markdown


#PREGUNTAS DE INVESTIGACIÓN:

#1. ¿Quienes estudian más, los hombres o las mujeres?
# H0:

#2. ¿Los jóvenes estudian más que los adultos?
# H0:


#=================================================================================


#0. Preparar el entorno de trabajo

#Antes de iniciar a trabajar en **R** conviene limpiar el entorno de trabajo 



    #0.1. Instalar paquetes
    
    #Par dar inicio al análisis conviene preguntarse ¿qué tipo de analisis se va a llevar a cabo?
    #¿se van a hacer análisis estadístico?, ¿se harán gráficas?
    



    
    #0.2. Cargar librerías: base, foreign, questionr, ggplot, stats, dplyr
    

    
    #0.3. Directorio de trabajo
    

#=================================================================================
    
        
#1. Importar datos.     
# Ayuda 1: Recuerda utilizar la función read.dbf
# Ayuda 2: Nombra a la base enigh

    
#=================================================================================
    

#2. Descripción de la base
# Ayuda: Verifica el nombre de las variables


#=================================================================================


#3. Subconjuntos (hombres y mujeres) 

    #3.1 Convertir a numérico las variables a utilizar: hor_2, sexo y eda
    # Ayuda 1: Convierte en caracter y luego en numérico.
    # Ayuda 2: Recuerda decirle a R el nombre de la base y la variable ($)
    
        



    #3.2 Hacer una base para hombres y otra para mujeres
    # Ayuda1: Recuerda quienes van antes de la coma: [casos o filas , variables o columnas ]
    # Ayuda2: A la base de hombres nombrala "enigh_h" y a la de mujeres "enigh_m"    



#=================================================================================

#4. Medidas de tendencia central

    
    #4.1 Promedio
        
    mean(enigh_h$hor_2, na.rm = TRUE)
    mean(enigh_m$hor_2, na.rm = TRUE)
    
    #4.2 Mediana
    
    median(enigh_h$hor_2, na.rm = TRUE)
    median(enigh_m$hor_2, na.rm = TRUE)
    
    #4.3 Mínimo
    
    min(enigh_h$hor_2, na.rm = TRUE)
    min(enigh_m$hor_2, na.rm = TRUE)
    
    #4.4 Máximo
    
    max(enigh_h$hor_2, na.rm = TRUE)
    max(enigh_m$hor_2, na.rm = TRUE)
    
    #4.5 Desviación estándar
    
    sd(enigh_h$hor_2, na.rm = TRUE)
    sd(enigh_m$hor_2, na.rm = TRUE)
    
    
    #4.6 Cuartiles
    
    quantile(enigh_h$hor_2, na.rm = TRUE)
    quantile(enigh_m$hor_2, na.rm = TRUE)

    #4.7 Correlacion
    
    cor(enigh_m$hor_2,enigh_m$eda,method = "pearson")
    
        #4.7.1 Quitar valores perdidos
        
        enigh_m2<-enigh_m[!is.na(enigh_m$hor_2),]
        
        #4.7.2 Correlacion
        
        cor(enigh_m2$hor_2,enigh_m2$eda,method = "pearson")
    
    
    
#=================================================================================

#5. Gráficas (ggplot)
    
#5.1 Gráfica simple
    
ggplot(enigh,aes(sexo))+geom_bar(fill="blue")

#5.2 Gráfica con diseño

ggplot(enigh,aes(sexo))+geom_bar(fill="blue")+
    xlab("Sexo de las personas")+
    ylab("Numero de personas")+
    ggtitle("Comparación entre hombres y mujeres")


