library(caret)
traindat = read.csv("train20.csv")
traindat$label = as.factor(traindat$label)
model = train(label ~.,method="rpart",data=traindat)
predictNew = function(dat){
  return(predict(model,newdata=dat))
}
table(predictNew(traindat),traindat$label)
confusionMatrix(predictNew(traindat),traindat$label)


## Second example
testdat = read.csv("train19.csv")

## Remove near zero variables
pcfit = prcomp(traindat[,-1])
pcs = as.data.frame(predict(pcfit,traindat[,-1]))[,1:20]
pcs$label = traindat$label
model = train(label~.,method="rpart",data=pcs)

