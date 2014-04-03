---
title       : Multiple testing
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


Fail fearlessly. Learning things is about trying not to fail. Discovering things is about failing all the time and getting back up and trying again. Research is about failing over and over and keeping your spirits up.

[List of stuff Jeff failed at](http://simplystatistics.org/2012/08/09/a-non-exhaustive-list-of-things-i-have-failed-to/)


---

## Paper of the day

[Statistical significance for genomewide studies](http://www.pnas.org/content/100/16/9440.full)

---

## Three eras of statistics

__The age of Quetelet and his successors, in which huge census-level data sets were brought to bear on simple but important questions__: Are there more male than female births? Is the rate of insanity rising?

The classical period of Pearson, Fisher, Neyman, Hotelling, and their successors, intellectual giants who __developed a theory of optimal inference capable of wringing every drop of information out of a scientific experiment__. The questions dealt with still tended to be simple Is treatment A better than treatment B? 

__The era of scientific mass production__, in which new technologies typified by the microarray allow a single team of scientists to produce data sets of a size Quetelet would envy. But now the flood of data is accompanied by a deluge of questions, perhaps thousands of estimates or hypothesis tests that the statistician is charged with answering together; not at all what the classical masters had in mind. Which variables matter among the thousands measured? How do you relate unrelated information?

[http://www-stat.stanford.edu/~ckirby/brad/papers/2010LSIexcerpt.pdf](http://www-stat.stanford.edu/~ckirby/brad/papers/2010LSIexcerpt.pdf)


---

## Why I am the one true heir of multiple testing

<img class=center src=../../assets/img/heritage.png height=450/>


---

## Reasons for multiple testing

<img class=center src=../../assets/img/datasources.png height='70%'/>


---

## Why correct for multiple tests?

<img class=center src=../../assets/img/jellybeans1.png height='70%'/>


[http://xkcd.com/882/](http://xkcd.com/882/)

---

## Why correct for multiple tests?

<img class=center src=../../assets/img/jellybeans2.png height='70%'/>

[http://xkcd.com/882/](http://xkcd.com/882/)


---

## Types of errors

Suppose you are testing a hypothesis that a parameter $\beta$ equals zero versus the alternative that it does not equal zero. These are the possible outcomes. 
</br></br>

                    | $\beta=0$   | $\beta\neq0$   |  Hypotheses
--------------------|-------------|----------------|---------
Claim $\beta=0$     |      $U$    |      $T$       |  $m-R$
Claim $\beta\neq 0$ |      $V$    |      $S$       |  $R$
    Claims          |     $m_0$   |      $m-m_0$   |  $m$

</br></br>

__Type I error or false positive ($V$)__ Say that the parameter does not equal zero when it does

__Type II error or false negative ($T$)__ Say that the parameter equals zero when it doesn't 


---

## Error rates

__False positive rate__ - The rate at which false results ($\beta = 0$) are called significant: $E\left[\frac{V}{m_0}\right]$*

__Family wise error rate (FWER)__ - The probability of at least one false positive ${\rm Pr}(V \geq 1)$

__False discovery rate (FDR)__ - The rate at which claims of significance are false $E\left[\frac{V}{R}\right]$

* The false positive rate is closely related to the type I error rate [http://en.wikipedia.org/wiki/False_positive_rate](http://en.wikipedia.org/wiki/False_positive_rate)

---

## Controlling the false positive rate

If P-values are correctly calculated calling all $P < \alpha$ significant will control the false positive rate at level $\alpha$ on average. 

<redtext>Problem</redtext>: Suppose that you perform 10,000 tests and $\beta = 0$ for all of them. 

Suppose that you call all $P < 0.05$ significant. 

The expected number of false positives is: $10,000 \times 0.05 = 500$  false positives. 

__How do we avoid so many false positives?__


---

## Controlling family-wise error rate (FWER)


The [Bonferroni correction](http://en.wikipedia.org/wiki/Bonferroni_correction) is the oldest multiple testing correction. 

__Basic idea__: 
* Suppose you do $m$ tests
* You want to control FWER at level $\alpha$ so $Pr(V \geq 1) < \alpha$
* Calculate P-values normally
* Set $\alpha_{fwer} = \alpha/m$
* Call all $P$-values less than $\alpha_{fwer}$ significant

__Pros__: Easy to calculate, conservative
__Cons__: May be very conservative

---


## Bonferroni and FWER 

I nstead of definining a per-test error rate, we can define an error rate over all of the tests, e.g.:
$${\rm Family\; wise \; error\; rate} = P(\{ {\rm \# \; of \; false \; positives} \geq 1\})$$

The most common (and first) method for controlling the FWER is the Bonferroni correction, if the rejection region for a single test is:

$$S_\alpha = \{p : p \leq \alpha\}$$

then if $m$ tests are performed the rejection region is:

$$S^{bon}_\alpha = \{p_i : p_i \leq \alpha/m\}$$

---

## The Bonferroni Correction Control the FWER

Suppose there are $m$ tests and the data for the first $m_0$ tests follows the null distribution then: 
$$ P(\{ {\rm \# \; of \; false \; positives} \geq 1\}) = P\left(\sum_{i=1}^{m_0} I(p_i \leq \alpha/m)  > 0\right)$$
$$ = P\left(\bigcup_{i=1}^{m_0} \{p_i \leq \alpha/m\}\right)$$
$$ \leq \sum_{i=1}^{m_0} P(p_i \leq \alpha/m)$$
$$ \leq \frac{m_0}{m} \alpha \leq \alpha $$


---

## Bonferroni adjusted p-values


$$ p^{bon}_i = \inf\{\alpha : p \in S_{\alpha}^{bon}\}$$
$$ = \inf\{\alpha : p_i \leq \alpha/m\}$$
$$ = \min\{m p_i,1\}$$


The adjusted p-value is no longer uniform under the null, but the adjusted p-value is attractive, because of the interpretation that $p_i^{bon} \leq \alpha$ implies that FWER $\leq \alpha$. See `p.adjust` in R. 

---

## Independendent test statistics

 For independent test statistics we can be smarter:

$$ P( {\rm any\; null \; } p_i < \alpha/m) = 1 - P({\rm all \; null\;} p_i \geq \alpha/m)$$
$$ = 1 - \left(\prod_{i=1}^{m_0} P(p_i \geq \alpha/m)\right)$$
$$ = 1 - (1-\alpha/m)^{m_0}$$
$$ \approx - (1-\alpha/m)^{m}$$

The last approximation is true when $m \approx m_0$. We could use this to get a smarter threshold if we believe the tests are independent (they never are). But its not worth it because $1-(1-\alpha/m)^m \approx 1-e^{-\alpha} \approx 1- (1 - \alpha) = \alpha$. 

---

## Bonferroni and dependence 

In the extreme case; all tests have almost the same $p_j$; if one is small, they're all small. so:

$$ P ({\rm any\; null\;} p_i < \alpha/m) \approx m_0/m P(p_1 < \alpha/m)$$
$$ = (m_0/m) (\alpha/m)$$
$$ \approx \alpha/m$$

 but using $p_i < \alpha$ would have been better. For positively dependent test statistics increasing correlation $\Rightarrow$ more conservative results  on average. But we can get catastrophic errors. 
 
Suppose $p_i$ are all identical for the null cases and by chance $p_i < \alpha/m$. How many errors? 


---

## A common application of Bonferroni

"A genome-wide association study identifies three loci associated with susceptibility to uterine fibroids" 

For each of $\sim 1\times10^7$ SNPs with data $X_i$ fit the model:
$$ {\rm logit}(P(Y_j = 1 | X_ij))  = \beta_{0i} + \beta_{1i} X_{ij}$$

<img class=center src=../../assets/img/manhattan.png height=300/>

---

## Why use Bonferroni?

<img class=center src=../../assets/img/cdcv2.png height=200/>
<img class=center src=../../assets/img/cdcv1.png height=200/>

*  Only a small number of the covariates should show significant association
*  We __really__ don't want false positives


---

## A little known fact

<center>
Bonferroni correction at level $k/m$ gives $EFP \leq k$ regardless of any dependence between tests. 
</center>

* Some people argue this is how we should interpret Bonferroni (see e.g. Gordon 2007)
* This way of interpreting high-throughput data is recommended; $k=1$ is easy to think about (and explain) 
* Sometimes called genomewise error rate-k, $GWER_k$ (see e.g. Chen and Storey 2006)




---

## Back to our 2 x 2 table

$$ Y = \beta_{0i} + \beta_{1i}X_i + \epsilon_i$$

Calculate a P-value for each $\{p_1,\ldots,p_m\}$.


                    | $\beta=0$   | $\beta\neq0$   |  Hypotheses
--------------------|-------------|----------------|---------
Claim $\beta=0$     |      $U$    |      $T$       |  $m-R$
Claim $\beta\neq 0$ |      $V$    |      $S$       |  $R$
    Claims          |     $m_0$   |      $m-m_0$   |  $m$



"Classic" Bonferroni limits $\p(V \geq 1 | m)$; any $V \geq 1$ is "equally bad"

---

## False discovery rates

A less conservative measure of (hypothetical) embarrassment
$$\frac{V}{R\vee1} = \frac{\#{\rm false \; positives}}{\#{\rm declared \; positives}}$$

* This is the __realized__ False Discovery Rate
* "Badness" of each Type I error depends on $R$
*  $R \vee 1$ stops $0/0$, sets embarrassment  = 0 when $R = 0$
*  For a given decision rule, define its $FDR = E\left[\frac{V}{R\vee 1}\right]$

This is the most popular correction when performing _lots_ of tests say in genomics, imagining, astronomy, or other signal-processing disciplines. 

---

## Benjamini and Hochberg

Benjamini and Hochberg (1995) defined a set of rules which control the $FDR$, for independent tests


* Calculate and order the P-values $p_{(1)},\ldots,p_{(m)}$
*  Find the max $i$ : $p_{(i)} \leq \alpha i/m$
* Decide "false" for all tests with $p_i$ below this threshold, and "true" otherwise. 


This __set__ of decisions will have $FDR  =E \left[\frac{V}{R \vee 1}\right]  \leq (m_0/m) \alpha$, for an $m_0,m$. 

---

## Proof of control

The original proof of FDR control based on the BH algorithm was based on an induction argument. Storey, Taylor and Siegmund (2004) gave an elegant and generalizable alternative proof based on martingales that we will study. The basic steps are:


* Show that the BH procedure is equivalent to a random stopping rule. 
* Show that the false discovery proportion can be written as a martingale.
* Use the optional stopping theorem to prove FDR control.  

---

## Martingale digression

__Definition (Billingsley, adapted): __ Let $X_t$ be a stochastic process on a probability space $(\Omega, \mathcal{F}, P)$ and let $\{\mathcal{F}_t\}$ be an increasing set of $\sigma$ algebras such that $\mathcal{F}_s \subset \mathcal{F}_t$ when $s < t$. Then $X_t$ is a _martingale_ with respect to the _filtration_ $\{\mathcal{F}_t\}$ if:

* $X_t$ is measurable $\mathcal{F}_t$.  
* $E[|X_t|] < \infty$
* Almost surely: $E[X_t | \mathcal{F}_s] = X_s$, $s < t$. 

Put simply if $X_t$ is a stochastic process such that the conditions hold, then $E[X_t | X_s] = X_s$ for $s < t$. 


__Definition__: A stopping time with respect to $\{X_t\}$ is a random variable $\tau$ such that the event $\{\tau = t\}$ is measurable with respect to $\mathcal{F}_t$ and $P(\tau < \infty) = 1$ almost surely. 

---

## An example

Suppose a gambler wins 1 dollar every time a flipped coin lands heads and loses 1 dollar every time it comes up tails. After the $t$th flip he has $X_t$ dollars. Then his expected winnings after the next flip is:
$$ E[X_{t+1} | X_{t}] = (X_t + 1)\times \frac{1}{2}  + (X_t - 1) \times \frac{1}{2} = X_t $$

So $X_t$ is a martingale. Some examples of stopping rules are:


* The gambler quits after a fixed number of turns. 
* Playing until he runs out of money.


Examples of things that aren't stopping rules:

* Playing until he is the maximum ahead he ever will be (depends on the future). 
* Playing until he doubles his money (it may never happen). 

---

## Optional stopping theorem


If $\{X_t\}$ is a martingale with respect to the filtration $\{\mathcal{F}_t\}$ and $\tau$ is a stopping time for the martingale, then if $E[\tau] < \infty$ and $X_t$ is an integrable random variable then:

$$E[X_t ] = E[X_0]$$


---

## Proof of control

The original proof of FDR control based on the BH algorithm was based on an induction argument. Storey, Taylor and Siegmund (2004) gave an elegant and generalizable alternative proof based on martingales that we will study. The basic steps are:


* _Show that the BH procedure is equivalent to a random stopping rule._
* Show that the false discovery proportion can be written as a martingale.
* Use the optional stopping theorem to prove FDR control.  

---

## Equivalence of BH procedure and $T_{\alpha}(\widehat{FDR}(t))$

We start off with an estimate of the false discovery rate:

$$\widehat{FDR}(t) = \frac{\pi_0 t}{(R(t) \vee 1)/m}$$

To be conservative we can let $\pi_0 = 1$ (but we could use a conservative estimate of $\pi_0$ and the proof would still hold). Then define the random cutoff:

$$T_{\alpha}(\widehat{FDR}(t)) = \sup\{0\leq t \leq 1: \widehat{FDR}(t) \leq \alpha\}$$

Calling all $\hat{p}_i < T_{\alpha}(\widehat{FDR}(t))$ significant is equivalent to the Benjamin-Hochberg procedure.

---

## Proof

We need to show that 
$$p_{\hat{k}} \leq T_{\alpha}(\widehat{FDR}(t)) < p_{\hat{k} + 1}$$ where $\hat{k}$ is the BH cutoff. But $$\widehat{FDR}(p_{(k)}) = \frac{p_{(k)}}{k/m}$$ so the BH cutoff is $$\hat{k} = \max\{k: p_{(k)} \leq \frac{k}{m}\alpha \} = \max\{k : \widehat{FDR}(p_{(k)}) \leq \alpha\}$$ For $k > \hat{k}$ we have $\widehat{FDR}(p_{(k)}) > \alpha$ and for $k \leq \hat{k}$ we have $\widehat{FDR}(p_{(k)}) \leq \alpha$. So $p_{\hat{k}} \leq T_{\alpha}(\widehat{FDR}(t)) < p_{\hat{k} + 1}$


---

## Proof of control

The original proof of FDR control based on the BH algorithm was based on an induction argument. Storey, Taylor and Siegmund (2004) gave an elegant and generalizable alternative proof based on martingales that we will study. The basic steps are:


* Show that the BH procedure is equivalent to a random stopping rule.
* _Show that the false discovery proportion can be written as a martingale._
* Use the optional stopping theorem to prove FDR control.  

----

## Write FDP as Martingale

The false discovery proportion at cutoff $t$ is $$\frac{V(t)}{R(t)}$$

But $T_{\alpha}(\widehat{FDR}(t)) = \sup\{0\leq t \leq 1: \frac{mt}{R(t) \vee 1} \leq \alpha\}$ and since $(m\times t)/R(t)$ has only positive jumps and a final value of 1, we have that $$\alpha = \frac{T_{\alpha}(\widehat{FDR}(t))\times m}{R[T_{\alpha}(\widehat{FDR}(t))]} \implies R[T_{\alpha}(\widehat{FDR}(t))] = T_{\alpha}(\widehat{FDR}(t)) \times m/\alpha$$

Therefore $$\frac{V[T_{\alpha}(\widehat{FDR}(t))]}{R[T_{\alpha}(\widehat{FDR}(t))]} = \frac{\alpha}{m} \frac{V[T_{\alpha}(\widehat{FDR}(t))]}{T_{\alpha}(\widehat{FDR}(t))}$$

---

## Proof of control

The original proof of FDR control based on the BH algorithm was based on an induction argument. Storey, Taylor and Siegmund (2004) gave an elegant and generalizable alternative proof based on martingales that we will study. The basic steps are:


* Show that the BH procedure is equivalent to a random stopping rule.
* Show that the false discovery proportion can be written as a martingale.
* _Use the optional stopping theorem to prove FDR control._  

---

## Some results from STS

__Lemma 1__: If the p-values of the $m_0$ null hypotheses are independent then $\frac{V(t)}{t} = \frac{\sum_{i=1}^{m_0} 1(p_i \leq t)}{t}$ for $0 \leq t \leq 1$ is a martingale with time running backward with respect to the filtration $\mathcal{F}_t = \sigma(1\{p_i \leq s\}, t \leq s \leq 1,i=1,\ldots,m)$, in other words for $s \leq t$ we have $E[V(s)/s | \mathcal{F}_t] = V(t)/t$. 


__Lemma 2__: The random variable $T_{\alpha}(\widehat{FDR}(t))$ is a stopping time with respect to $\mathcal{F}_t = \sigma(1\{p_i \leq s\}, t \leq s \leq 1,i=1,\ldots,m)$. 


So finally, since the process $V(t)/t$ stopped at $T_{\alpha}(\widehat{FDR}(t))$ is bounded by $m/\alpha$ the optional stopping theorem gives us:

$$FDR[T_{\alpha}(\widehat{FDR}(t))] = \frac{\alpha}{m} E\left[\frac{V[T_{\alpha}(\widehat{FDR}(t))]}{T_{\alpha}(\widehat{FDR}(t))}\right] = \frac{\alpha}{m} E[V(1)] = \frac{m_0}{m}\alpha$$

---

## Storey's approach - less conservative than BH


* We could estimate $m_0$ to get a better FDR controlling procedure
* Storey's algorithm starts by estimating $\pi_0 = \frac{m_0}{m}$ then:
* Calculate and order the P-values $p_{(1)},\ldots,p_{(m)}$
* Find the max $i$ : $p_{(i)} \leq \frac{\alpha i}{\hat{\pi}_0 m}$

----

## Estimating $\pi0$

<img class=center src=../../assets/img/pi0hat.png height='70%'/>


---

## pFDR and Q-value

The positive false discovery rate is: $${\rm pFDR} = E\left[\frac{V}{R} | R > 0\right]$$ which can be compared to the FDR $${\rm FDR} = E\left[\frac{V}{R} | R > 0\right] P(R > 0)$$ The q-value is the pFDR analog of the p-value

$$\hat{p} = \hat{p}(X) = \inf\{\alpha : X \in S_\alpha\}$$ 
$$\hat{q} = \hat{q}(X) = \inf\{{\rm pFDR}(S) : X \in S\}$$ 

See the `qvalue` package in R. 




---

## Example with 10 P-values

<img class=center src=../../assets/img/example10pvals.png height='70%'/>

Controlling all error rates at $\alpha = 0.20$


---

## Case study I: no true positives


```r
set.seed(1010093)
pValues <- rep(NA,1000)
for(i in 1:1000){
  y <- rnorm(20)
  x <- rnorm(20)
  pValues[i] <- summary(lm(y ~ x))$coeff[2,4]
}

# Controls false positive rate
sum(pValues < 0.05)
```

```
[1] 51
```


---

## Case study I: no true positives


```r
# Controls FWER 
sum(p.adjust(pValues,method="bonferroni") < 0.05)
```

```
[1] 0
```

```r
# Controls FDR 
sum(p.adjust(pValues,method="BH") < 0.05)
```

```
[1] 0
```



---

## Case study II: 50% true positives


```r
set.seed(1010093)
pValues <- rep(NA,1000)
for(i in 1:1000){
  x <- rnorm(20)
  # First 500 beta=0, last 500 beta=2
  if(i <= 500){y <- rnorm(20)}else{ y <- rnorm(20,mean=2*x)}
  pValues[i] <- summary(lm(y ~ x))$coeff[2,4]
}
trueStatus <- rep(c("zero","not zero"),each=500)
table(pValues < 0.05, trueStatus)
```

```
       trueStatus
        not zero zero
  FALSE        0  476
  TRUE       500   24
```


---


## Case study II: 50% true positives


```r
# Controls FWER 
table(p.adjust(pValues,method="bonferroni") < 0.05,trueStatus)
```

```
       trueStatus
        not zero zero
  FALSE       23  500
  TRUE       477    0
```

```r
# Controls FDR 
table(p.adjust(pValues,method="BH") < 0.05,trueStatus)
```

```
       trueStatus
        not zero zero
  FALSE        0  487
  TRUE       500   13
```



---


## Case study II: 50% true positives

__P-values versus adjusted P-values__

```r
par(mfrow=c(1,2))
plot(pValues,p.adjust(pValues,method="bonferroni"),pch=19)
plot(pValues,p.adjust(pValues,method="BH"),pch=19)
```

<div class="rimage center"><img src="fig/unnamed-chunk-3.png" title="plot of chunk unnamed-chunk-3" alt="plot of chunk unnamed-chunk-3" class="plot" /></div>



---


## Notes and resources

__Notes__:
* Multiple testing is an entire subfield
* A basic Bonferroni/BH correction is usually enough
* If there is strong dependence between tests there may be problems
  * Consider method="BY"

__Further resources__:
* [Multiple testing procedures with applications to genomics](http://www.amazon.com/Multiple-Procedures-Applications-Genomics-Statistics/dp/0387493166/ref=sr_1_2/102-3292576-129059?ie=UTF8&s=books&qid=1187394873&sr=1-2)
* [Statistical significance for genome-wide studies](http://www.pnas.org/content/100/16/9440.full)
* [Introduction to multiple testing](http://ies.ed.gov/ncee/pubs/20084018/app_b.asp)

