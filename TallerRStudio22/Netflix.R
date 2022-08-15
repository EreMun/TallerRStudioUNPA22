#Base descargada de Kaggle
Netflix <- read.csv("netflix_titles.csv")
View(Netflix)

#¿Qué actor aparece más en los elencos de Netflix?
Actores <- "Elenco"
for (i in Netflix$cast){
  if(i != ""){
    casting <- strsplit(i, split = ",")
    Actores <- Map(c, Actores, casting)
  }
}

#Calcula el número máximo de veces que un actor aparece
n <- max(table(Actores))
#Muestra los actores que aparecen más de 20 veces
table(Actores)[table(Actores)>20]
#Muestra los actores que aparecen n veces
which(table(Actores)==n)
#Muestra los actores que aparecen 21 veces
which(table(Actores)==21)

