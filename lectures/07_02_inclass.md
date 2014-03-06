Bootstrap activity
=======================

### Activity 1 - Stamps!

Load the stamp data with the commands

```S
library(bootstrap)
data(stamp)
stamp = stamp[,1]
```

* How many modes are in the stamps data? 
* Propose a method for estimating a confidence interval for the number of modes with the bootstramp 
* Test on simulated data from multiple modes
* Propose a method for bootstrap hypothesis testing the number of modes > 2. 

### Activity 1 - Time! 

Get two financial time series with the quantmod package

```S
library(quantmod)
getSymbols("GOOG")
getSymbols("AMZN")

AMZN = as.data.frame(AMZN)
GOOG = as.data.frame(GOOG)

aopen = AMZN$AMZN.Open
gopen = GOOG$GOOG.Open

```

* Propose a bootstrap method for testing whether the two curves have the same shape 
* Assume that differences in mean are uninteresting
* Why would this bootstrap approach be flawed?
* What time series might be more useful?