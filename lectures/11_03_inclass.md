Prediction tournament
=======================

In this competition we will be building predictors for the [digit data problem](http://www.kaggle.com/c/digit-recognizer/data). You may use any of the techniques we have learned or any other techniques you want to try. 

Each of you will get your own unique training set for this problem consisting of 500 samples. You can download the training data from here:

https://github.com/jtleek/jhsph753and4/blob/master/lectures/trainingdata.zip

You should submit to me a function via email that will take in a data matrix formatted in the same way as the training data (obviously with the sample labels set to NA) and produce a vector of a set of predictions of digits 0-9. 

This code is how you visualize a digit:

```S
# Read in data
digits = read.csv(file.choose(), header=T)

# Makes a plot of the ith digit; notice all digits are rotated!
i=1
mat = matrix(as.numeric(digits[i,-1]),byrow=T,nrow=28)
image(t(mat)[,ncol(mat):1])

# Look at a bunch of digits together
par(mfrow=c(3,3))
for(i in 1:9) {
    mat = matrix(as.numeric(digits[i,-1]),byrow=T,nrow=28)
    image(t(mat)[,ncol(mat):1])
}
```

We will then have a tournament to crown the in class prediction champion. 

