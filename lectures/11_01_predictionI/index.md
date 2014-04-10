---
title       : Prediction
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

A major competitive edge right now in statistics is to not care about the method and to just do what works. It seems like a really simple thing, but our field values people who invent methods and so people are often very attached to the thing they invented. If you aren't attached and just care about using a method that gives a good answer, you have a major competitive advantage in real data analysis.

---

## Papers of the day

"Comparative Meta-analysis of Prognostic Gene Signatures for Late-Stage Ovarian Cancer."
http://www.ncbi.nlm.nih.gov/pubmed/24700801

"Risk Prediction for Late-Stage Ovarian Cancer by Meta-analysis of 1525 Patient Samples."

http://www.ncbi.nlm.nih.gov/pubmed/24700803


---

## Who predicts?

* Local governments -> pension payments
* Google -> whether you will click on an ad
* Amazon -> what movies you will watch
* Insurance companies -> what your risk of death is
* Johns Hopkins -> who will succeed in their programs

---


## Why predict? Glory!

<img class=center src=../../assets/img/08_PredictionAndMachineLearning/volinsky.png height=450>


[http://www.zimbio.com/photos/Chris+Volinsky](http://www.zimbio.com/photos/Chris+Volinsky)



---

## Why predict? Riches!

<img class=center src=../../assets/img/08_PredictionAndMachineLearning/heritage.png height=450>


[http://www.heritagehealthprize.com/c/hhp](http://www.heritagehealthprize.com/c/hhp)



---

## Why predict? For sport!

<img class=center src=../../assets/img/08_PredictionAndMachineLearning/kaggle.png height=350>


[http://www.kaggle.com/](http://www.kaggle.com/)

---

## Why predict? To save lives!

<img class=center src=../../assets/img/08_PredictionAndMachineLearning/oncotype.png height=350>

[http://www.oncotypedx.com/en-US/Home](http://www.oncotypedx.com/en-US/Home)

---

## A useful (if a bit advanced) book

<img class=center src=../../assets/img/08_PredictionAndMachineLearning/elemlearn.png height=350>


[The elements of statistical learning](http://statweb.stanford.edu/~tibs/ElemStatLearn/)

---

## A useful package

<img class=center src=../../assets/img/08_PredictionAndMachineLearning/caret.png height=350>


[http://caret.r-forge.r-project.org/](http://caret.r-forge.r-project.org/)

---

## The central dogma of prediction

<img class=center src=../../assets/img/08_PredictionAndMachineLearning/centraldogma.png height=450>

---

## Components of a predictor

</br>

<center> question -> input data -> features -> algorithm -> parameters -> evaluation  </center>


---

## SPAM Example

</br>

<center> <redtext>question</redtext> -> input data -> features -> algorithm -> parameters -> evaluation  </center>

</br>

__Start with a general question__

Can I automatically detect emails that are SPAM that are not?

__Make it concrete__

Can I use quantitative characteristics of the emails to classify them as SPAM/HAM?


---

## SPAM Example

</br>

<center> question -> <redtext>input data </redtext> -> features -> algorithm -> parameters -> evaluation  </center>

<img class=center src=../../assets/img/spamR.png height='400' />

[http://rss.acs.unt.edu/Rdoc/library/kernlab/html/spam.html](http://rss.acs.unt.edu/Rdoc/library/kernlab/html/spam.html)



---

## SPAM Example

</br>

<center> question -> input data  -> <redtext>features</redtext> -> algorithm -> parameters -> evaluation  </center>

</br>



<b>
Dear Jeff, 

Can you send me your address so I can send you the invitation? 

Thanks,

Ben
</b>




---

## SPAM Example

</br>

<center> question -> input data  -> <redtext>features</redtext> -> algorithm -> parameters -> evaluation  </center>

</br>

<b> 

Dear Jeff, 

Can <rt>you</rt> send me your address so I can send <rt>you</rt> the invitation? 

Thanks,

Ben
</b>

</br>

Frequency of you $= 2/17 = 0.118$

---

## SPAM Example

</br>

<center> question -> input data  -> <redtext>features</redtext> -> algorithm -> parameters -> evaluation  </center>



```r
library(kernlab)
data(spam)
head(spam)
```

```
  make address  all num3d  our over remove internet order mail receive will people report addresses
1 0.00    0.64 0.64     0 0.32 0.00   0.00     0.00  0.00 0.00    0.00 0.64   0.00   0.00      0.00
2 0.21    0.28 0.50     0 0.14 0.28   0.21     0.07  0.00 0.94    0.21 0.79   0.65   0.21      0.14
3 0.06    0.00 0.71     0 1.23 0.19   0.19     0.12  0.64 0.25    0.38 0.45   0.12   0.00      1.75
4 0.00    0.00 0.00     0 0.63 0.00   0.31     0.63  0.31 0.63    0.31 0.31   0.31   0.00      0.00
5 0.00    0.00 0.00     0 0.63 0.00   0.31     0.63  0.31 0.63    0.31 0.31   0.31   0.00      0.00
6 0.00    0.00 0.00     0 1.85 0.00   0.00     1.85  0.00 0.00    0.00 0.00   0.00   0.00      0.00
  free business email  you credit your font num000 money hp hpl george num650 lab labs telnet
1 0.32     0.00  1.29 1.93   0.00 0.96    0   0.00  0.00  0   0      0      0   0    0      0
2 0.14     0.07  0.28 3.47   0.00 1.59    0   0.43  0.43  0   0      0      0   0    0      0
3 0.06     0.06  1.03 1.36   0.32 0.51    0   1.16  0.06  0   0      0      0   0    0      0
4 0.31     0.00  0.00 3.18   0.00 0.31    0   0.00  0.00  0   0      0      0   0    0      0
5 0.31     0.00  0.00 3.18   0.00 0.31    0   0.00  0.00  0   0      0      0   0    0      0
6 0.00     0.00  0.00 0.00   0.00 0.00    0   0.00  0.00  0   0      0      0   0    0      0
  num857 data num415 num85 technology num1999 parts pm direct cs meeting original project   re  edu
1      0    0      0     0          0    0.00     0  0   0.00  0       0     0.00       0 0.00 0.00
2      0    0      0     0          0    0.07     0  0   0.00  0       0     0.00       0 0.00 0.00
3      0    0      0     0          0    0.00     0  0   0.06  0       0     0.12       0 0.06 0.06
4      0    0      0     0          0    0.00     0  0   0.00  0       0     0.00       0 0.00 0.00
5      0    0      0     0          0    0.00     0  0   0.00  0       0     0.00       0 0.00 0.00
6      0    0      0     0          0    0.00     0  0   0.00  0       0     0.00       0 0.00 0.00
  table conference charSemicolon charRoundbracket charSquarebracket charExclamation charDollar
1     0          0          0.00            0.000                 0           0.778      0.000
2     0          0          0.00            0.132                 0           0.372      0.180
3     0          0          0.01            0.143                 0           0.276      0.184
4     0          0          0.00            0.137                 0           0.137      0.000
5     0          0          0.00            0.135                 0           0.135      0.000
6     0          0          0.00            0.223                 0           0.000      0.000
  charHash capitalAve capitalLong capitalTotal type
1    0.000      3.756          61          278 spam
2    0.048      5.114         101         1028 spam
3    0.010      9.821         485         2259 spam
4    0.000      3.537          40          191 spam
5    0.000      3.537          40          191 spam
6    0.000      3.000          15           54 spam
```



---

## SPAM Example


<center> question -> input data  -> features -> <redtext>algorithm</redtext> -> parameters -> evaluation  </center>


```r
plot(density(spam$your[spam$type=="nonspam"]),
     col="blue",main="",xlab="Frequency of 'your'")
lines(density(spam$your[spam$type=="spam"]),col="red")
```

<div class="rimage center"><img src="fig/unnamed-chunk-1.png" title="plot of chunk unnamed-chunk-1" alt="plot of chunk unnamed-chunk-1" class="plot" /></div>


---

## SPAM Example


<center> question -> input data  -> features -> <redtext>algorithm</redtext> -> parameters -> evaluation  </center>

</br></br>

__Our algorithm__

* Find a value $C$. 
* __frequency of 'your' $>$ C__ predict "spam"

---

## SPAM Example


<center> question -> input data  -> features -> algorithm -> <redtext>parameters</redtext> -> evaluation  </center>


```r
plot(density(spam$your[spam$type=="nonspam"]),
     col="blue",main="",xlab="Frequency of 'your'")
lines(density(spam$your[spam$type=="spam"]),col="red")
abline(v=0.5,col="black")
```

<div class="rimage center"><img src="fig/unnamed-chunk-2.png" title="plot of chunk unnamed-chunk-2" alt="plot of chunk unnamed-chunk-2" class="plot" /></div>


---

## SPAM Example


<center> question -> input data  -> features -> algorithm -> parameters -> <redtext>evaluation</redtext></center>


```r
prediction <- ifelse(spam$your > 0.5,"spam","nonspam")
table(prediction,spam$type)/length(spam$type)
```

```
          
prediction nonspam   spam
   nonspam  0.4590 0.1017
   spam     0.1469 0.2923
```


Accuracy$ \approx 0.459 + 0.292 = 0.751$

---


## An important point

<q>The combination of some data and an aching desire for an answer does not ensure that a reasonable answer can be extracted from a given body of data.</q>

<center> John Tukey </center>




---

## Garbage in = Garbage out

<center> question -> <rt>input data</rt> -> features -> algorithm -> parameters -> evaluation  </center>

1. May be easy (movie ratings -> new movie ratings)
2. May be harder (gene expression data -> disease)
3. Depends on what is a "good prediction".
4. Often [more data > better models](http://www.youtube.com/watch?v=yvDCzhbjYWs)
5. The most important step!


---

## Features matter!

<center> question -> input data -> <rt>features</rt> -> algorithm -> parameters -> evaluation  </center>

__Properties of good features__

* Lead to data compression
* Retain relevant information
* Are created based on expert application knowledge

__Common mistakes__

* Trying to automate feature selection
* Not paying attention to data-specific quirks
* Throwing away information unnecessarily

---

## May be automated with care

<center> question -> input data -> <rt>features</rt> -> algorithm -> parameters -> evaluation  </center>

<img class=center src=../../assets/img/08_PredictionAndMachineLearning/autofeatures.jpeg height=300>

[http://arxiv.org/pdf/1112.6209v5.pdf](http://arxiv.org/pdf/1112.6209v5.pdf)

---

## Algorithms matter less than you'd think

<center> question -> input data -> features -> <rt>algorithm</rt> -> parameters -> evaluation  </center>

<img class=center src=../../assets/img/08_PredictionAndMachineLearning/illusiontable.png height=400>

[http://arxiv.org/pdf/math/0606441.pdf](http://arxiv.org/pdf/math/0606441.pdf)

---

## Issues to consider

<img class=center src=../../assets/img/08_PredictionAndMachineLearning/mlconsiderations.jpg height=400>

[http://strata.oreilly.com/2013/09/gaining-access-to-the-best-machine-learning-methods.html](http://strata.oreilly.com/2013/09/gaining-access-to-the-best-machine-learning-methods.html)

---

## Prediction is about accuracy tradeoffs


* Interpretability versus accuracy
* Speed versus accuracy
* Simplicity versus accuracy
* Scalability versus accuracy

---

## Interpretability matters

<img class=center src=../../assets/img/08_PredictionAndMachineLearning/interpretable.png height=150>

</br></br></br>

[http://www.cs.cornell.edu/~chenhao/pub/mldg-0815.pdf](http://www.cs.cornell.edu/~chenhao/pub/mldg-0815.pdf)

---

## Scalability matters

<img class=center src=../../assets/img/08_PredictionAndMachineLearning/netflixno.png height=250>
</br></br></br>

[http://www.techdirt.com/blog/innovation/articles/20120409/03412518422/](http://www.techdirt.com/blog/innovation/articles/20120409/03412518422/)

[http://techblog.netflix.com/2012/04/netflix-recommendations-beyond-5-stars.html](http://techblog.netflix.com/2012/04/netflix-recommendations-beyond-5-stars.html)


---


## In sample versus out of sample

__In Sample Error__: The error rate you get on the same
data set you used to build your predictor. Sometimes
called resubstitution error.

__Out of Sample Error__: The error rate you get on a new
data set. Sometimes called generalization error. 

__Key ideas__

1. Out of sample error is what you care about
2. In sample error $<$ out of sample error
3. The reason is overfitting
  * Matching your algorithm to the data you have

---

## In sample versus out of sample errors


```r
library(kernlab); data(spam); set.seed(333)
smallSpam <- spam[sample(dim(spam)[1],size=10),]
spamLabel <- (smallSpam$type=="spam")*1 + 1
plot(smallSpam$capitalAve,col=spamLabel)
```

<div class="rimage center"><img src="fig/loadDataII.png" title="plot of chunk loadDataII" alt="plot of chunk loadDataII" class="plot" /></div>



---

## Prediction rule 1

* capitalAve $>$ 2.7 = "spam"
* capitalAve $<$ 2.40 = "nonspam"
* capitalAve between 2.40 and 2.45 = "spam"
* capitalAve between 2.45 and 2.7 = "nonspam"

---

## Apply Rule 1 to smallSpam


```r
rule1 <- function(x){
  prediction <- rep(NA,length(x))
  prediction[x > 2.7] <- "spam"
  prediction[x < 2.40] <- "nonspam"
  prediction[(x >= 2.40 & x <= 2.45)] <- "spam"
  prediction[(x > 2.45 & x <= 2.70)] <- "nonspam"
  return(prediction)
}
table(rule1(smallSpam$capitalAve),smallSpam$type)
```

```
         
          nonspam spam
  nonspam       5    0
  spam          0    5
```


---

## Prediction rule 2

* capitalAve $>$ 2.40 = "spam"
* capitalAve $\leq$ 2.40 = "nonspam"


---

## Apply Rule 2 to smallSpam



```r
rule2 <- function(x){
  prediction <- rep(NA,length(x))
  prediction[x > 2.8] <- "spam"
  prediction[x <= 2.8] <- "nonspam"
  return(prediction)
}
table(rule2(smallSpam$capitalAve),smallSpam$type)
```

```
         
          nonspam spam
  nonspam       5    1
  spam          0    4
```


---

## Apply to complete spam data


```r
table(rule1(spam$capitalAve),spam$type)
```

```
         
          nonspam spam
  nonspam    2141  588
  spam        647 1225
```

```r
table(rule2(spam$capitalAve),spam$type)
```

```
         
          nonspam spam
  nonspam    2224  642
  spam        564 1171
```

```r
mean(rule1(spam$capitalAve)==spam$type)
```

```
[1] 0.7316
```

```r
mean(rule2(spam$capitalAve)==spam$type)
```

```
[1] 0.7379
```


---

## Look at accuracy


```r
sum(rule1(spam$capitalAve)==spam$type)
```

```
[1] 3366
```

```r
sum(rule2(spam$capitalAve)==spam$type)
```

```
[1] 3395
```


---


## Basic terms

In general, __Positive__ = identified and __negative__ = rejected. Therefore:

__True positive__ = correctly identified

__False positive__ = incorrectly identified

__True negative__ = correctly rejected

__False negative__ = incorrectly rejected

_Medical testing example_:

__True positive__ = Sick people correctly diagnosed as sick

__False positive__= Healthy people incorrectly identified as sick

__True negative__ = Healthy people correctly identified as healthy

__False negative__ = Sick people incorrectly identified as healthy.

[http://en.wikipedia.org/wiki/Sensitivity_and_specificity](http://en.wikipedia.org/wiki/Sensitivity_and_specificity)

---

## Define your error rate

<img class=center src=../../assets/img/08_PredictionAndMachineLearning/sensspec.png height=400>


[http://en.wikipedia.org/wiki/Sensitivity_and_specificity](http://en.wikipedia.org/wiki/Sensitivity_and_specificity)



---

## Key quantities


<img class=center src=../../assets/img/keyquantities.png height=500>


---

## Key quantities as fractions


<img class=center src=../../assets/img/keyquantfrac.png height=500>



---

## Screening tests


<img class=center src=../../assets/img/predpos1.png height=500>


---

## General population


<img class=center src=../../assets/img/predpos2.png height=500>


---

## General population as fractions


<img class=center src=../../assets/img/predpos3.png height=500>

---

## At risk subpopulation

<img class=center src=../../assets/img/predpos4.png height=500>


---

## At risk subpopulation as fraction

<img class=center src=../../assets/img/predpos5.png height=500>



---

## Key public health issue 

<img class=center src=../../assets/img/mammograms.png height=500>


---

## Key public health issue 

<img class=center src=../../assets/img/prostatescreen.png height=500>





---

## For continuous data

__Mean squared error (MSE)__:

$$\frac{1}{n} \sum_{i=1}^n (Prediction_i - Truth_i)^2$$

__Root mean squared error (RMSE)__:

$$\sqrt{\frac{1}{n} \sum_{i=1}^n(Prediction_i - Truth_i)^2}$$

---

## Common error measures

1. Mean squared error (or root mean squared error)
  * Continuous data, sensitive to outliers
2. Median absolute deviation 
  * Continuous data, often more robust
3. Sensitivity (recall)
  * If you want few missed positives
4. Specificity
  * If you want few negatives called positives
5. Accuracy
  * Weights false positives/negatives equally
6. Concordance
  * One example is [kappa](http://en.wikipedia.org/wiki/Cohen%27s_kappa)
5. Predictive value of a positive (precision)
  * When you are screeing and prevelance is low
  
  ## ROC curves

<img class=center src=../../assets/img/08_PredictionAndMachineLearning/roc1.png height=400>

[http://en.wikipedia.org/wiki/Receiver_operating_characteristic](http://en.wikipedia.org/wiki/Receiver_operating_characteristic)

---

## ROC Curve example

<img class=center src=../../assets/img/08_PredictionAndMachineLearning/roc2.png height=400>

[http://en.wikipedia.org/wiki/Receiver_operating_characteristic](http://en.wikipedia.org/wiki/Receiver_operating_characteristic)

---

## Area under the curve

<img class=center src=../../assets/img/08_PredictionAndMachineLearning/roc1.png height=200>

* AUC = 0.5: random guessing
* AUC = 1: perfect classifer
* In general AUC of above 0.8 considered "good"

[http://en.wikipedia.org/wiki/Receiver_operating_characteristic](http://en.wikipedia.org/wiki/Receiver_operating_characteristic)


---

## Prediction and association

<img class=center src=../../assets/img/predandassoc.png height=400>


---

## What is good?

<img class=center src=../../assets/img/08_PredictionAndMachineLearning/roc3.png height=400>

[http://en.wikipedia.org/wiki/Receiver_operating_characteristic](http://en.wikipedia.org/wiki/Receiver_operating_characteristic)

---

## Study design

<img class=center src=../../assets/img/08_PredictionAndMachineLearning/studyDesign.png height=400>


[http://www2.research.att.com/~volinsky/papers/ASAStatComp.pdf](http://www2.research.att.com/~volinsky/papers/ASAStatComp.pdf)

---

## Key idea

1. Accuracy on the training set (resubstitution accuracy) is optimistic
2. A better estimate comes from an independent set (test set accuracy)
3. But we can't use the test set when building the model or it becomes part of the training set
4. So we estimate the test set accuracy with the training set. 


---

## Cross-validation

_Approach_:

1. Use the training set

2. Split it into training/test sets 

3. Build a model on the training set

4. Evaluate on the test set

5. Repeat and average the estimated errors

_Used for_:

1. Picking variables to include in a model

2. Picking the type of prediction function to use

3. Picking the parameters in the prediction function

4. Comparing different predictors

---

## Random subsampling


<img class=center src=../../assets/img/08_PredictionAndMachineLearning/random.png height=400>


---

## K-fold


<img class=center src=../../assets/img/08_PredictionAndMachineLearning/kfold.png height=400>

---

## Leave one out

<img class=center src=../../assets/img/08_PredictionAndMachineLearning/loocv.png height=400>

---

## Considerations

* For time series data data must be used in "chunks"
* For k-fold cross validation
  * Larger k = less bias, more variance
  * Smaller k = more bias, less variance
* Random sampling must be done _without replacement_
* Random sampling with replacement is the _bootstrap_
  * Underestimates of the error
  * Can be corrected, but it is complicated ([0.632 Bootstrap](http://www.jstor.org/discover/10.2307/2965703?uid=2&uid=4&sid=21103054448997))
* If you cross-validate to pick predictors estimate you must estimate errors on independent data. 

---

## A succcessful predictor

<img class=center src=../../assets/img/08_PredictionAndMachineLearning/fivethirtyeight.png height=400>

[fivethirtyeight.com](fivethirtyeight.com)

---

## Polling data

<img class=center src=../../assets/img/08_PredictionAndMachineLearning/gallup.png height=400>

[http://www.gallup.com/](http://www.gallup.com/)

---

## Weighting the data

<img class=center src=../../assets/img/08_PredictionAndMachineLearning/538.png height=400>

[http://www.fivethirtyeight.com/2010/06/pollster-ratings-v40-methodology.html](http://www.fivethirtyeight.com/2010/06/pollster-ratings-v40-methodology.html)

---

## Key idea

<center>To predict X use data related to X</center>


---

## Key idea

<center>To predict player performance use data about player performance</center>

<img class=center src=../../assets/img/08_PredictionAndMachineLearning/moneyball.jpg height=400>

---

## Key idea

<center>To predict movie preferences use data about movie preferences</center>

<img class=center src=../../assets/img/08_PredictionAndMachineLearning/netflix.png height=400>

---

## Key idea

<center>To predict hospitalizations use data about hospitalizations</center>

<img class=center src=../../assets/img/08_PredictionAndMachineLearning/heritage.png height=400>

---

## Not a hard rule

<center>To predict flu outbreaks use Google searches</center>

<img class=center src=../../assets/img/08_PredictionAndMachineLearning/flutrends.png height=400>

[http://www.google.org/flutrends/](http://www.google.org/flutrends/)

---

## Looser connection = harder prediction

<img class=center src=../../assets/img/08_PredictionAndMachineLearning/oncotype.png height=300>

---

## Data properties matter

<img class=center src=../../assets/img/08_PredictionAndMachineLearning/fluproblems.jpg height=400>

---

## Unrelated data is the most common mistake

<img class=center src=../../assets/img/08_PredictionAndMachineLearning/choc.png height=400>

[http://www.nejm.org/doi/full/10.1056/NEJMon1211064](http://www.nejm.org/doi/full/10.1056/NEJMon1211064)

---

## The caret R package

<img class=center src=../../assets/img/08_PredictionAndMachineLearning/caret.png height=400>

[http://caret.r-forge.r-project.org/](http://caret.r-forge.r-project.org/)

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
  0.9       0.8    0.02         0.05    

 
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
        -1.38e+14          -2.32e+14          -1.30e+14           7.97e+13           7.80e+13  
              our               over             remove           internet              order  
         2.23e+14           1.19e+14           3.08e+14           2.50e+14           2.88e+14  
             mail            receive               will             people             report  
        -3.15e+13           1.06e+14          -7.04e+13          -2.16e+14          -4.49e+13  
        addresses               free           business              email                you  
        -1.10e+13           1.87e+14           9.34e+13           1.57e+14           4.47e+13  
           credit               your               font             num000              money  
         2.63e+13           2.33e+14           5.36e+13           3.28e+14           1.87e+14  
               hp                hpl             george             num650                lab  
        -2.27e+14          -1.08e+14          -2.17e+14           1.06e+14          -1.76e+14  
             labs             telnet             num857               data             num415  
        -3.17e+13          -7.70e+14           2.23e+14          -2.00e+14          -4.32e+14  
            num85         technology            num1999              parts                 pm  
        -1.30e+14           2.70e+14          -2.87e+12          -2.24e+14          -1.21e+14  
           direct                 cs            meeting           original            project  
         7.15e+13          -3.50e+14          -2.84e+14          -3.52e+14          -3.33e+14  
               re                edu              table         conference      charSemicolon  
        -2.23e+14          -3.06e+14          -4.65e+14          -5.71e+14          -5.09e+14  
 charRoundbracket  charSquarebracket    charExclamation         charDollar           charHash  
        -1.67e+14          -1.78e+14           1.88e+14           1.23e+15           3.03e+14  
       capitalAve        capitalLong       capitalTotal  
         4.12e+12           5.61e+11           2.18e+11  

Degrees of Freedom: 3450 Total (i.e. Null);  3393 Residual
Null Deviance:	    4630 
Residual Deviance: 30900 	AIC: 31000
```



--- 

## SPAM Example: Prediction


```r
predictions <- predict(modelFit,newdata=testing)
predictions
```

```
   [1] spam    spam    spam    spam    nonspam spam    spam    spam    spam    spam    spam   
  [12] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
  [23] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
  [34] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
  [45] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
  [56] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
  [67] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
  [78] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
  [89] spam    spam    spam    spam    spam    spam    nonspam spam    spam    spam    spam   
 [100] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
 [111] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
 [122] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
 [133] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
 [144] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
 [155] spam    spam    spam    spam    nonspam spam    spam    spam    spam    spam    spam   
 [166] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
 [177] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
 [188] spam    spam    spam    spam    spam    spam    spam    nonspam spam    spam    spam   
 [199] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
 [210] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
 [221] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
 [232] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
 [243] spam    nonspam spam    spam    spam    spam    spam    spam    spam    spam    spam   
 [254] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
 [265] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
 [276] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
 [287] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
 [298] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
 [309] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
 [320] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
 [331] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
 [342] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
 [353] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
 [364] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
 [375] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
 [386] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
 [397] spam    spam    nonspam spam    spam    spam    nonspam spam    spam    nonspam nonspam
 [408] nonspam spam    spam    spam    nonspam spam    spam    spam    nonspam spam    spam   
 [419] spam    spam    nonspam spam    spam    spam    spam    spam    spam    spam    spam   
 [430] spam    spam    spam    spam    spam    spam    spam    spam    spam    spam    spam   
 [441] spam    spam    spam    spam    spam    spam    spam    spam    spam    nonspam spam   
 [452] spam    spam    nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [463] spam    nonspam spam    nonspam spam    spam    nonspam nonspam nonspam spam    nonspam
 [474] nonspam nonspam nonspam nonspam nonspam spam    nonspam nonspam spam    nonspam nonspam
 [485] nonspam nonspam spam    nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [496] nonspam nonspam nonspam nonspam nonspam spam    nonspam nonspam nonspam nonspam nonspam
 [507] nonspam nonspam spam    nonspam spam    nonspam nonspam nonspam nonspam nonspam spam   
 [518] spam    nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [529] nonspam spam    nonspam nonspam nonspam nonspam spam    spam    nonspam nonspam nonspam
 [540] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam spam    nonspam nonspam
 [551] nonspam spam    nonspam nonspam nonspam nonspam nonspam spam    nonspam spam    spam   
 [562] nonspam spam    nonspam nonspam nonspam nonspam nonspam nonspam spam    nonspam spam   
 [573] spam    nonspam nonspam spam    nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [584] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam spam    nonspam nonspam
 [595] nonspam spam    spam    nonspam nonspam spam    nonspam nonspam nonspam spam    nonspam
 [606] nonspam nonspam nonspam nonspam spam    nonspam nonspam nonspam nonspam nonspam nonspam
 [617] nonspam spam    nonspam nonspam nonspam spam    nonspam nonspam nonspam nonspam nonspam
 [628] nonspam nonspam nonspam nonspam spam    nonspam nonspam spam    nonspam nonspam nonspam
 [639] spam    nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [650] nonspam spam    nonspam nonspam spam    nonspam nonspam spam    nonspam nonspam nonspam
 [661] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [672] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam spam    nonspam
 [683] nonspam nonspam spam    spam    spam    nonspam spam    nonspam nonspam nonspam nonspam
 [694] nonspam nonspam spam    nonspam nonspam nonspam nonspam nonspam nonspam spam    nonspam
 [705] nonspam nonspam nonspam spam    nonspam spam    nonspam nonspam nonspam nonspam nonspam
 [716] nonspam nonspam spam    nonspam nonspam nonspam nonspam spam    nonspam nonspam spam   
 [727] nonspam nonspam nonspam spam    nonspam spam    nonspam nonspam nonspam nonspam nonspam
 [738] spam    spam    spam    nonspam nonspam nonspam nonspam spam    spam    nonspam spam   
 [749] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [760] nonspam nonspam nonspam nonspam nonspam nonspam spam    nonspam nonspam nonspam nonspam
 [771] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [782] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [793] nonspam spam    nonspam nonspam nonspam nonspam spam    spam    nonspam nonspam nonspam
 [804] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam spam    nonspam spam   
 [815] nonspam nonspam nonspam spam    nonspam nonspam spam    nonspam spam    spam    nonspam
 [826] spam    nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [837] nonspam nonspam spam    spam    spam    nonspam nonspam nonspam nonspam nonspam nonspam
 [848] nonspam nonspam nonspam nonspam spam    spam    nonspam nonspam spam    nonspam nonspam
 [859] nonspam nonspam nonspam nonspam spam    nonspam nonspam nonspam nonspam nonspam spam   
 [870] nonspam nonspam nonspam nonspam nonspam nonspam nonspam spam    nonspam nonspam nonspam
 [881] nonspam nonspam spam    nonspam nonspam nonspam nonspam nonspam nonspam nonspam spam   
 [892] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [903] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [914] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam spam   
 [925] nonspam nonspam spam    nonspam nonspam nonspam spam    nonspam spam    nonspam nonspam
 [936] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [947] spam    nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [958] nonspam nonspam nonspam nonspam nonspam spam    nonspam spam    nonspam nonspam nonspam
 [969] nonspam spam    nonspam nonspam spam    nonspam nonspam nonspam nonspam nonspam spam   
 [980] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
 [991] nonspam nonspam nonspam nonspam nonspam spam    nonspam nonspam nonspam nonspam nonspam
[1002] nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
[1013] nonspam spam    nonspam nonspam spam    nonspam spam    nonspam spam    nonspam nonspam
[1024] nonspam spam    spam    nonspam nonspam nonspam nonspam spam    nonspam nonspam spam   
[1035] nonspam nonspam nonspam nonspam nonspam spam    nonspam nonspam nonspam nonspam nonspam
[1046] nonspam nonspam spam    spam    spam    nonspam spam    nonspam nonspam nonspam spam   
[1057] nonspam spam    spam    spam    spam    spam    spam    spam    spam    nonspam nonspam
[1068] nonspam nonspam nonspam nonspam nonspam nonspam nonspam spam    nonspam spam    nonspam
[1079] nonspam spam    nonspam nonspam nonspam spam    nonspam spam    nonspam nonspam spam   
[1090] spam    spam    nonspam spam    nonspam spam    nonspam nonspam nonspam spam    nonspam
[1101] nonspam nonspam nonspam spam    spam    spam    spam    spam    spam    spam    nonspam
[1112] spam    nonspam nonspam nonspam nonspam nonspam spam    nonspam spam    nonspam nonspam
[1123] nonspam spam    spam    nonspam nonspam nonspam nonspam nonspam nonspam nonspam nonspam
[1134] nonspam nonspam spam    nonspam nonspam spam    nonspam nonspam nonspam nonspam spam   
[1145] nonspam nonspam nonspam nonspam spam    nonspam
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
   nonspam     555   14
   spam        142  439
                                        
               Accuracy : 0.864         
                 95% CI : (0.843, 0.884)
    No Information Rate : 0.606         
    P-Value [Acc > NIR] : <2e-16        
                                        
                  Kappa : 0.729         
 Mcnemar's Test P-Value : <2e-16        
                                        
            Sensitivity : 0.796         
            Specificity : 0.969         
         Pos Pred Value : 0.975         
         Neg Pred Value : 0.756         
             Prevalence : 0.606         
         Detection Rate : 0.483         
   Detection Prevalence : 0.495         
      Balanced Accuracy : 0.883         
                                        
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

## Further information

* Caret tutorials:
  * [http://www.edii.uclm.es/~useR-2013/Tutorials/kuhn/user_caret_2up.pdf](http://www.edii.uclm.es/~useR-2013/Tutorials/kuhn/user_caret_2up.pdf)
  * [http://cran.r-project.org/web/packages/caret/vignettes/caret.pdf](http://cran.r-project.org/web/packages/caret/vignettes/caret.pdf)
* A paper introducing the caret package
  * [http://www.jstatsoft.org/v28/i05/paper](http://www.jstatsoft.org/v28/i05/paper)

