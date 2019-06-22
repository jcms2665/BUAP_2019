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




#=================================================================================


#1.  Instalar paquetes/librerias

# ¿Qué tipo de analisis voy a llevar a cabo?

  #1.1 Paquetes


  
  #1.2 Librerías




#=================================================================================

#2.  Directorio de trabajo
#Nota: Recuerda usar "/" en lugar de "\"

  
    
#=================================================================================

#3. Importar datos en .dbf
#Nota: usa la función read.dbf 
#Nota2: nombrar la base como: sdemt119



#=================================================================================

#4. Frecuencia de la variable CLASE1
#Nota: recuerda especificar la base de datos y la variable usando $ 



#=================================================================================
  
#5. Genera un subconjunto con la población mayor de 15 años
#Nota 1: Cambia a numérico la variable Edad (ve el punto 8.1)
  




#=================================================================================

#6. Subconjunto de datos 

#Nota 2: Crea una base (más pequeña) llamada sdemt119_bis 
#        solo con los mayores de 15 años  (ve el punto 9.2)
  

  
#=================================================================================
  
#7. Etiqueta la variable CLASE1
#Nota1: Los rangos son 1= PEA, 2=PNEA (ve el punto 7.1 )
  

  
    
#=================================================================================
      
#8. Tabular CLASE1
#Nota 1: Tabula con los datos sin ponderar, usa $ para nombrar base y variable
  


#=================================================================================
  
#8. Tabular CLASE1 ponderando los datos
  
#Nota 2: Tabula con los datos ponderados usando "weights = " (ve el punto 10)
  

  
  
#=================================================================================

# ¿Tus resultados coinciden con los tabulados del INEGI?
# Ver archivo "2019_trim_1_Nacional.xls"
  
