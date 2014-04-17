---
title       : Prediction III
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

Academia is a weird place. The main criteria you are evaluated on is research. Everything we learn about in this class is focused on that. But in reality you spend a huge amount of time doing the following:

* Meetings
* Giving talks
* Advising students
* Teaching
* Reviewing (grants, papers, etc.)
* Interacting with collaobrators 

These skills are often secondary in graduate programs but become hugely important very quickly when you become a faculty member. Learning how to do them well early is a fast way to make the transition to faculty dramatically easier. 

---

## Papers of the day


[Bagging predictors](http://statistics.berkeley.edu/sites/default/files/tech-reports/421.pdf)

[A short introduction to boosting](http://cseweb.ucsd.edu/~yfreund/papers/IntroToBoosting.pdf)


---

## KNN neighbors 


Basic idea

$$\hat{Y}(x) = \frac{1}{k}\sum_{x_i \in N_k(x)} y_i$$

$$\hat{f}(x) = {\rm Ave}(y_i | x_i \in N_k(x))$$

<img class="center" src="../../assets/img/knn.png" height=300>

---

## 1 nearest neighbor

<img class="center" src="../../assets/img/1nn.png" height=400>

