JHSPH 753 Assignment 2 
=======================

### Problem 1 - Outliers

1. You observe random variables $X_1,...,X_n \sim F$ and you want to estimate the mean. 
2. You know $Pr(X_i {\rm labeled \; an \;outlier \; and \; removed} | X_i)$. 
3. Write down the form for $E[\bar{X} | X_i, {\rm outliers \; removed}]$. 
4. The finite sample expectation is challenging to calculate exactly. Calculate an asymptotic approximation for $E[\bar{X} | X_i, {\rm outliers \; removed}]$.
4. Use the myOutliers function https://github.com/jtleek/jhsph753/blob/master/assignments/myOutliers.R to calculate
the outliers for different distributions (try normal, cauchy, f to start).
5. How does the mean change for different distributions/sample sizes? Do you notice any patterns?
5. Calculate $E[\bar{X} | X_i, {\rm outliers \; removed}]$ using the myOutliers function and compare the expected value to the value you get when manually removing outliers.  
6. Propose an individualized method for theoretically correcting for outliers.


### Problem 2 - Sample mixups

A common problem in many areas of science are "sample mixups" where the labels of two or more samples are switched. Suppose that you have observed values $X_1,\ldots,X_n$ for a set of random variables and observed labels $L_1,\ldots,L_n$ where $L_i = 1$ for treated and $L_i = 0$ for controls. Let $\ell_i$ be the true label for sample $i$. 

* If $Pr(L_i = \ell_i) = \rho$ calculate the expected value of $E[\sum_{L_i=1}X_i - \sum_{L_i=0}X_i | \vec{X}]$ as a function of $\mu_1$ and $\mu_0$ the true group differences. 
* What is ${\rm Var}(\sum_{L_i=1}X_i - \sum_{L_i=0}X_i | \vec{X})$ as a function of $\mu_1$ and $\ell_i$?
* Bonus question (this may be hard but I'll be impressed if you get it). What is $Var[\frac{\hat{\mu}_1 - \hat{\mu}_0}{s.e.(\hat{\mu}_1 - \hat{\mu}_2)} | \vec{X}]$


### Problem 3 - 

