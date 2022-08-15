###########################################
# Proyecto: Taller RStudio UNPA                
# Autora: Eréndira Munguía                          
# Fecha: Agosto 2022           
###########################################
#Programa para ilustrar el uso de la librería Stringr y Tidyverse
#Haciendo uso de la RStudio R Community Survey (formerly the R Learning Survey)
#https://github.com/rstudio/r-community-survey

#limpiando la memoria
rm(list = ls())

#Leyendo un archivo que contiene información separada por tabuladores
Encuesta <-read.csv("2020-combined-survey-final.tsv", sep = "\t")
View(Encuesta)
#Leyendo un archivo excel que contiene el significado de las variables de Encuesta
library(readxl)
Diccionario <- read_excel("2020-combined-survey-names.xlsx")
View(Diccionario)

library(stringr)
#Encontrando las respuestas que mencionan "comunidad" a la pregunta
#¿Qué es lo que más te gusta de R?
#Respuestas en español
Gustan_Comunidad=str_subset(Encuesta$Qlike_best, "omunida")
#Respuestas en ingles
like_community=str_subset(Encuesta$Qlike_best, "ommunity")
#Uniendo las dos listas
Gustan_Comunidad=c(like_community, Gustan_Comunidad)
View(Gustan_Comunidad)

#Cargando la librería Tidyverse
library(tidyverse)

# El operador %>% :
# x %>% f(y) = f(x,y)
26 %>% sqrt() %>% round(2)
#la línea anterior es equivalente a 
round(sqrt(26),2)

#Una forma equivalente a View(like_community)
like_community %>% View()

#De quienes contestaron sí a la pregunta
#Did you use tidyverse packages such as ggplot2 or dplyr to learn R?
#¿Cuál es el promedio de disfrute? agrupado por nivel de expertice (e idioma)
TidyEncuestaDisfrute <- Encuesta %>% filter(Qtidyverse_learning %in% c("Yes","Sí"))%>% 
  group_by(Qr_experience) %>% 
  summarise(Promedio_Disfrute = mean(Qr_enjoyment, na.rm = TRUE), Desviacion_Disfrute=sd(Qr_enjoyment, na.rm = TRUE)) 
