---
title       : Prediction II 
subtitle    : 
author      : Jeffrey Leek
job         : Johns Hopkins Bloomberg School of Public Health
logo        : bloomberg_shield.png
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow   # 
url:
  lib: ../../librariesNew
  assets: ../../assets
widgets     : [mathjax]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
---





## Pro tip

__Perfect is the enemy of good.__

<img class=center src=../../assets/img/voltaire.jpg height='50%'/>

---

## Papers of the day

Classifier Technology and the Illusion of Progress

"A large number of comparative studies have been conducted in attempts to establish the relative superiority of these methods. This paper argues that these comparisons often fail to take into account important aspects of real problems, so that the apparent superiority of more sophisticated methods may be something of an illusion. In particular, simple methods typically yield performance almost as good as more sophisticated methods, to the extent that the difference in performance may be swamped by other sources of uncertainty that generally are not considered in the classical supervised classification paradigm."

http://arxiv.org/pdf/math/0606441.pdf

---

---

## Caret functionality

* Some preprocessing (cleaning)
  * preProcess
* Data splitting
  * createDataPartition
  * createResample
  * createTimeSlices
* Training/testing functions
  * train
  * predict
* Model comparison
  * confusionMatrix

---

## Machine learning algorithms in R

* Linear discriminant analysis
* Regression
* Naive Bayes
* Support vector machines
* Classification and regression trees
* Random forests
* Boosting
* etc. 

---

## Why caret? 

<img class=center src=../../assets/img/08_PredictionAndMachineLearning/predicttable.png height=250>

[add link](??)


--- 

## SPAM Example: Data splitting


```r
library(caret); library(kernlab); data(spam)
inTrain <- createDataPartition(y=spam$type,
                              p=0.75, list=FALSE)
training <- spam[inTrain,]
testing <- spam[-inTrain,]
dim(training)
```

```
[1] 3451   58
```



--- 

## SPAM Example: Fit a model


```r
set.seed(32343)
modelFit <- train(type ~.,data=training, method="glm")
modelFit
```

```
Generalized Linear Model 

3451 samples
  57 predictors
   2 classes: 'nonspam', 'spam' 

No pre-processing
Resampling: Bootstrapped (25 reps) 

Summary of sample sizes: 3451, 3451, 3451, 3451, 3451, 3451, ... 

Resampling results

  Accuracy  Kappa  Accuracy SD  Kappa SD
  0.9       0.8    0.007        0.01    

 
```



--- 

## SPAM Example: Final model


```r
modelFit <- train(type ~.,data=training, method="glm")
modelFit$finalModel
```

```

Call:  NULL

Coefficients:
      (Intercept)               make            address                all              num3d  
          -1.7536            -0.2804            -0.1262             0.1796             2.7105  
              our               over             remove           internet              order  
           0.6459             0.7168             2.5395             0.6152             0.5839  
             mail            receive               will             people             report  
           0.0634            -0.6195            -0.1218            -0.0531             0.4610  
        addresses               free           business              email                you  
           1.1532             0.8979             0.9198             0.1447             0.0671  
           credit               your               font             num000              money  
           0.8881             0.2555             0.2274             2.5074             0.3407  
               hp                hpl             george             num650                lab  
          -3.4071            -0.3876           -17.3160             0.8427            -1.8310  
             labs             telnet             num857               data             num415  
          -0.0679            -0.0810             2.3615            -0.5636             0.7861  
            num85         technology            num1999              parts                 pm  
          -1.6326             1.3727             0.1826            -0.5185            -0.8755  
           direct                 cs            meeting           original            project  
          -0.3939           -45.7628            -3.1452            -1.5388            -1.6014  
               re                edu              table         conference      charSemicolon  
          -0.9592            -1.2066            -2.7229            -4.2604            -1.3984  
 charRoundbracket  charSquarebracket    charExclamation         charDollar           charHash  
          -0.0641            -0.6246             0.2715             5.2137             2.1093  
       capitalAve        capitalLong       capitalTotal  
           0.0552             0.0119             0.0008  

Degrees of Freedom: 3450 Total (i.e. Null);  3393 Residual
Null Deviance:	    4630 
Residual Deviance: 1330 	AIC: 1440
```



--- 

## SPAM Example: Prediction


```r
predictions <- predict(modelFit,newdata=testing)
predictions
```

