###########################################
# Proyecto: Taller RStudio UNPA                
# Autora: Eréndira Munguía                          
# Fecha: Agosto 2022           
###########################################
#Para saber más:
#https://www.institutomora.edu.mx/testU/SitePages/martinpaladino/modelos_lineales_con_R.html
#http://r-statistics.co/Linear-Regression.html

#Limpiando memoria
rm(list = ls())

#Ejemplos usando la base precarcada "cars"
?cars
View(cars)

#Visualizando los datos
plot( cars$speed, cars$dist)
#Calculando la correlación de Pearson. Para más info ?cor
cor( cars$speed, cars$dist)

#Encontrando un ajuste lineal. Primer Método.
Lineal<-line(cars$dist ~ cars$speed)
abline(Lineal$coefficients)

#Encontrando un ajuste lineal. Segundo Método.
Lineal_carros <- lm(dist ~ speed, data=cars)
#Visualizando los resultados de la aplicación del modelo.
#Visualizando los datos
plot( cars$speed, cars$dist)
abline(Lineal_carros$coefficients)
#Visualización de los resultados de lm()
#Estas herramientas suelen usarse para validar el modelo
plot(Lineal_carros)
hist(Lineal_carros$residuals)
summary(Lineal_carros)
#Para considerar que un modelo es "estadísticamente significativo"
#el p-value (en ambos resultados) debe ser menor que alfa (usualmente 0.05)
#Esto está representado visualmente con asteriscos,
#mientras más asteriscos tenga una variable mejor.


#############
#Ejemplos usando la base precarcada "iris"

#?iris
View(iris)

#x contiene las mediciones del sépalo para la especie setosa
x <- iris$Sepal.Length[iris$Species=="setosa"]
#x contiene las mediciones del pétalo para la especie setosa
y <- iris$Petal.Length[iris$Species=="setosa"]
#Visualizando los datos
plot( x, y)
#Calculando la correlación de Pearson
cor(x,y)

#Ajustando un modelo linal. Primer método
Lineal<-line(y ~ x)
abline(Lineal$coefficients)
Lineal$coefficients

#Ajustando un modelo linal. Segundo método
Lineal_flores <- lm(y ~ x)
summary(Lineal_flores)

###########################
#Ejemplo de Análisis Factorial
Resultado_FA <- factanal( covmat=ability.cov$cov, factors = 2)
Resultado_FA

