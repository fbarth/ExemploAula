data(iris)
set.seed(123)
ind = sample(2, nrow(iris), replace = TRUE, prob = c(0.8,0.2))
treinamento <- iris[ind ==1, ]
teste <- iris[ind ==2, ]

library(class)
knn.1 <-  knn(treinamento[,-5], teste[,-5], treinamento$Species, k=1)
sum(teste$Species == knn.1)/nrow(teste)

knn.3 <-  knn(treinamento[,-5], teste[,-5], treinamento$Species, k=3)
sum(teste$Species == knn.3)/nrow(teste)

knn.20 <-  knn(treinamento[,-5], teste[,-5], treinamento$Species, k=20)
sum(teste$Species == knn.20)/nrow(teste)
