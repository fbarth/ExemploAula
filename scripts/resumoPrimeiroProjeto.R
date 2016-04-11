dataset <- read.csv2("data/dataset-har-PUC-Rio-ugulino.csv")
set.seed(1234)
ind <- sample(2, nrow(dataset), prob=c(0.8, 0.2))
ind <- sample(2, nrow(dataset), prob=c(0.8, 0.2), replace = TRUE)
treina <- dataset[ind == 1, ]
teste <- dataset[ind == 2, ]
library(party)
model <- ctree(class ~ ., data=treina)
predict(model, teste)
preditos <- predict(model, teste)
matriz_c <- table(preditos, teste$class)
matriz_c
acuracia_teste <- (matriz_c[1,1] + matriz_c[2,2] + matriz_c[3,3] + matriz_c[4,4] + matriz_c[5,5]) / sum(matriz_c)
acuracia_teste