```
   [1] spam    spam    spam    spam    spam    spam    nonspam spam    nonspam spam    spam   
  [12] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
  [23] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
  [34] spam    spam    nonspam spam    nonspam spam    spam    spam    nonspam spam    spam   
  [45] spam    spam    spam    spam    spam    spam    spam    nonspam spam    spam    spam   
  [56] spam    nonspam spam    spam    spam    spam    spam    spam    spam    spam    spam   
  [67] spam    spam    spam    spam    nonspam spam    spam    spam    spam    nonspam nonspam
  [78] spam    spam    nonspam spam    spam    nonspam spam    spam    nonspam spam    spam   
  [89] spam    spam    spam    nonspam spam    spam    nonspam spam    spam    spam    spam   
 [100] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
 [111] spam    spam    spam    spam    spam    spam    spam    nonspam nonspam spam    nonspam
 [122] spam    nonspam spam    spam    spam    spam    spam    nonspam spam    spam    spam   
 [133] spam    spam    spam    spam    nonspam spam    spam    spam    spam    spam    spam   
 [144] nonspam nonspam spam    spam    spam    spam    spam    spam    spam    spam    nonspam
 [155] nonspam spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
 [166] spam    spam    nonspam spam    spam    spam    spam    nonspam spam    nonspam spam   
 [177] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
 [188] spam    spam    spam    nonspam spam    spam    spam    spam    spam    spam    spam   
 [199] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
 [210] spam    spam    nonspam spam    spam    spam    spam    spam    spam    spam    spam   
 [221] spam    spam    spam    spam    nonspam spam    spam    spam    nonspam spam    spam   
 [232] spam    spam    nonspam spam    spam    spam    spam    spam    spam    spam    spam   
 [243] spam    spam    spam    spam    spam    nonspam spam    spam    spam    spam    spam   
 [254] spam    spam    nonspam spam    spam    spam    spam    spam    spam    spam    spam   
 [265] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
 [276] spam    spam    spam    spam    spam    spam    spam    nonspam spam    spam    spam   
 [287] spam    spam    spam    spam    spam    spam    spam    nonspam spam    spam    spam   
 [298] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
 [309] spam    spam    spam    nonspam spam    spam    spam    spam    spam    spam    spam   
 [320] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
 [331] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
 [342] spam    spam    spam    spam    spam    spam    spam    nonspam spam    spam    spam   
 [353] spam    spam    nonspam spam    spam    nonspam spam    spam    spam    spam    spam   
 [364] spam    spam    spam    spam    spam    spam    spam    nonspam spam    spam    spam   
 [375] spam    nonspam spam    nonspam spam    spam    nonspam spam    spam    nonspam spam   
 [386] spam    nonspam nonspam nonspam spam    spam    spam    nonspam spam    spam    nonspam
 [397] spam    spam    nonspam spam    spam    spam    spam    spam    spam    nonspam nonspam
 [408] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
 [419] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
 [430] spam    spam    nonspam spam    spam    spam    spam    spam    nonspam spam    spam   
 [441] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
 [452] nonspam spam    nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [463] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [474] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam spam    spam   
 [485] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [496] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam spam    nonspam
 [507] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [518] nonspam nonspam nonspam nonspam nonspam spam    nonspam nonspam nonspam nonspam nonspam
 [529] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam spam    nonspam nonspam
 [540] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam spam   
 [551] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [562] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [573] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [584] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [595] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [606] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [617] nonspam nonspam spam    nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [628] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [639] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [650] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam spam   
 [661] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [672] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam spam   
 [683] nonspam nonspam nonspam nonspam nonspam spam    nonspam nonspam nonspam nonspam nonspam
 [694] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [705] nonspam spam    nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [716] nonspam spam    nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [727] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [738] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [749] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [760] nonspam nonspam nonspam nonspam nonspam nonspam spam    nonspam nonspam nonspam nonspam
 [771] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [782] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [793] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [804] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [815] nonspam nonspam nonspam spam    nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [826] spam    nonspam nonspam nonspam nonspam nonspam nonspam nonspam spam    nonspam nonspam
 [837] nonspam nonspam nonspam nonspam spam    nonspam nonspam nonspam nonspam nonspam nonspam
 [848] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [859] nonspam nonspam nonspam nonspam spam    nonspam nonspam nonspam nonspam nonspam nonspam
 [870] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [881] nonspam nonspam nonspam nonspam nonspam nonspam spam    nonspam nonspam nonspam nonspam
 [892] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [903] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [914] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [925] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [936] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [947] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [958] nonspam nonspam nonspam nonspam nonspam nonspam nonspam spam    nonspam nonspam nonspam
 [969] nonspam nonspam nonspam spam    nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [980] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [991] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
[1002] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
[1013] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
[1024] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
[1035] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam spam    spam    nonspam
[1046] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
[1057] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
[1068] nonspam nonspam spam    nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
[1079] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
[1090] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam spam    nonspam nonspam
[1101] nonspam nonspam nonspam nonspam nonspam nonspam nonspam spam    spam    nonspam nonspam
[1112] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
[1123] nonspam spam    nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
[1134] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
[1145] nonspam nonspam nonspam nonspam nonspam nonspam
Levels: nonspam spam
```


--- 

## SPAM Example: Confusion Matrix


```r
confusionMatrix(predictions,testing$type)
```

```
Confusion Matrix and Statistics

          Reference
Prediction nonspam spam
   nonspam     669   57
   spam         28  396
                                        
               Accuracy : 0.926         
                 95% CI : (0.909, 0.941)
    No Information Rate : 0.606         
    P-Value [Acc > NIR] : < 2e-16       
                                        
                  Kappa : 0.843         
 Mcnemar's Test P-Value : 0.00239       
                                        
            Sensitivity : 0.960         
            Specificity : 0.874         
         Pos Pred Value : 0.921         
         Neg Pred Value : 0.934         
             Prevalence : 0.606         
         Detection Rate : 0.582         
   Detection Prevalence : 0.631         
      Balanced Accuracy : 0.917         
                                        
       'Positive' Class : nonspam       
                                        
```



