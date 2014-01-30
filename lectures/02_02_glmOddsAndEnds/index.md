---
title       : GLM Odds and Ends
subtitle    : 
author      : Jeffrey Leek
job         : Johns Hopkins Bloomberg School of Public Health
logo        : bloomberg_shield.png
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow   # 
url:
  lib: ../../libraries
  assets: ../../assets
widgets     : [mathjax]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
---






## Pro Tip

What it takes to be an ultra-productive researcher

1. ability to think of a good problem
2. ability to work on it (i.e. code)
3. ability to recognize a worthwhile result
4. ability to make a decision as to when to stop and write up the results
5. ability to write adequately
6. ability to profit constructively from criticism
7. determination to submit the paper to a journal
8. persistence in making changes (if necessary as a result of
journal action).

$$ p_1 \times p_2 \times p_3 \times p_4 \times p_5 \times p_6 \times p_7 \times p_8$$

http://dynamicecology.wordpress.com/2014/01/23/william-shockley-on-what-makes-a-person-write-a-lot-of-papers-and-the-superstar-researcher-system/

---

## Paper of the day

* [Why selective publicaiton of statistically significant results can be effective](http://www.plosone.org/article/info:doi%2F10.1371%2Fjournal.pone.0066463)
* [Why Publishing Everything Is More Effective than Selective Publishing of Statistically Significant Results](http://www.plosone.org/article/info%3Adoi%2F10.1371%2Fjournal.pone.0084896;jsessionid=FE021F235547B98EB616F60877F88081#pone.0084896-DeWinter1)

---

## Checklist for your analysis project

[https://docs.google.com/document/d/1A_5SHCOwVULmaUZmzCXkC13TOhBzuwWUvlRM4P2KhU4/edit?usp=sharing](https://docs.google.com/document/d/1A_5SHCOwVULmaUZmzCXkC13TOhBzuwWUvlRM4P2KhU4/edit?usp=sharing)

* Most common mistakes on first write-up
  * Not having a title
  * Not telling a story 
  * Not explaining why you did things
  * Reporting every analysis you did
  * Reporting models without interpretation
  * Reporting coefficients without interpretation
  * Reporting only measures of significance (e.g. p-values) but no measures of scientific uncertainty 


---

## Most of (generalized) linear regression

$${\rm E}_F[G(\beta,Y | X)] = 0$$


$$ \sum_{i=1}^n G(\hat{\beta},Y_i,X_i) = 0 $$

Most common example: 

$$ {\rm argmin}_{\beta} \sum_i w_i (Y_i - g(X_i^T\beta))^2$$

$$ \sum_{i=1}^n \frac{\partial g(X_i^T\beta)}{\partial \beta}w(X_i^T\beta)(Y- g(X^T\beta)) = 0$$


More parametric from left to right:  

<center>GMM -> Line fitting -> Quasi Likelihood -> Likelihood -> GLMs </center>

---

## Quick aside - estimating variances

Score: $S(\theta)$ is the (multivariate) derivative of the likelihood

$$ \sqrt{n}(\hat{\theta} - \theta) \rightarrow_D N(0, bA^{-1}_nB_nA^{-1}_n)$$

$$A_n = {\rm E}_F\left[ \frac{\partial S(\theta)}{\partial \theta}\right]$$
$$B_n = {\rm E}_F\left[S(\theta) S(\theta)^T\right]$$

It turns out $B_n = - A_n$ for these EE's so ${\rm Cov}_F[\hat{\theta}] = -A_n^{-1} = B_n^{-1}$

Two estimates:

$$\left[{\rm E}\left(\frac{\partial^2}{\partial \theta \partial \theta^T} {\rm E}ll(\theta)\right)\right]_{\theta = \hat{\theta}}$$

$$\left[\frac{\partial^2}{\partial \theta \partial \theta^T} {\rm E}ll(\theta)\right]_{\theta = \hat{\theta}}$$

---

## GLM concepts: random component

<center>$Y_i$ has a distribution</center>

Exponential family:

$$f(y_i | x_i) = h(x_i, \phi) {\rm E}xp\left(\frac{y_i\theta_i - b(\theta_i,x)}{\phi}\right)$$


* Adding lots of little effects $\rightarrow$ Normal distributions
* Binary events $\rightarrow$ Bernoulli & Binomial
* Counting lots of rare events $\rightarrow$ Poisson
* Continual (small) hazard of an event $\rightarrow$ Weibull

But minor modifications can break:
* Different event rates $\rightarrow$ overdispersed Poisson
* More zeros than you expect $\rightarrow$ zero-inflated Poisson

---

## Example: Poisson

$$ f(y_i | \mu_i) = \frac{e^{-\mu_i} \mu_i^{y_i}}{y_i\!}$$
$$= e^{y_i \log \mu_i - \mu_i - \log(y_i\!)}$$
$$=e^{y_i \theta_i - e^{\theta_i} - \log(y_i!)}$$

where $\theta_i = \log(\mu_i)$, $b(\theta_i) = e^{\theta_i}$, $c(y_i) = \log(y_i\!)$

---

## GLM concepts: link and structural component

__Link__:

The goal is to "link" the expectation $\mu_i = {\rm E}[Y_i]$ to the linear predictor $\eta_i = g(\mu_i)$

_Example_: $y_i \sim {\rm Poisson}(\mu_i)$ 

$${\rm E}[y_i] = \mu_i = e^{\theta_i} \implies g(\mu_i) = \log(\mu_i)$$

</br>

__Structural/systematic component__

$${\rm E}[Y_i | x_i] = g(\beta^Tx_i)$$
In other words, the "systematic component" (i.e. the structure of ${\rm E}[Y | x]$ is linear in $x$ and $\beta$ on the given scale.



---

## GLMs: important properties

$$f(y_i | x_i) = h(x_i, \phi) {\rm E}xp\left(\frac{y_i\theta_i - b(\theta_i,x)}{\phi}\right)$$

__Properties__ 

* ${\rm E}ll(\theta_i, \phi | y_i) = \log f(y_i | \theta_i, \phi) = \frac{y_i\theta_i - b(\theta_i)}{a(\phi)} - c(y_i,\phi)$
* ${\rm E}\left(\frac{\partial {\rm E}ll}{\partial \theta}\right) = {\rm E}\left( \frac{f'(y_i| \theta_i, \phi)}{f(y_i | \theta_i, \phi)}  \right) = \int f'(y_i | \theta_i, \phi) = \frac{\partial }{\partial \theta_i} \int f(y_i | \theta_i, \phi) = 0$
* So ${\rm E}\left( \frac{y_i - b'(\theta_i)}{a(\phi)}\right) = 0$ or $\mu_i = {\rm E}[y_i] = b'(\theta_i)$
* $\frac{\partial^2 {\rm E}ll}{\partial \theta_i^2} = \frac{-b''(\theta_i)}{a(\phi)}$ and recall ${\rm E}\left(\frac{\partial^2 {\rm E}ll}{\partial \theta_i^2} \right) = - {\rm E}\left[\left(\frac{\partial {\rm E}ll}{\partial \theta_i}\right)^2\right]$
* $\implies \frac{b''(\theta_i)}{a(\phi)} = {\rm E}\left(\frac{(y_i - b'(\theta_i))^2}{a(\phi)^2} \right) = \frac{1}{a(\phi)^2}{\rm Var}(y_i)$
* $\implies a(\phi)b''(\theta_i) = {\rm Var}(y_i)$

---

## Canonical Link

The $g()$ such that $g(\mu_i) = \beta^Tx_i$

_Example_:

  * $Y_i \sim {\rm Poisson}(\mu_i)$
  * ${\rm E}[Y_i] = \mu_i = e^{\theta_i} \implies g(\mu_i) = \log(\mu_i)$

For the canonical link, $\eta_i = \theta_i = \sum_j x_{ij} \beta_j$ and the kernel of the log likelihood:

$$L(\theta_i, \phi) = \sum [y_i\theta_i - b(\theta_i)]/a(\phi) + \sum c(y_i | \phi)$$

simplifies to: 
$$\sum_i y_i (\sum_j x_{ij} \beta_j) = \sum_j \beta_j \underbrace{\sum_i y_i x_{ij}}_{{\rm sufficient \: stat.}}$$

---

## Links in R

<img class="center" src=../../assets/img/links.png height=400>

---

## Interpreting coefficients (canonical link)

* Gaussian: The expected one unit change for a one unit change in $X$
* Poisson: Expected change in log rate for a one unit change in $X$
* Binomial: Expected change in log odds ratio for one unit change in $X$

* Note that not expected changes on transformed scale (e.g. $exp(\beta)$ for Poisson) but sometimes it is still easier to talk about (it is still ML estimate after all!)
* Often you get good results by transforming $Y$ (e.g. [Box-Cox](http://en.wikipedia.org/wiki/Power_transform) transform) but coefficients have different interpretation (because ${\rm E}[g(Y)] \neq g({\rm E}[Y]))$)

---

## Interactions - depend on Y-scale


<img class="center" src=../../assets/img/interact1.png height=450>

---

## Interactions - careful even with sign

$y$ - interaction positive

<img class="center" src=../../assets/img/interact4.png height=200>

$\log(y-5.7)$ - interaction negative

<img class="center" src=../../assets/img/interact5.png height=200>

---

## Model checking

* __Non-parameteric__ - Does parameter usefully summarize superpopulation?
* __Parametric__ - Are parametric assumptions "right"?
* The mainly-graphical checks we use in either case are similar, although the interpretation changes
* The goal of these checks is to spot major aberrations
  * Typically very little power to spot anything else, without strong assumptions.
* Some things to keep in mind
  * Changing your model after you see the data messes up all Frequentist guarantees (Bayesian ones too)
  * If you do model checking/change your model _you must report this_
  * In some applied areas, you are simply not allowed to do model checking ([maybe nowhere soon](http://www.nature.com/news/reproducibility-the-risks-of-the-replication-drive-1.14184))
  * Missing something important is Very Bad - but choose where to report it



---

## A biased view of model selection

<center> Scientific reasons $>\ldots>$ exploratory analysis w/graphs $>$ exploratory w/summary stats $>$ automated techniques</center>

* We will learn more about these later
* Common automated examples
  * AIC
  * BIC
  * Cross-validation
  * Penalization
  * Analysis of deviance
  

---

## Some things you should plot (more in EDA lectures)


<img class="center" src=../../assets/img/mcheck1.png height=400>

---

## Some things you should plot (more in EDA lectures)


<img class="center" src=../../assets/img/mcheck2.png height=400>

---

## Some things you should plot (more in EDA lectures)


<img class="center" src=../../assets/img/mcheck3.png height=400>

---

## Some things you should plot (more in EDA lectures)


<img class="center" src=../../assets/img/mcheck4.png height=400>

---

## Some things you should plot (more in EDA lectures)


<img class="center" src=../../assets/img/mcheck6.png height=400>

---

## Deviance

$$ D = - 2\left[\ell(\hat{\theta}) - \ell(\tilde{\theta})\right]$$

$$D \sim \phi \chi^2_{n-p}$$

where $n-p$ is the "residual degrees of freedom", D is sometimes known as "residual deviance"

* On its own, deviance tells you nothing about what's going wrong. Is the mean wrong? Is it the variance? Or something else? (Use of deviance alone is not recommended)
* With large samples, large deviances can result from models which are "wrong but useful", e.g. a model with the right mean, but which gives slightly conservative inference
* Deviance-based residuals are also available
* If your different fitted models have different $n$ (perhaps due to missing values being dropped) then comparing their deviances produces garbage
* "Analsis of deviance" (which ``anova`` in R produces) compares deviances for a sequence of models. Be aware it estimates the dispersion parameter $\phi$ from the "biggest" model

---

## Tricks/extensions

* Too many zeros - zero inflated (Poission, Negative Binomial,...)
* Too much variance - overdispersion
* Case control studies
  * Can't estimate probability of disease given exposure
  * For small incidence relative risk (Pr(Disease|Exposure)/Pr(Disease | No Exposure)) can be estimated with odds ratio from logistic regression model Slides 22-27 [http://biostat.jhsph.edu/~jleek/teaching/2011/754/lecture5.pdf](http://biostat.jhsph.edu/~jleek/teaching/2011/754/lecture5.pdf) give more details
* Modeling multiway contingency tables can be done with log-linear models
  * $\vec{y} \sim {\rm Poisson}{\mu} \implies y_{+} = \sum_i y_i \sim \rm Poisson}{\sum \mu_i}$
  * You can work out that this means $\vec{y} | y_{+}$ is multinomial 
  * Likelihood for Poisson log-linear model conditional on summing some margins is multinomial 
  * More on pages 28-34 [http://biostat.jhsph.edu/~jleek/teaching/2011/754/lecture5.pdf](http://biostat.jhsph.edu/~jleek/teaching/2011/754/lecture5.pdf)

---

## Simpson's paradox

<img class="center" src=../../assets/img/simpsons.png height=400>

* Basic idea: Uh-oh confounding! 
* More explicitly: [http://normaldeviate.wordpress.com/2013/06/20/simpsons-paradox-explained/](http://normaldeviate.wordpress.com/2013/06/20/simpsons-paradox-explained/)

---

## Questions?

[https://github.com/jtleek/jhsph753and4/lectures](https://github.com/jtleek/jhsph753and4/lectures)

