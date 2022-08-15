###########################################
# Proyecto: Taller RStudio UNPA                
# Autora: Eréndira Munguía                          
# Fecha: Agosto 2022           
###########################################
#Programa para ilustrar el uso de t.test
#Ver https://en.wikipedia.org/wiki/Welch%27s_t-test
# 3. Estimación por Intervalos. 3.5  Distribución de Bernoulli
#Del libro de texto: "Una introducción a la estadística inferencial". Luis Rincón. UNAM
#Del temario de Estadística 2022. UNPA. Lic. en Matemáticas Aplicadas

#limpiando la memoria
rm(list = ls())

#ToothGrowth es una base precargada en R
#Visualizando el contenido e información de"ToothGrowth"
View(ToothGrowth)
class(ToothGrowth)
?ToothGrowth

#A igual a los datos con administración de ácido ascorbico (denotado por VC) y dosis=0.5 mg.
A=ToothGrowth[ToothGrowth$supp=="VC" & ToothGrowth$dose==0.5, ]$len 
#B igual a los datos con administración de jugo de naranja (denotado por OJ) y dosis=0.5 mg.
B=ToothGrowth[ToothGrowth$supp=="OJ" & ToothGrowth$dose==0.5, ]$len 
A
B
boxplot(A,B)
#Calculando las medias en cada conjunto
mean(A)
mean(B)
#¿La media de A será distintas o estadísticamente igual a la de B?
#Realizamos las pruebas de hipótesis con t.test
t.test(A, B, "two.sided", mu=0, conf.level = 0.95 )
#como nuestro p-valor<0.05, 
#rechazamos la hipótesis nula  de que la diferencia de medias es igual a 0
# y aceptamos la hipòtesis alternativa de que la diferencia es distinta de 0

#C igual a los datos con administración VC y dosis=1 mg.
C=ToothGrowth[ToothGrowth$supp=="VC" & ToothGrowth$dose==1, ]$len 
#D igual a los datos con administración OJ y dosis=1 mg.
D=ToothGrowth[ToothGrowth$supp=="OJ" & ToothGrowth$dose==1, ]$len 
C
D
boxplot(C,D)
mean(C)
mean(D)
#Realizamos las pruebas de hipótesis con t.test
t.test(C, D, "two.sided", mu=0, conf.level = 0.95 )
#como nuestro p-valor<0.05, rechazamos la hipòtesis nula y aceptamos la hipòtesis alternativa


#E igual a los datos con administración VC y dosis=2 mg.
E=ToothGrowth[ToothGrowth$supp=="VC" & ToothGrowth$dose==2, ]$len 
#G igual a los datos con administración OJ y dosis=2 mg.
G=ToothGrowth[ToothGrowth$supp=="OJ" & ToothGrowth$dose==2, ]$len 
E
G
boxplot(C,D)
t.test(E, G, "two.sided", mu=0, conf.level = 0.95 ) 
#¿Qué podríamos concluir?