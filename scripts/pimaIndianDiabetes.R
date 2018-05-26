
diabetes <- read.csv("data/diabetes.csv", header=FALSE, comment.char="#")
names(diabetes) <- c('pregnant',
                     'glucose',
                     'bloodPressure',
                     'triceps',
                     'insulin',
                     'bodyMass',
                     'diabetesPedigree',
                     'age',
                     'class')

diabetes$class <- as.factor(paste(diabetes$class))
table(diabetes$class)

library(caret)
set.seed(1234)
trainIndex <- createDataPartition(diabetes$class, p = 0.8, list = FALSE, times = 1)
treinamento <- diabetes[trainIndex, ]
teste <- diabetes[-trainIndex, ]

table(treinamento$class)
table(teste$class)

#
# criando um modelo baseado em arvore de decisao
#

library(RWeka)
model <- J48(class ~ . , data = treinamento)
model
plot(model)

pred <- predict(model, teste)
teste$pred <- pred
teste[  ,c('class','pred')]

table(teste$class, pred)

#
# criando um modelo baseado em randomforest
#

library(randomForest)
model2 <- randomForest(class ~ . , 
                       importance = TRUE, 
                       do.trace = 100, 
                       data = treinamento,
                       ntree = 200)
plot(model2)

pred2 <- predict(model2, teste)
teste$pred2 <- pred2
teste[  ,c('class','pred2')]

table(teste$class, pred2)

varImp(model2)