---

## SPAM Example: Data splitting


```r
library(caret); library(kernlab); data(spam)
inTrain <- createDataPartition(y=spam$type,
                              p=0.75, list=FALSE)
training <- spam[inTrain,]
testing <- spam[-inTrain,]
dim(training)
```

```
[1] 3451   58
```


---

## SPAM Example: K-fold


```r
set.seed(32323)
folds <- createFolds(y=spam$type,k=10,
                             list=TRUE,returnTrain=TRUE)
sapply(folds,length)
```

```
Fold01 Fold02 Fold03 Fold04 Fold05 Fold06 Fold07 Fold08 Fold09 Fold10 
  4141   4140   4141   4142   4140   4142   4141   4141   4140   4141 
```

```r
folds[[1]][1:10]
```

```
 [1]  1  2  3  4  5  6  7  8  9 10
```


---

## SPAM Example: Return test


```r
set.seed(32323)
folds <- createFolds(y=spam$type,k=10,
                             list=TRUE,returnTrain=FALSE)
sapply(folds,length)
```

```
Fold01 Fold02 Fold03 Fold04 Fold05 Fold06 Fold07 Fold08 Fold09 Fold10 
   460    461    460    459    461    459    460    460    461    460 
```

```r
folds[[1]][1:10]
```

```
 [1] 24 27 32 40 41 43 55 58 63 68
```


---

## SPAM Example: Resampling


```r
set.seed(32323)
folds <- createResample(y=spam$type,times=10,
                             list=TRUE)
sapply(folds,length)
```

```
Resample01 Resample02 Resample03 Resample04 Resample05 Resample06 Resample07 Resample08 Resample09 
      4601       4601       4601       4601       4601       4601       4601       4601       4601 
Resample10 
      4601 
```

```r
folds[[1]][1:10]
```

```
 [1]  1  2  3  3  3  5  5  7  8 12
```


---

## SPAM Example: Time Slices


```r
set.seed(32323)
tme <- 1:1000
folds <- createTimeSlices(y=tme,initialWindow=20,
                          horizon=10)
names(folds)
```

```
[1] "train" "test" 
```

```r
folds$train[[1]]
```

```
 [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20
```

```r
folds$test[[1]]
```

```
 [1] 21 22 23 24 25 26 27 28 29 30
```


---


```r
library(caret); library(kernlab); data(spam)
inTrain <- createDataPartition(y=spam$type,
                              p=0.75, list=FALSE)
training <- spam[inTrain,]
testing <- spam[-inTrain,]
hist(training$capitalAve,main="",xlab="ave. capital run length")
```

<div class="rimage center"><img src="fig/loadPackage.png" title="plot of chunk loadPackage" alt="plot of chunk loadPackage" class="plot" /></div>


---

## Why preprocess?


```r
mean(training$capitalAve)
```

```
[1] 5.689
```

```r
sd(training$capitalAve)
```

```
[1] 36.07
```


---

## Standardizing


```r
trainCapAve <- training$capitalAve
trainCapAveS <- (trainCapAve  - mean(trainCapAve))/sd(trainCapAve) 
mean(trainCapAveS)
```

```
[1] -1.111e-17
```

```r
sd(trainCapAveS)
```

```
[1] 1
```


---

## Standardizing - test set


```r
testCapAve <- testing$capitalAve
testCapAveS <- (testCapAve  - mean(trainCapAve))/sd(trainCapAve) 
mean(testCapAveS)
```

```
[1] -0.05523
```

```r
sd(testCapAveS)
```

```
[1] 0.3047
```



---

## Standardizing - _preProcess_ function


```r
preObj <- preProcess(training[,-58],method=c("center","scale"))
trainCapAveS <- predict(preObj,training[,-58])$capitalAve
mean(trainCapAveS)
```

```
[1] -1.111e-17
```

```r
sd(trainCapAveS)
```

```
[1] 1
```



---

## Standardizing - _preProcess_ function


```r
testCapAveS <- predict(preObj,testing[,-58])$capitalAve
mean(testCapAveS)
```

```
[1] -0.05523
```

```r
sd(testCapAveS)
```

```
[1] 0.3047
```


---

## Standardizing - _preProcess_ argument


```r
set.seed(32343)
modelFit <- train(type ~.,data=training,
                  preProcess=c("center","scale"),method="glm")
modelFit
```

```
Generalized Linear Model 

3451 samples
  57 predictors
   2 classes: 'nonspam', 'spam' 

Pre-processing: centered, scaled 
Resampling: Bootstrapped (25 reps) 

Summary of sample sizes: 3451, 3451, 3451, 3451, 3451, 3451, ... 

Resampling results

  Accuracy  Kappa  Accuracy SD  Kappa SD
  0.9       0.8    0.01         0.02    

 
```



---

## Standardizing - Box-Cox transforms


```r
preObj <- preProcess(training[,-58],method=c("BoxCox"))
trainCapAveS <- predict(preObj,training[,-58])$capitalAve
par(mfrow=c(1,2)); hist(trainCapAveS); qqnorm(trainCapAveS)
```

