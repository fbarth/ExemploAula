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



