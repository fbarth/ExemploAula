iris <- read.csv("data/iris.csv")
View(iris)
sapply(iris, class)
sapply(iris,summary)
hist(iris$Petal.Length, 
     col="red", 
     main="Comprimento das pétalas",
     ylab="Frequência", 
     xlab="Comprimento")

boxplot(iris$Petal.Length, 
        col="cyan", 
        main="Comprimento das pétalas")

boxplot(iris$Petal.Width, 
        col="cyan",
        main="Largura das pétalas")

boxplot(iris[,1:4], col='cyan')

plot(iris$Sepal.Length, 
     iris$Sepal.Width, 
     pch=19, col='red')

plot(iris$Petal.Length, 
     iris$Petal.Width, 
     pch=19, col='red')

plot(iris[, 1:4], 
     col='red',
     pch=19)

cor(iris$Sepal.Length, iris$Sepal.Width)
cor(iris$Petal.Length, iris$Petal.Width)
# cor implementa o calculo de correlacao de Pearson.
# cor => [-1, +1]
# cor = -1 => correlacao forte negativa.
# cor = +1 => correlacao forte positiva.
# cor = 0 => sem correlacao

plot(iris$Petal.Length, 
     iris$Petal.Width, 
     pch=19, col=iris$Species)



