---
title       : Causal inference
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




---

## Paper of the day



---

## Today's slide credits

Some usesful resources

* Cosma Shalizi
  * http://www.stat.cmu.edu/~cshalizi/ADAfaEPoV/ADAfaEPoV.pdf
* Elizabeth Stuart
  * 
  * 
* Judea Pearl
  * http://ftp.cs.ucla.edu/pub/stat_ser/r350.pdf
* Eric Xing
  * http://www.cs.cmu.edu/~epxing/Class/10708-05/Slides/causality.pdf

---

## Recall levels of analysis

__In approximate order of difficulty__
* Descriptive
* Exploratory
* Inferential
* Predictive
* </rt>Causal</rt>
* </rt>Mechanistic</rt>

---

## About causal analysis

__Goal__: To find out what happens to one variable when you make another variable change. 

* Usually randomized studies are required to identify causation
* There are approaches to inferring causation in non-randomized studies, but they are complicated and sensitive to assumptions
* Causal relationships are usually identified as average effects, but may not apply to every individual
* Causal models are usually the "gold standard" for data analysis

---

## Causal analysis

<img class=center src="../../assets/img/01_DataScientistToolbox/feces.png" height=400 />


[van Nood et al. (2013) NEJM](http://www.nejm.org/doi/full/10.1056/NEJMoa1205037?query=featured_home)

---

## About mechanistic analysis

__Goal__: Understand the exact changes in variables that lead to changes in other variables for individual objects.

* Incredibly hard to infer, except in simple situations
* Usually modeled by a deterministic set of equations (physical/engineering science)
* Generally the random component of the data is measurement error
* If the equations are known but the parameters are not, they may be inferred with data analysis

---

## Mechanistic analysis

<img class=center src="../../assets/img/01_DataScientistToolbox/mechanistic.png" height=400 />

[http://www.fhwa.dot.gov/resourcecenter/teams/pavement/pave_3pdg.pdf](http://www.fhwa.dot.gov/resourcecenter/teams/pavement/pave_3pdg.pdf)

---

## Illustrating the main problem: shoe size and literacy

<img class=center src=../../assets/img/dexandjeff.png height=500>

---

## Most well known, but least understood idea

<img class=center src=../../assets/img/corcause.png height=300>

---

## An outsider's perspective on causal inference

1. With randomized trials -> straightforwardish (we'll see why in a minute)
2. With observational data -> much, much harder
  * Main problem is confounding
  * The key idea are the assumptions
3. It is all about missing data
  * Missing confounders
  * Missing counterfactual observations
4. Causal inference is not easily described in standard statistical/probabilistic notation. 

---

## This is one of *the hottest topics* 

<img class=center src=../../assets/img/causegene.png height=500>

---

## This is one of *the hottest topics* 

<img class=center src=../../assets/img/planout.png height=500>

---

## Representing causal relatinships

* Rubin model:
  * $Y(0), Y(1)$ or $Y_x(u)$
  * Outcome Y, had the individual, u, received treatment 0,1 or X.
* Pearl model:
  * $Pr(Y = y | do(X=x))$
  * Distribution when setting X=x
* Graphical models
<img class=center src=../../assets/img/shoesize.png height=150>


---

## What do those arrows mean? 

<img class=center src=../../assets/img/shoesize.png height=150>


* Intuitively - an arrow $S \rightarrow L$ means X "influences" Y
* Bayes Networks/Graphical models - represent conditional probabilities e.g. $Pr(S,L| A) = Pr(S| A)Pr(L|A)$


---

## Representing causal relatinships

$\mathrm P(G,S,R)=\mathrm P(G|S,R)\mathrm P(S|R)\mathrm P(R)$