<div class="rimage center"><img src="fig/unnamed-chunk-5.png" title="plot of chunk unnamed-chunk-5" alt="plot of chunk unnamed-chunk-5" class="plot" /></div>



---

## Standardizing - Imputing data


```r
set.seed(13343)

# Make some values NA
training$capAve <- training$capitalAve
selectNA <- rbinom(dim(training)[1],size=1,prob=0.05)==1
training$capAve[selectNA] <- NA

# Impute and standardize
preObj <- preProcess(training[,-58],method="knnImpute")
capAve <- predict(preObj,training[,-58])$capAve

# Standardize true values
capAveTruth <- training$capitalAve
capAveTruth <- (capAveTruth-mean(capAveTruth))/sd(capAveTruth)
```



---

## Standardizing - Imputing data


```r
quantile(capAve - capAveTruth)
```

```
       0%       25%       50%       75%      100% 
-6.923481 -0.008209 -0.004463  0.003379  5.821216 
```

```r
quantile((capAve - capAveTruth)[selectNA])
```

```
       0%       25%       50%       75%      100% 
-6.923481 -0.017066 -0.001588  0.012707  0.975760 
```

```r
quantile((capAve - capAveTruth)[!selectNA])
```

```
       0%       25%       50%       75%      100% 
-0.011267 -0.008090 -0.004497  0.003066  5.821216 
```




## Correlated predictors


```r
library(caret); library(kernlab); data(spam)
inTrain <- createDataPartition(y=spam$type,
                              p=0.75, list=FALSE)
training <- spam[inTrain,]
testing <- spam[-inTrain,]

M <- abs(cor(training[,-58]))
diag(M) <- 0
which(M > 0.8,arr.ind=T)
```

```
       row col
num415  34  32
direct  40  32
num857  32  34
direct  40  34
num857  32  40
num415  34  40
```


---

## Correlated predictors


```r
names(spam)[c(34,32)]
```

```
[1] "num415" "num857"
```

```r
plot(spam[,34],spam[,32])
```

<div class="rimage center"><img src="fig/unnamed-chunk-7.png" title="plot of chunk unnamed-chunk-7" alt="plot of chunk unnamed-chunk-7" class="plot" /></div>



---

## Basic PCA idea

* We might not need every predictor
* A weighted combination of predictors might be better
* We should pick this combination to capture the "most information" possible
* Benefits
  * Reduced number of predictors
  * Reduced noise (due to averaging)


---

## We could rotate the plot

$$ X = 0.71 \times {\rm num 415} + 0.71 \times {\rm num857}$$

$$ Y = 0.71 \times {\rm num 415} - 0.71 \times {\rm num857}$$


```r
X <- 0.71*training$num415 + 0.71*training$num857
Y <- 0.71*training$num415 - 0.71*training$num857
plot(X,Y)
```

<div class="rimage center"><img src="fig/unnamed-chunk-8.png" title="plot of chunk unnamed-chunk-8" alt="plot of chunk unnamed-chunk-8" class="plot" /></div>


---

## Related problems

You have multivariate variables $X_1,\ldots,X_n$ so $X_1 = (X_{11},\ldots,X_{1m})$

* Find a new set of multivariate variables that are uncorrelated and explain as much variance as possible.
* If you put all the variables together in one matrix, find the best matrix created with fewer variables (lower rank) that explains the original data.


The first goal is <font color="#330066">statistical</font> and the second goal is <font color="#993300">data compression</font>.

---

## Related solutions - PCA/SVD

__SVD__

If $X$ is a matrix with each variable in a column and each observation in a row then the SVD is a "matrix decomposition"

$$ X = UDV^T$$

where the columns of $U$ are orthogonal (left singular vectors), the columns of $V$ are orthogonal (right singluar vectors) and $D$ is a diagonal matrix (singular values). 

__PCA__

The principal components are equal to the right singular values if you first scale (subtract the mean, divide by the standard deviation) the variables.

---

## Principal components in R - prcomp


```r
smallSpam <- spam[,c(34,32)]
prComp <- prcomp(smallSpam)
plot(prComp$x[,1],prComp$x[,2])
```

<div class="rimage center"><img src="fig/prcomp.png" title="plot of chunk prcomp" alt="plot of chunk prcomp" class="plot" /></div>


---

## Principal components in R - prcomp


```r
prComp$rotation
```

```
          PC1     PC2
num415 0.7081  0.7061
num857 0.7061 -0.7081
```



---

## PCA on SPAM data


```r
typeColor <- ((spam$type=="spam")*1 + 1)
prComp <- prcomp(log10(spam[,-58]+1))
plot(prComp$x[,1],prComp$x[,2],col=typeColor,xlab="PC1",ylab="PC2")
```

<div class="rimage center"><img src="fig/spamPC.png" title="plot of chunk spamPC" alt="plot of chunk spamPC" class="plot" /></div>



---

## PCA with caret


```r
preProc <- preProcess(log10(spam[,-58]+1),method="pca",pcaComp=2)
spamPC <- predict(preProc,log10(spam[,-58]+1))
plot(spamPC[,1],spamPC[,2],col=typeColor)
```

