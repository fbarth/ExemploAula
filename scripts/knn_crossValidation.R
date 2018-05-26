library(class)

data(iris)
set.seed(123)
ind = sample(5, nrow(iris), replace = TRUE)

accr_knn1 <- c(0,0,0,0,0)
accr_knn3 <- c(0,0,0,0,0)
accr_knn20 <- c(0,0,0,0,0)

for (i in c(1:5)){
  treinamento = iris[ind != i, ]
  teste = iris[ind == i, ]

  knn.1 <-  knn(treinamento[,-5], teste[,-5], treinamento$Species, k=1)
  accr_knn1[i] <- sum(teste$Species == knn.1)/nrow(teste)
  
  knn.3 <-  knn(treinamento[,-5], teste[,-5], treinamento$Species, k=3)
  accr_knn3[i] <- sum(teste$Species == knn.3)/nrow(teste)
  
  knn.20 <-  knn(treinamento[,-5], teste[,-5], treinamento$Species, k=20)
  accr_knn20[i] <- sum(teste$Species == knn.20)/nrow(teste)
    
}

mean(accr_knn1)
mean(accr_knn3)
mean(accr_knn20)
sd(accr_knn1)
sd(accr_knn3)
sd(accr_knn20)




