###########################################
# Proyecto: Taller RStudio UNPA                
# Autora: Eréndira Munguía                          
# Fecha: Agosto 2022           
###########################################
#Para saber más:
#http://r.qcbs.ca/workshop03/book-en/grammar-of-graphics-gg-basics.html

#Cargando la librería Tidyverse que contiene Ggplot
#library(tidyverse)
#Cargando sólo ggplot
library(ggplot2)

#Ejemplos usando la base precargada Orange
#?Orange
View(Orange)

t <- ggplot(Orange, aes(age, circumference, color=Tree)) + 
  geom_point()

t


s <- ggplot(Orange, aes(age, circumference, color=Tree, group = age)) + 
  geom_boxplot()+
  geom_point()

s

e <- ggplot(Orange, aes(age, circumference))+
  geom_boxplot(aes(group = age))+
  geom_quantile()+
  geom_point(aes(color=Tree))
e

#Ejemplos usando la base precargada InsectSprays
t <- ggplot(InsectSprays, aes(spray, count)) + 
  geom_point()
t

f <- ggplot(InsectSprays, aes(spray, count)) + 
  geom_boxplot()
f

s <- ggplot(InsectSprays, aes(spray, count, color=spray))+
  geom_violin(alpha=50)+
  geom_point()
s

#Ejemplos usando la base precargada ToothGrowth
t <- ggplot(ToothGrowth, aes(supp, len, color=dose))+
  geom_boxplot()+
  geom_point()+
  facet_grid(rows = vars(dose))
t

s <- ggplot(ToothGrowth, aes(dose, len, color=supp, group=dose))+
  geom_boxplot()+
  geom_point()+
  facet_grid(rows = vars(supp))
s