<div class="rimage center"><img src="fig/unnamed-chunk-10.png" title="plot of chunk unnamed-chunk-10" alt="plot of chunk unnamed-chunk-10" class="plot" /></div>



---

## Preprocessing with PCA


```r
preProc <- preProcess(log10(training[,-58]+1),method="pca",pcaComp=2)
trainPC <- predict(preProc,log10(training[,-58]+1))
modelFit <- train(training$type ~ .,method="glm",data=trainPC)
```


---

## Preprocessing with PCA


```r
testPC <- predict(preProc,log10(testing[,-58]+1))
confusionMatrix(testing$type,predict(modelFit,testPC))
```

```
Confusion Matrix and Statistics

          Reference
Prediction nonspam spam
   nonspam     636   61
   spam         54  399
                                        
               Accuracy : 0.9           
                 95% CI : (0.881, 0.917)
    No Information Rate : 0.6           
    P-Value [Acc > NIR] : <2e-16        
                                        
                  Kappa : 0.791         
 Mcnemar's Test P-Value : 0.576         
                                        
            Sensitivity : 0.922         
            Specificity : 0.867         
         Pos Pred Value : 0.912         
         Neg Pred Value : 0.881         
             Prevalence : 0.600         
         Detection Rate : 0.553         
   Detection Prevalence : 0.606         
      Balanced Accuracy : 0.895         
                                        
       'Positive' Class : nonspam       
                                        
```


---

## Alternative (sets # of PCs)


```r
modelFit <- train(training$type ~ .,method="glm",preProcess="pca",data=training)
confusionMatrix(testing$type,predict(modelFit,testing))
```

```
Confusion Matrix and Statistics

          Reference
Prediction nonspam spam
   nonspam     652   45
   spam         39  414
                                       
               Accuracy : 0.927        
                 95% CI : (0.91, 0.941)
    No Information Rate : 0.601        
    P-Value [Acc > NIR] : <2e-16       
                                       
                  Kappa : 0.847        
 Mcnemar's Test P-Value : 0.585        
                                       
            Sensitivity : 0.944        
            Specificity : 0.902        
         Pos Pred Value : 0.935        
         Neg Pred Value : 0.914        
             Prevalence : 0.601        
         Detection Rate : 0.567        
   Detection Prevalence : 0.606        
      Balanced Accuracy : 0.923        
                                       
       'Positive' Class : nonspam      
                                       
```



## Predicting with trees

* Iteratively split variables into groups
* Split where maximally predictive
* Evaluate "homogeneity" within each branch
* Fitting multiple trees often works better (forests)

__Pros__:
* Easy to implement
* Easy to interpret
* Better performance in nonlinear settings

__Cons__:
* Without pruning/cross-validation can lead to overfitting
* Harder to estimate uncertainty
* Results may be variable


---

## Example Tree

<img class=center src=../../assets/img/08_PredictionAndMachineLearning/obamaTree.png height=450>

