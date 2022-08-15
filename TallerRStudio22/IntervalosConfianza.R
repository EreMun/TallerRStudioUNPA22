#Programa para ilustrar el tema:
# 3. Estimación por Intervalos.
# 3.5  Distribución de Bernoulli
#Del libro de texto: 
#"Una introducción a la estadística inferencial". Luis Rincón. UNAM
#Estadística 2022. UNPA. Lic. en Matemáticas Aplicadas


#limpiando la memoria
rm(list = ls())

#Simularemos muestras de tamaño n
n <- 10
x <- rep(0,n)

#Tomaremos k muestras de tamaño n
k <- 100

#Inicializamos un vector de tamaño k que guardará los promedios de cada muestra
m <- rep(0,k)

#Parámetro:
p <- 0.7

#Generamos k veces n muestras aleatorias
#los datos se generan con una distrubución Ber(p)
for (i in 1:k){
  x <- rbinom(n,1,p)
  #m[i]=(x[1]+...+x[n])/n
  m[i] <- mean(x)  
} 
#Al final del ciclo s contiene los k promedios de las k muestras aleatorias.

#--------
#Modelo teórico
#Media real de distribucion
theta <- p
#Varianza real de distribucion
var <- p*(1-p)
#Promedios estandarizados con parámetros exactos
z <- (m-theta)/sqrt(var/n)
#Teorema del Límite Central:
#las medias de muestras grandes y aleatorias son aproximadamente normales
#Histograma de promedios
hist(m, freq = FALSE, breaks = 11)
#Histograma de promedios estandarizados
hist(z, freq = FALSE, breaks = 11)
#Curva de densidad normal
curve(dnorm(x), from=-3, to=3, ylim=c(0,0.6),
      ylab="F. de densidad", lwd=2, col="blue", add=T)
abline(v=c(-1.96,1.96), col="green")
#En un experimento desconocemos el valor de theta
#-----

#Estimando intervalos de confianza para cada una de las
#k muestras aleatorias de tamaño n

#Primera Solución, calculando extremos del intervalo
a <- m-1.96/sqrt(n)*sqrt(m*(1-m))
b <- m+1.96/sqrt(n)*sqrt(m*(1-m))
#Graficando los intervalos
plot(a, pch = 46, cex = 4, col="dodgerblue3", ylim=c(-0.5,1.5))
points(b, pch = 46, cex = 4, col="slateblue4",ylim=c(0,1))
segments(1:k,a,1:k,b, col="skyblue4")
points(m, pch = 46, cex = 4, col="peru",ylim=c(0,1))
abline(h=theta, col="darkorchid3")

#Segunda Solución
a <- m-1.96/(2*sqrt(n))
b <- m+1.96/(2*sqrt(n))
#Graficando los intervalos segunda solución
plot(a, pch = 46, cex = 3, col="red", ylim=c(0,1))
points(b, pch = 46, cex = 3, col="blue",ylim=c(0,1))
segments(1:k,a,1:k,b)
abline(h=theta, col="green")

#Tercera Solución
a <- m/(1+(1.96^2)/n)
b <- (m+1.96^2/n)/(1+1.96^2/n)
#Graficando los intervalos tercera solución
plot(a, pch = 46, cex = 3, col="red", ylim=c(0,1))
points(b, pch = 46, cex = 3, col="blue",ylim=c(0,1))
segments(1:k,a,1:k,b)
abline(h=theta, col="green")
