
#
# 1. Pergunta: É possível determinar a espécie de uma planta
# do gênero Iris levando-se em consideração o comprimento e
# largura de das pétalas e sépalas?
#

#
# 2. Aquisição do dados
#

# leitura dos dados usando um arquivo csv.
# existem outras maneiras: data(), read.xlxs, ...
iris <- read.csv("data/iris.csv")

# visualizacao do data.frame iris
View(iris)
# aplica a função class em todos os atributos do 
# dataset iris
sapply(iris, class)
# aplicar a função summary em todos os atributos 
# do dataset iris
sapply(iris,summary)

#
# 3. Pré-processamento dos dados: que neste caso
# não foi necessário.
#

#
# 4. Análise descritiva dos dados: entender alguns 
# padrões básicos. Fazer uma análise univariada e 
# multi-variada dos dados.
#

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

# análise multi-variada

plot(iris$Sepal.Length, 
     iris$Sepal.Width, 
     pch=19, col='red')

cor(iris$Sepal.Length, iris$Sepal.Width)

plot(iris$Petal.Length, 
     iris$Petal.Width, 
     pch=19, col='red')

cor(iris$Petal.Width, iris$Petal.Length)

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

#
# 5. Modelagem
# a. Hierarquia de aprendizagem de máquina
# indutiva:
# a.1. Supervisionada (modelagem preditiva)
# a.1.1. Classificação (*)
# a.1.1. Regressão
# a.2. Não supervisionada (modelagem descritiva)
# a.2.1. Clustering ou Agrupamento
# a.2.2. Regras de Associação
#

# análise preditiva - classificação

# quando nao existir o pacote
# install.packages("party")
# preciso da package party porque
# quero utilizar o algoritmo ctree.
library(party)

set.seed(1234)
ind <- sample(2, nrow(iris),
              replace = TRUE,
              prob = c(0.8, 0.2))

treinamento <- iris[ind == 1, ]
teste <- iris[ind == 2, ]

model <- ctree(Species ~ 
                 Sepal.Length + 
                 Sepal.Width + 
                 Petal.Length +
                 Petal.Width, 
               data = treinamento)

model <- ctree(Species ~ ., 
               data = treinamento)

plot(model)

treinamento$SpeciesPredicted <- predict(model,
                                        treinamento)
t <- table(treinamento$Species, treinamento$SpeciesPredicted)
acuracia <- (t[1,1]+t[2,2]+t[3,3])/sum(t)

predicted <- predict(model, teste)
t <- table(teste$Species, predicted)
acuraciaTeste <- (t[1,1]+t[2,2]+t[3,3])/sum(t)