[http://graphics8.nytimes.com/images/2008/04/16/us/0416-nat-subOBAMA.jpg](http://graphics8.nytimes.com/images/2008/04/16/us/0416-nat-subOBAMA.jpg)

---

## Basic algorithm

1. Start with all variables in one group
2. Find the variable/split that best separates the outcomes
3. Divide the data into two groups ("leaves") on that split ("node")
4. Within each split, find the best variable/split that separates the outcomes
5. Continue until the groups are too small or sufficiently "pure"

---

## Measures of impurity

$$\hat{p}_{mk} = \frac{1}{N_m}\sum_{x_i\; in \; Leaf \; m}\mathbb{1}(y_i = k)$$

__Misclassification Error__: 
$$ 1 - \hat{p}_{mk(m)}$$

__Gini index__:
$$ \sum_{k \neq k'} \hat{p}_{mk} \times \hat{p}_{mk'} = \sum_{k=1}^K \hat{p}_{mk}(1-\hat{p}_{mk}) $$

__Cross-entropy or deviance__:

$$ -\sum_{k=1}^K \hat{p}_{mk} \ln\hat{p}_{mk} $$


---

## Example: Iris Data


```r
data(iris); library(ggplot2)
names(iris)
```

```
[1] "Sepal.Length" "Sepal.Width"  "Petal.Length" "Petal.Width"  "Species"     
```

```r
table(iris$Species)
```

```

    setosa versicolor  virginica 
        50         50         50 
```



---

## Create training and test sets


```r
inTrain <- createDataPartition(y=iris$Species,
                              p=0.7, list=FALSE)
training <- iris[inTrain,]
testing <- iris[-inTrain,]
dim(training); dim(testing)
```

```
[1] 45  5
```



---

## Iris petal widths/sepal width


```r
qplot(Petal.Width,Sepal.Width,colour=Species,data=training)
```

<div class="rimage center"><img src="fig/unnamed-chunk-13.png" title="plot of chunk unnamed-chunk-13" alt="plot of chunk unnamed-chunk-13" class="plot" /></div>



---

## Iris petal widths/sepal width


```r
library(caret)
modFit <- train(Species ~ .,method="rpart",data=training)
print(modFit$finalModel)
```

```
n= 105 

node), split, n, loss, yval, (yprob)
      * denotes terminal node

1) root 105 70 setosa (0.33333 0.33333 0.33333)  
  2) Petal.Length< 2.5 35  0 setosa (1.00000 0.00000 0.00000) *
  3) Petal.Length>=2.5 70 35 versicolor (0.00000 0.50000 0.50000)  
    6) Petal.Length< 5.05 38  4 versicolor (0.00000 0.89474 0.10526) *
    7) Petal.Length>=5.05 32  1 virginica (0.00000 0.03125 0.96875) *
```


---

## Plot tree


```r
plot(modFit$finalModel, uniform=TRUE, 
      main="Classification Tree")
text(modFit$finalModel, use.n=TRUE, all=TRUE, cex=.8)
```

<div class="rimage center"><img src="fig/unnamed-chunk-14.png" title="plot of chunk unnamed-chunk-14" alt="plot of chunk unnamed-chunk-14" class="plot" /></div>



---

## Prettier plots


```r
library(rattle)
fancyRpartPlot(modFit$finalModel)
```

<div class="rimage center"><img src="fig/unnamed-chunk-15.png" title="plot of chunk unnamed-chunk-15" alt="plot of chunk unnamed-chunk-15" class="plot" /></div>


---

## Predicting new values


```r
predict(modFit,newdata=testing)
```

```
 [1] setosa     setosa     setosa     setosa     setosa     setosa     setosa     setosa    
 [9] setosa     setosa     setosa     setosa     setosa     setosa     setosa     versicolor
[17] versicolor versicolor versicolor versicolor versicolor versicolor versicolor versicolor
[25] versicolor versicolor versicolor versicolor versicolor versicolor virginica  virginica 
[33] virginica  versicolor virginica  versicolor versicolor virginica  versicolor virginica 
[41] virginica  virginica  virginica  virginica  versicolor
Levels: setosa versicolor virginica
```



----
## Bootstrap aggregating (bagging)

__Basic idea__: 

1. Resample cases and recalculate predictions
2. Average or majority vote

__Notes__:

* Similar bias 
* Reduced variance
* More useful for non-linear functions


---

## Ozone data


```r
library(ElemStatLearn); data(ozone,package="ElemStatLearn")
ozone <- ozone[order(ozone$ozone),]
head(ozone)
```

```
    ozone radiation temperature wind
17      1         8          59  9.7
19      4        25          61  9.7
14      6        78          57 18.4
45      7        48          80 14.3
106     7        49          69 10.3
7       8        19          61 20.1
```

[http://en.wikipedia.org/wiki/Bootstrap_aggregating](http://en.wikipedia.org/wiki/Bootstrap_aggregating)


---

## Bagged loess


```r
ll <- matrix(NA,nrow=10,ncol=155)
for(i in 1:10){
  ss <- sample(1:dim(ozone)[1],replace=T)
  ozone0 <- ozone[ss,]; ozone0 <- ozone0[order(ozone0$ozone),]
  loess0 <- loess(temperature ~ ozone,data=ozone0,span=0.2)
  ll[i,] <- predict(loess0,newdata=data.frame(ozone=1:155))
}
```


---

## Bagged loess


```r
plot(ozone$ozone,ozone$temperature,pch=19,cex=0.5)
for(i in 1:10){lines(1:155,ll[i,],col="grey",lwd=2)}
lines(1:155,apply(ll,2,mean),col="red",lwd=2)
```

<div class="rimage center"><img src="fig/unnamed-chunk-16.png" title="plot of chunk unnamed-chunk-16" alt="plot of chunk unnamed-chunk-16" class="plot" /></div>



---

## Random forests

1. Bootstrap samples
2. At each split, bootstrap variables
3. Grow multiple trees and vote

__Pros__:

1. Accuracy

__Cons__:

1. Speed
2. Interpretability
3. Overfitting


---

## Random forests

<img class=center src=../../assets/img/08_PredictionAndMachineLearning/forests.png height=400>

[http://www.robots.ox.ac.uk/~az/lectures/ml/lect5.pdf](http://www.robots.ox.ac.uk/~az/lectures/ml/lect5.pdf)


---

## Iris data


```r
data(iris); library(ggplot2)
inTrain <- createDataPartition(y=iris$Species,
                              p=0.7, list=FALSE)
training <- iris[inTrain,]
testing <- iris[-inTrain,]
```



---

## Random forests


```r
library(caret)
modFit <- train(Species~ .,data=training,method="rf",prox=TRUE)
modFit
```

```
Random Forest 

105 samples
  4 predictors
  3 classes: 'setosa', 'versicolor', 'virginica' 

No pre-processing
Resampling: Bootstrapped (25 reps) 

Summary of sample sizes: 105, 105, 105, 105, 105, 105, ... 

Resampling results across tuning parameters:

  mtry  Accuracy  Kappa  Accuracy SD  Kappa SD
  2     0.9       0.9    0.03         0.05    
  3     0.9       0.9    0.03         0.05    
  4     0.9       0.9    0.03         0.05    

Accuracy was used to select the optimal model using  the largest value.
The final value used for the model was mtry = 3. 
```


---

## Getting a single tree


```r
getTree(modFit$finalModel,k=2)
```

```
  left daughter right daughter split var split point status prediction
1             2              3         3        2.60      1          0
2             0              0         0        0.00     -1          1
3             4              5         4        1.75      1          0
4             6              7         1        4.95      1          0
5             0              0         0        0.00     -1          3
6             0              0         0        0.00     -1          3
7             8              9         1        7.00      1          0
8             0              0         0        0.00     -1          2
9             0              0         0        0.00     -1          3
```


---

## Class "centers"


```r
irisP <- classCenter(training[,c(3,4)], training$Species, modFit$finalModel$prox)
irisP <- as.data.frame(irisP); irisP$Species <- rownames(irisP)
p <- qplot(Petal.Width, Petal.Length, col=Species,data=training)
p + geom_point(aes(x=Petal.Width,y=Petal.Length,col=Species),size=5,shape=4,data=irisP)
```

<div class="rimage center"><img src="fig/centers.png" title="plot of chunk centers" alt="plot of chunk centers" class="plot" /></div>


---

## Predicting new values


```r
pred <- predict(modFit,testing); testing$predRight <- pred==testing$Species
table(pred,testing$Species)
```

```
            
pred         setosa versicolor virginica
  setosa         15          0         0
  versicolor      0         15         1
  virginica       0          0        14
```


---

## Predicting new values


```r
qplot(Petal.Width,Petal.Length,colour=predRight,data=testing,main="newdata Predictions")
```

<div class="rimage center"><img src="fig/unnamed-chunk-18.png" title="plot of chunk unnamed-chunk-18" alt="plot of chunk unnamed-chunk-18" class="plot" /></div>


---

## Notes and further resources

__Notes__:

* Random forests are usually one of the two top
performing algorithms along with boosting in prediction contests.
* Random forests are difficult to interpret but often very accurate. 
* Care should be taken to avoid overfitting (see [rfcv](http://cran.r-project.org/web/packages/randomForest/randomForest.pdf) funtion)


__Further resources__:

* [Random forests](http://www.stat.berkeley.edu/~breiman/RandomForests/cc_home.htm)
* [Random forest Wikipedia](http://en.wikipedia.org/wiki/Random_forest)
* [Elements of Statistical Learning](http://www-stat.stanford.edu/~tibs/ElemStatLearn/)


---

## Boosting: averaging weak models

<img class=center src=../../assets/img/boosting.png height=450>

---

## In R gradiant boosting


```r
modFit <- train(Species~ .,data=training,method="gbm",verbose=FALSE)
modFit
```

```
Stochastic Gradient Boosting 

105 samples
  4 predictors
  3 classes: 'setosa', 'versicolor', 'virginica' 

No pre-processing
Resampling: Bootstrapped (25 reps) 

Summary of sample sizes: 105, 105, 105, 105, 105, 105, ... 

Resampling results across tuning parameters:

  interaction.depth  n.trees  Accuracy  Kappa  Accuracy SD  Kappa SD
  1                  50       0.9       0.9    0.03         0.04    
  1                  100      0.9       0.9    0.03         0.04    
  1                  200      0.9       0.9    0.03         0.04    
  2                  50       0.9       0.9    0.03         0.04    
  2                  100      0.9       0.9    0.03         0.04    
  2                  200      0.9       0.9    0.03         0.04    
  3                  50       0.9       0.9    0.03         0.04    
  3                  100      0.9       0.9    0.03         0.04    
  3                  200      0.9       0.9    0.03         0.04    

Tuning parameter 'shrinkage' was held constant at a value of 0.1
Accuracy was used to select the optimal model using  the largest value.
The final values used for the model were n.trees = 50, interaction.depth = 1 and shrinkage = 0.1. 
```


---

## Naive Bayes

<img class=center src=../../assets/img/naiveBayes.png height=450>


---


```r
modFit <- train(Species~ .,data=training,method="nb",verbose=FALSE)
modFit
```

```
Naive Bayes 

105 samples
  4 predictors
  3 classes: 'setosa', 'versicolor', 'virginica' 

No pre-processing
Resampling: Bootstrapped (25 reps) 

Summary of sample sizes: 105, 105, 105, 105, 105, 105, ... 

Resampling results across tuning parameters:

  usekernel  Accuracy  Kappa  Accuracy SD  Kappa SD
  FALSE      0.9       0.9    0.03         0.05    
  TRUE       0.9       0.9    0.03         0.04    

Tuning parameter 'fL' was held constant at a value of 0
Accuracy was used to select the optimal model using  the largest value.
The final values used for the model were fL = 0 and usekernel = TRUE. 
```



---

## Strongest approach: averaging methods

* You can combine classifiers by averaging/voting
* Combining classifiers improves accuracy
* Combining classifiers reduces interpretability
* Boosting, bagging, and random forests are variants on this theme

---

## Netflix prize

BellKor = Combination of 107 predictors 

<img class=center src=../../assets/img/08_PredictionAndMachineLearning/netflix.png height=450>

[http://www.netflixprize.com//leaderboard](http://www.netflixprize.com//leaderboard)

---

## Heritage health prize - Progress Prize 1

<img class=center src=../../assets/img/08_PredictionAndMachineLearning/makers.png height=200>
[Market Makers](https://kaggle2.blob.core.windows.net/wiki-files/327/e4cd1d25-eca9-49ca-9593-b254a773fe03/Market%20Makers%20-%20Milestone%201%20Description%20V2%201.pdf)

<img class=center src=../../assets/img/08_PredictionAndMachineLearning/mestrom.png height=200>

[Mestrom](https://kaggle2.blob.core.windows.net/wiki-files/327/09ccf652-8c1c-4a3d-b979-ce2369c985e4/Willem%20Mestrom%20-%20Milestone%201%20Description%20V2%202.pdf)


---

## Basic intuition - majority vote

Suppose we have 5 completely independent classifiers

If accuracy is 70% for each:
  * $10\times(0.7)^3(0.3)^2 + 5\times(0.7)^4(0.3)^2 + (0.7)^5$
  * 83.7% majority vote accuracy

With 101 independent classifiers
  * 99.9% majority vote accuracy
  

---

## Approaches for combining classifiers

1. Bagging, boosting, random forests
  * Usually combine similar classifiers
2. Combining different classifiers
  * Model stacking
  * Model ensembling

---

## Example with Wage data

__Create training, test and validation sets__


```r
library(ISLR); data(Wage); library(ggplot2); library(caret);
Wage <- subset(Wage,select=-c(logwage)); set.seed(132434)

# Create a building data set and validation set
inBuild <- createDataPartition(y=Wage$wage,
                              p=0.7, list=FALSE)
validation <- Wage[-inBuild,]; buildData <- Wage[inBuild,]

inTrain <- createDataPartition(y=buildData$wage,
                              p=0.7, list=FALSE)
training <- buildData[inTrain,]; testing <- buildData[-inTrain,]
```



---

## Wage data sets

__Create training, test and validation sets__


```r
dim(training)
```

```
[1] 1474   11
```

```r
dim(testing)
```

```
[1] 628  11
```

```r
dim(validation)
```

```
[1] 898  11
```



---

## Build two different models


```r
mod1 <- train(wage ~.,method="glm",data=training)
mod2 <- train(wage ~.,method="rf",
              data=training, 
              trControl = trainControl(method="cv"),number=3)
```



---

## Predict on the testing set 


```r
pred1 <- predict(mod1,testing); pred2 <- predict(mod2,testing)
qplot(pred1,pred2,colour=wage,data=testing)
```

<div class="rimage center"><img src="fig/predict.png" title="plot of chunk predict" alt="plot of chunk predict" class="plot" /></div>



---

## Fit a model that combines predictors


```r
predDF <- data.frame(pred1,pred2,wage=testing$wage)
combModFit <- train(wage ~.,method="gam",data=predDF)
combPred <- predict(combModFit,predDF)
```



---

## Testing errors


```r
sqrt(sum((pred1-testing$wage)^2))
```

```
[1] 772.8
```

```r
sqrt(sum((pred2-testing$wage)^2))
```

```
[1] 819.8
```

```r
sqrt(sum((combPred-testing$wage)^2))
```

```
[1] 756
```



---

## Predict on validation data set


```r
pred1V <- predict(mod1,validation); pred2V <- predict(mod2,validation)
predVDF <- data.frame(pred1=pred1V,pred2=pred2V)
combPredV <- predict(combModFit,predVDF)
```



---

## Evaluate on validation


```r
sqrt(sum((pred1V-validation$wage)^2))
```

```
[1] 1074
```

```r
sqrt(sum((pred2V-validation$wage)^2))
```

```
[1] 1112
```

```r
sqrt(sum((combPredV-validation$wage)^2))
```

```
[1] 1071
```




---

## Notes and further resources

* Even simple blending can be useful
* Typical model for binary/multiclass data
  * Build an odd number of models
  * Predict with each model
  * Predict the class by majority vote
* This can get dramatically more complicated
  * Simple blending in caret: [caretEnsemble](https://github.com/zachmayer/caretEnsemble) (use at your own risk!)

---

## Recall - scalability matters

<img class=center src=../../assets/img/08_PredictionAndMachineLearning/netflixno.png height=250>
</br></br></br>

[http://www.techdirt.com/blog/innovation/articles/20120409/03412518422/](http://www.techdirt.com/blog/innovation/articles/20120409/03412518422/)

[http://techblog.netflix.com/2012/04/netflix-recommendations-beyond-5-stars.html](http://techblog.netflix.com/2012/04/netflix-recommendations-beyond-5-stars.html)


---

## Further information

* Caret tutorials:
  * [http://www.edii.uclm.es/~useR-2013/Tutorials/kuhn/user_caret_2up.pdf](http://www.edii.uclm.es/~useR-2013/Tutorials/kuhn/user_caret_2up.pdf)
  * [http://cran.r-project.org/web/packages/caret/vignettes/caret.pdf](http://cran.r-project.org/web/packages/caret/vignettes/caret.pdf)
* A paper introducing the caret package
  * [http://www.jstatsoft.org/v28/i05/paper](http://www.jstatsoft.org/v28/i05/paper)


