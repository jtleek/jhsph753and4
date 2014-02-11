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
* Bonus question (this may be hard but I'll be impressed if you get it). What is $Var[\frac{\hat{\mu}_1 - \hat{\mu}_0}{s.e.(\hat{\mu}_1 - \hat{\mu}_2)} | \vec{X}]$ (you may consider this an asymptotic problem, that the means are equal, and that the variance is common). 

### Problem 3 - Hidden confounders

Suppose that you have collected a data set where you are measuring the association between a continuous outcome $Y_i$ and a continuous predictor $X_i$. Suppose that there is a hidden confounder $Z_i$ so that $Y_i = \beta_0 + \beta_1 X_i + \beta_2 Z_i e_i$ and $X_i = \gamma_0 + \gamma_1 Z_i + \epsilon_i$. 

* Assume all the variables are normally distributed. Write down the formula for the p-value for testing the hypothesis that $\beta_1 = 0$ given you fit the model $Y_i = \beta_0 + \beta_1 X_i + e_i$ (i.e. ignoring $Z_i$). 
* Suppose you draw two independent samples from this scenario. What is the expected number of times that both p-values will be less than 0.05. 
* For a sample size of 125,000 how small an effect for $\beta_2$ leads to a statistically significant p-value? 


