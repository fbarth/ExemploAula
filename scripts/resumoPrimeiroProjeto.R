dataset <- read.csv2("~/workspaces/R/humanActivityRecognition/data/dataset-har-PUC-Rio-ugulino.csv")
dataset$user <- NULL
dataset$gender <- NULL
dataset$age <- NULL
dataset$how_tall_in_meters <- NULL
dataset$weight <- NULL
dataset$body_mass_index <- NULL

sapply(dataset, summary)

#feature_scalling <- function(x){
#  return (x - min(x)) / (max(x) - min(x))   
#}

#dataset$x1_linha <- feature_scalling(dataset$x1)
#dataset$x2_linha <- feature_scalling(dataset$x2)
#dataset$x3_linha <- feature_scalling(dataset$x3)
#dataset$x4_linha <- feature_scalling(dataset$x4)
# 
# dataset$y1_linha <- feature_scalling(dataset$y1)
# dataset$y2_linha <- feature_scalling(dataset$y2)
# dataset$y3_linha <- feature_scalling(dataset$y3)
# dataset$y4_linha <- feature_scalling(dataset$y4)
# 
# dataset$z1_linha <- feature_scalling(dataset$z1)
# dataset$z2_linha <- feature_scalling(dataset$z2)
# dataset$z3_linha <- feature_scalling(dataset$z3)
# dataset$z4_linha <- feature_scalling(dataset$z4)
# 
# dataset$how_tall_in_meters_linha <- feature_scalling(dataset$how_tall_in_meters)
# dataset$weight_linha <- feature_scalling(dataset$weight)
# dataset$body_mass_index_linha <- feature_scalling(dataset$body_mass_index)
# 
# dataset <- dataset[, 16:31]


set.seed(1234)
ind <- sample(2, nrow(dataset), prob=c(0.8, 0.2), replace = TRUE)
treina <- dataset[ind == 1, ]
teste <- dataset[ind == 2, ]

#library(party)
#model <- ctree(class ~ ., data=treina)

library(randomForest)
model <- randomForest(class ~., data = treina, 
                      importance = TRUE, do.trace = 100)
plot(model)
varImpPlot(model)

preditos <- predict(model, teste)
matriz_c <- table(preditos, teste$class)
matriz_c
acuracia_teste <- (matriz_c[1,1] + matriz_c[2,2] + matriz_c[3,3] + matriz_c[4,4] + matriz_c[5,5]) / sum(matriz_c)
acuracia_teste
