#=================================================================================
# WORDCLOUD Y MARKDOWN

#=================================================================================

# OBJETIVO: Introducir al usuario a las nuevas utilidades de R

#=================================================================================


#CONTENIDO




#=================================================================================

# PREGUNTAS:

#1. ¿En qué año hubo más noticias?
#2. ¿En qué lugar hubo más noticias?


#=================================================================================

#0. Limpiar entorno del trabajo

rm(list = ls())
graphics.off()
options(warn=-1)

#0.1 Instalar paquetes especiales: devtools y rmarkdown

if (!requireNamespace("devtools"))
  install.packages('devtools')
devtools::install_github('rstudio/rmarkdown')


# Las liberías que vamos a usar son:
# tm, SnowballC, wordcloud, RColorBrewer,dplyr, foreign, ggplot2, igraph

library(tm)
library(SnowballC)
library(wordcloud)
library(RColorBrewer)
library(foreign)  
library(dplyr)
library(ggplot2)
library(igraph)

#=================================================================================

#1. Cargar el archivo de texto

# Carga el archivo "universal.csv" 
# Debes especificar "," y header=TRUE

setwd("C:/Users/jmartinez/Desktop/FLACSO_R-master/Datos")
u<- read.csv("universal.csv", sep=",", header=TRUE)

#=================================================================================

#2. Generar achivos TXT

write.table(u[11], file = "u1.txt", row.names = FALSE, quote=FALSE)

#2.1 Cargar archivos TXT
docs <- Corpus(VectorSource(readLines("u1.txt",encoding = "UTF-8")))

#2.2 Inspeccionar el archivo TXT
inspect(docs)

#2.3 Limpiar el texto

toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "/")
docs <- tm_map(docs, toSpace, "@")
docs <- tm_map(docs, toSpace, ";")
docs <- tm_map(docs, toSpace, "¿")
docs <- tm_map(docs, content_transformer(tolower))
docs <- tm_map(docs, removeNumbers)
docs <- tm_map(docs, removeWords, stopwords("spanish"))
docs <- tm_map(docs, removePunctuation)
docs <- tm_map(docs, stripWhitespace)
inspect(docs)

#=================================================================================

#3. Quitar palabras coloquiales

docs <- tm_map(docs, removeWords, c("mexico","personas","mas","mujer","den","dar","mil","dia","dos","solo",
                                    "tambien","años","pues","cada","sur","vez","dijo","pasado","despues","ahi","dio","ademas","segun","ser","asi","tres","habia","meses","luego","dias","tenia")) 

#=================================================================================

#4. Wordcloud

dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)

set.seed(1234)
wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=400, random.order=FALSE, rot.per=0.5, 
          colors=brewer.pal(8, "Dark2"))
#=================================================================================

#4.1 Frecuencias de palabras

barplot(d[1:10,]$freq, las = 2, names.arg = d[1:10,]$word,
        col ="lightblue", main ="Palabras más frecuentes",
        ylab = "Frecuencias")



