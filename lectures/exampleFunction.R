library(caret)
traindat = read.csv("train20.csv")
traindat$label = as.factor(traindat$label)
model = train(label ~.,method="rpart",data=traindat)
predictNew = function(dat){
  return(predict(model,newdata=dat))
}
table(predictNew(traindat),traindat$label)
confusionMatrix(predictNew(traindat),traindat$label)