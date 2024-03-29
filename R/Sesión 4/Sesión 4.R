#=================================================================================
# GRAFICAS CON R

#=================================================================================

# OBJETIVO: El objetivo de este tutorial es introducir al usuario 
#           en el manejo de graficas con R. Se usan las bases de datos 
#           de la Encuesta Nacional de Ocupaci�n y Empleo (ENOE) 
#           del primer trimestre de 2016, las cuales se encuentran en la p�gina 
#           de INEGI.


#=================================================================================

#CONTENIDO

#1. Cargar paquetes
#2. Gr�ficas
#3. Presentaci�n

#=================================================================================

# PROBLEMA:

# Usted tiene 15 minutos para dar una presentaci�n sobre el trabajo en M�xico.
# Le interesa ver la posici�n en la ocupaci�n, el sexo de las personas y si saben
# leer o no. La intenci�n es presentar gr�ficas que le sirvan de apoyo para
# abordar el tema.

#=================================================================================


#Para poder hacer las graficas correspondientes se requieren los siguientes 
#paquetes: data.table, foreign, questionr, survey, ggplot2, gridExtra, grid. 

#1.1 Cargar las librerias que se van a utilizar

library(data.table)
library(foreign)
library(questionr)
library(survey)
library(ggplot2)
library(gridExtra)
library(grid)

#=================================================================================


#1.2 Definir el directorio ra�z y cargar las bases de datos
# La base se debe llamar SDEMT116 y debes usar las funciones: data.frame(read.dbf()) 

setwd("C:/Users/jmartinez/Desktop/FLACSO_R-master/Datos")
SDEMT116<-data.frame(read.dbf("SDEMT119.dbf"))

#=================================================================================


#1.3 Variables


# Para iniciar con el an�lisis conviene identificar las variables que se van a utilizar 
# y cambiarlas a num�ricas: C_RES  R_DEF  CLASE2   EDA CS_P12 POS_OCU

SDEMT116$R_DEF <-as.numeric(as.character(SDEMT116$R_DEF))
SDEMT116$C_RES <-as.numeric(as.character(SDEMT116$C_RES))
SDEMT116$EDA <-as.numeric(as.character(SDEMT116$EDA))
SDEMT116$CLASE2 <-as.numeric(as.character(SDEMT116$CLASE2))
SDEMT116$CS_P12<-as.numeric(as.character(SDEMT116$CS_P12))
SDEMT116$POS_OCU<-as.numeric(as.character(SDEMT116$POS_OCU))

#=================================================================================


#Para filtrar a la poblacion que es de interes, los criterios son:
#EDA>=15 & EDA<=98  (poblaci�n de 15 a�os a 98 a�os)
# OJO: falta ponerle el $ y el nombre de la base de datos

# La nueva base se debe llamar SD

SD<-SDEMT116[which(SDEMT116$EDA>=15 & SDEMT116$EDA<=98),]

#=================================================================================


#1.4 Recodificaci�n de 3 variables

#Variable Sexo (SEX):   
#1=Hombre, 2=Mujer

# Variable POS_OCU:
# 1 "subordinados", 2 "Empleadores",3 "cuenta propia", 4 "sin pago"

# Variable CS_P12:
# 1="S� lee", 2= "No lee",9= "NE"

SD$SEXO <- factor(SD$SEX,levels = c(1,2),labels = c("Hombre", "Mujer"))
SD$POS_OCU <- factor(SD$POS_OCU,levels = c(1,2,3,4),labels = c("subordinados", "Empleadores","cuenta propia","sin pago"))
SD$CS_P12 <- factor(SD$CS_P12,levels = c(1,2,9),labels = c("S� lee", "No lee","NE"))

#=================================================================================


#Verificar la recodificacion de las 3 variables con un tabulado simple: wtd.table()
wtd.table(SD$SEXO)
wtd.table(SD$POS_OCU)
wtd.table(SD$CS_P12)

#=================================================================================


#2. Gr�ficas


#2.1 Con 1 Variable Discreta

#1) Indicar la base de datos y la variable
g1<-ggplot(SD,aes(POS_OCU))

#2) Definir el tipo de gr?fica y definir las caracter?sticas
g1+geom_bar(fill="deepskyblue2",aes(weights=SD$FAC))


#3) Agregar las capas que se requieran.
g1+geom_bar(fill="deepskyblue2")+
  ggtitle("Posicion en la Ocupacion")+
  xlab("Posicion en la Ocupacion")+
  ylab("Numero de personas")

#=================================================================================


#2.2 Con 2 Variable Discreta
#2.2.1 Opci�n 1

g2<-ggplot(SD,aes(POS_OCU))
g2+geom_bar(fill="yellowgreen")+
  facet_wrap(~ SEX)+
  ggtitle("Posicion en la Ocupacion x Sexo")+
  xlab("Posicion en la Ocupacion")+
  ylab("Numero de personas")


#2.2.2 Opci�n 2

g3<-ggplot(SD,aes(x=CS_P12,fill=SEX))
g3+geom_bar(position = "dodge")+
  ggtitle("Posicion en la Ocupacion y �sabe leer?")+
  xlab("Rango de horas")+
  ylab("Numero de personas")

#2.3 Con 1 Variable Cont�nua

g4<-ggplot(SD,aes(EDA))
g4+geom_area(stat = "bin",binwidth = 5)


#2.4 Agregar graficas


# Se crea la grafica y se guarda
grafica1<-
  g1+geom_bar(fill="deepskyblue2")+
  ggtitle("Posicion en la Ocupacion")+
  xlab("Posicion en la Ocupacion")+
  ylab("Numero de personas")

grafica2<-
  g2<-ggplot(SD,aes(POS_OCU))+
  geom_bar(fill="yellowgreen")+
  facet_wrap(~ SEX)+
  ggtitle("Posicion en la Ocupacion")+
  xlab("Posicion en la Ocupacion")+
  ylab("Numero de personas")

grafica3<-
  g3<-ggplot(SD,aes(x=CS_P12,fill=SEX))+
  geom_bar(position = "dodge")+
  ggtitle("Posicion en la Ocupacion")+
  xlab("Rango de horas")+
  ylab("Numero de personas")

grafica4<-
  g4<-ggplot(SD,aes(EDA))+
  geom_area(stat = "bin",binwidth = 5)


#=================================================================================

#3. Presentaci�n

grid.arrange(grafica1, grafica2,grafica3,grafica4,nrow=4)
