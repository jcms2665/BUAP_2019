#=================================================================================

# INTRODUCCIÓN A R

#=================================================================================

# OBJETIVO: En este módulo se proporciona una breve introducción al entorno de R
#           y a sus características básicas.


# CONTENIDO

#0.  Limpiar el espacio de trabajo
#1.  Instalar paquetes/librerias
#2.  Directorio de trabajo
#3.  Tipos de datos
#4.  Vectores
#5.  Matrices
#6.  Funciones
#7.  Missing values
#8.  Data Frame


#=================================================================================


#0.  Limpiar el espacio de trabajo

ls()              # Lista de objetos actuales
rm(list=ls())     # Borrar objetos actuales
graphics.off()    # Limpia el espacio para las graficas
options(warn=-1)  # Omite mostrar los warnings
# Ctrl + L        # Limpia la consola


#=================================================================================


#1.  Instalar Librerías

install.packages("foreign")
install.packages("ggplot2")

search()          # Busca librerias instaladas

library(base)     # Funciones basicas (aritmeticas, input/output, basic programming support,...)
library(gdata)    # Leer y escribir Microsoft files
library(foreign)  # Leer y escribir STATA files
library(stats)    # Estadisticas basicas

update.packages() # Actualizar librerias instalados


#=================================================================================

#2.  Directorio de trabajo

getwd()                   # Directorio actual
setwd("C:/abajo/")        # Cambio de directorio
list.files()              # Lista de archivos

#=================================================================================

#3.  Tipos de datos

c('a','b','c')            # Caracter
1:7                       # Entero
40<80                     # Valor logico
2+2 == 5                  # Valor logico
T == TRUE                 # T expresion corta de verdadero

x <- 24         # Asignacion de valor 24 a la variable x para su uso posterior (OBJETO)
x/2             # Uso posterior de variable u objeto x
x               # Imprime en pantalla el valor de la variable u objeto
x <- TRUE       # Asigna el valor logico TRUE a la variable x OJO: x toma el ultimo valor que se le asigna
x

sum (10,20,30)      # Funcion suma
rep('R', times=3)   # Repite la letra R el numero de veces que se indica
sqrt(9)             # Raiz cuadrada de 9

help(sum)         # Ayuda sobre funcion sum

#=================================================================================

#4.  Vectores


y <- c('A', 'B','A', 'B')           # Vector caracteres
y[2]                                # Acceder a lo que tiene el vector en la posición 2
y[5] <- 'Prepa'                     # Agregar un valor en lugar 5
y


#=================================================================================

#5.  Matrices

m <- matrix (nrow=2, ncol=3, 1:6)   # Matrices Ejemplo 1
m
dim(m)
attributes(m)
m[1,]
m[,1]

m[2,3]

#=================================================================================

#6.  Funciones

as.numeric(c('-.1','2.7','B'))        # Funcion as.* (ya definida)
yo<-function(x){print("Hola R !!!")}  # Funcion "yo" (creada)
yo(ww)

#=================================================================================

#7.  Missing values

y <- c(1, 2, NA, 10, 3)         # Missing values
is.na(y)                        # Es missimg?

#=================================================================================

#8.  Data Frame

x <- data.frame(id=1:4, sex=c('F', 'F', 'M', 'M'))  # Data Frames
x
nrow(x)                                             # Numero de renglones
ncol(x)                                             # Numero de columnas


