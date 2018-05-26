
#
# O objetivo deste script eh criar um modelo
# para predizer o valor da variavel Species.
#

data("iris")
names(iris)
sapply(iris,class)

#
# criando os datasets de treinamento e teste
#

set.seed(123)
ind = sample(2, nrow(iris), replace = TRUE, prob = c(0.8,0.2))
treinamento <- iris[ind ==1, ]
teste <- iris[ind ==2, ]

# criando uma arvore de decisao

library(RWeka)
model <- J48(Species ~ . , data = treinamento)
#model <- J48(Species ~ Petal.Length + Petal.Length, 
#             data = treinamento)

#validar
pred <- predict(model, teste)
teste$pred <- pred
teste[,c('Species','pred')]

table(teste$Species, pred)

