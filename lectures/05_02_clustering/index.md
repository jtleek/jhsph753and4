---
title       : Clustering
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






## Pro tip

Meet with seminar speakers. When you go on the job market face recognition is priceless. I met Scott Zeger at UW when I was a student. When I came for an interview I already knew him (and Ingo, and Rafa, and ...)

Related: ask a question in seminar. 

Related: [The importance of stupidity in scientific research](http://jcs.biologists.org/content/121/11/1771.full)

---

## Paper(s) of the day

[Detecting novel assocations in large data sets](https://www.sciencemag.org/content/334/6062/1518)

[Over-the-top promo video](http://www.broadinstitute.org/news-and-publications/mine-detecting-novel-associations-large-data-sets)

[Simon and Tibshirani reply](http://statweb.stanford.edu/~tibs/reshef/comment.pdf)

[Kinney and Atwal reply (more thoroughly)](http://www.pnas.org/content/early/2014/02/14/1309933111.full.pdf)

---

## Types of Data Analysis Questions

__In approximate order of difficulty__
* Descriptive
* Exploratory
* Inferential
* Predictive
* Causal
* Mechanistic


---

## About descriptive analyses
__Goal__: Describe a set of data

* The first kind of data analysis performed
* Commonly applied to census data
* The description and interpretation are different steps
* Descriptions can usually not be generalized without additional statistical modeling


---


## Descriptive analysis

<img class=center src=../../assets/img/census2010.png height=450/>

[http://www.census.gov/2010census/](http://www.census.gov/2010census/)

---

## Descriptive analysis

<img class=center src=../../assets/img/ngrams.png height=450/>

[http://books.google.com/ngrams](http://books.google.com/ngrams)

---

## About exploratory analysis

__Goal__: Find relationships you didn't know about

* Exploratory models are good for discovering new connections
* They are also useful for defining future studies
* Exploratory analyses are usually not the final say
* Exploratory analyses alone should not be used for generalizing/predicting
* [Correlation does not imply causation](http://en.wikipedia.org/wiki/Correlation_does_not_imply_causation)

---

## Exploratory analysis

<img class=center src=../../assets/img/brain.jpg width='90%'/>

[Liu et al. (2012) Scientific Reports](http://www.nature.com/srep/2012/121115/srep00834/full/srep00834.html)


---

## Exploratory analysis


<img class=center src=../../assets/img/sloan.png height=450/>

[http://www.sdss.org/](http://www.sdss.org/)


---

## About inferential analysis

__Goal__: Use a relatively small sample of data to say something about a bigger population

* Inference is commonly the goal of statistical models
* Inference involves estimating both the quantity you care about and your uncertainty about your estimate
* Inference depends heavily on both the population and the sampling scheme

---

## Inferential analysis

<img class=center src=../../assets/img/pollution.png height=450/>

[Correia et al. (2013) Epidemiology](http://journals.lww.com/epidem/Fulltext/2013/01000/Effect_of_Air_Pollution_Control_on_Life_Expectancy.4.aspx)


---

## About predictive analysis

__Goal__: To use the data on some objects to predict values for another object

* If $X$ predicts $Y$ it does not mean that $X$ causes $Y$
* Accurate prediction depends heavily on measuring the right variables
* Although there are better and worse prediction models, more data and a simple model [works really well](http://www.youtube.com/watch?v=yvDCzhbjYWs)
* Prediction is very hard, especially about the future [references](http://www.larry.denenberg.com/predictions.html) 

---

## Predictive analysis

<img class=center src=../../assets/img/fivethirtyeight.png height=450/>

[http://fivethirtyeight.blogs.nytimes.com/](http://fivethirtyeight.blogs.nytimes.com/)

---

## Predictive analysis

<img class=center src=../../assets/img/target.png height=450/>

[http://www.forbes.com/sites/kashmirhill/2012/02/16/how-target-figured-out-a-teen-girl-was-pregnant-before-her-father-did/](http://www.forbes.com/sites/kashmirhill/2012/02/16/how-target-figured-out-a-teen-girl-was-pregnant-before-her-father-did/)

---

## About causal analysis

__Goal__: To find out what happens to one variable when you make another variable change. 

* Usually randomized studies are required to identify causation
* There are approaches to inferring causation in non-randomized studies, but they are complicated and sensitive to assumptions
* Causal relationships are usually identified as average effects, but may not apply to every individual
* Causal models are usually the "gold standard" for data analysis

---

## Causal analysis

<img class=center src=../../assets/img/feces.png height=450/>

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

<img class=center src=../../assets/img/mechanistic.png height=450/>

[http://www.fhwa.dot.gov/resourcecenter/teams/pavement/pave_3pdg.pdf](http://www.fhwa.dot.gov/resourcecenter/teams/pavement/pave_3pdg.pdf)



---

## A more rough dichotomy

__In approximate order of difficulty__
* <rt>Descriptive</rt>
* <rt>Exploratory</rt>
* <bt>Inferential</bt>
* <bt>Predictive</bt>
* <bt>Causal</bt>
* <bt>Mechanistic</bt>

<center><rt> Unsupervised </rt></center>
<center><bt> Supervised </bt></center>

---

## Supervised versus unsupervised

__Supervised__
* You have an outcome $Y$ and some covariates $X$
* You typically want to solve something like $argmin_f E\left[(Y-f(X))^2\right] $

__Unsupervised__
* You have a bunch of observations $X$ and you want to understand the relationships between them. 
* You are usually trying to understand patterns in $X$ or group the variables in $X$ in some way

__Semi-supervised__
* Things like "deep learning" - http://en.wikipedia.org/wiki/Deep_learning
* Two cool examples: [Cat recognizer from Youtube videos](http://static.googleusercontent.com/media/research.google.com/en/us/archive/unsupervised_icml2012.pdf), [Learning to sing like a bird](http://people.csail.mit.edu/mhcoen/Papers/birdsong.pdf)


---

## A few techniques for unsupervised analysis

* Kernel density estimation
* Clustering
* Principal components analysis/svd
* Factor analysis
* MDS/ICA/MFPCA/...

---

## Estimating a univariate density

You have some data


```r
library(bootstrap)
data(stamp)
str(stamp)
```

```
'data.frame':	485 obs. of  1 variable:
 $ Thickness: num  0.06 0.064 0.064 0.065 0.066 0.068 0.069 0.069 0.069 0.069 ...
```

```r
thick = stamp$Thickness
```


You want to know what this distribution looks like. 

---

## You could calculate summary statistics



```r
boxplot(thick)
stripchart(thick,add=T,vertical=T,jitter=0.1,method="jitter",pch=19,col=rgb(0,0,1,0.25))
```

<div class="rimage center"><img src="fig/unnamed-chunk-1.png" title="plot of chunk unnamed-chunk-1" alt="plot of chunk unnamed-chunk-1" class="plot" /></div>



---

## Binning

$X_1,\ldots,X_n \sim F$ with density $f(\cdot)$ and you want an estimator $\hat{f}$

First idea - bin the data. In math this is what this looks like:

$$I_j = (x_0 + j\times h,x_0+(j+1)\times h],j=-1,0,1,\ldots$$

Calculate counts in bins

$$C_j = \sum_{i=1}^n I(x_i \in I_j)$$

Parameters are $x_0$, $h$.

---

## You've seen this


```r
par(mfrow=c(1,2))
hist(thick,col="blue"); hist(thick,breaks=100,col="blue")
```

<div class="rimage center"><img src="fig/unnamed-chunk-2.png" title="plot of chunk unnamed-chunk-2" alt="plot of chunk unnamed-chunk-2" class="plot" /></div>


---

## Estimating the density

Suppose you want an actual estimate of $f(\cdot)$, then we need to estimate probability of being in a bin. 

$$\hat{f}(x) = \frac{1}{2hn} \#\{i; X_i \in (x-h,x+h]\}$$

You can think of this as an approximation to this representation of the density:

$$f(x) = \lim_{h \rightarrow 0} \frac{1}{2h} \mathbb{P}[x-h < X \leq x+h]$$

This should look familiar, we are just replacing limits/expectations/etc with their empirical counterparts. 


---

## The kernel density estimator 

$$\hat{f}(x) = \frac{1}{2hn} \#\{i; X_i \in (x-h,x+h]\}$$

can be written as

$$ \hat{f}(x) = \frac{1}{nh} \sum_{i=1}^n w \left(\frac{x-X_i}{h}\right)$$

$$ w(x) = \left\{ \begin{array}{lr} 1/2 & if |x| < 1 \\ 0 & else\end{array}\right.$$

In general you can can write a kernel smoother as: 

$$ \hat{f}(x) = \frac{1}{nh} \sum_{i=1}^n K\left(\frac{x-X_i}{h}\right)$$

where $\int K(x) dx =1$ (this guarantees that $\int \hat{f}(x) dx = 1$) and $h$ is the bandwidth.  

---

## About the kernel and bandwidth

* The bandwidth can be chosen in a large number of ways
* Typically it is automatically chosen (e.g. in statistical software)
* Popular kernels add more weight to nearby points:
  * $K_{\lambda}(x_0,x_i) = D\left(\frac{|x_0 -x_i|}{\lambda}\right)$; $D(t) = (2\pi)^{-1/2}e^{-t^2/2}$ (Gaussian)
  * $K_{\lambda}(x_0,x_i) = D\left(\frac{|x_0 -x_i|}{\lambda}\right)$;  $D(t) = (1-t^2)^2$ if $t \leq 1$ (Tukey Biweight)


http://longor.public.iastate.edu/Stat516S13/slides/04.smoothing1.pdf

---

## The kernel density estimator 


```r
dens = density(thick); 
plot(dens,col="blue",lwd=3); 
```

<div class="rimage center"><img src="fig/density.png" title="plot of chunk density" alt="plot of chunk density" class="plot" /></div>


---

## Create our own KDE 


```r
dvals = rep(0,length(dens$x))
for(i in 1:length(thick)){
  dvals = dvals + dnorm(dens$x,mean=thick[i],sd=dens$bw)/length(thick)
}
plot(dens,col="red",lwd=3); points(dens$x,dvals,col="blue",pch=19,cex=0.5)
```

<div class="rimage center"><img src="fig/unnamed-chunk-3.png" title="plot of chunk unnamed-chunk-3" alt="plot of chunk unnamed-chunk-3" class="plot" /></div>



---

## Bias variance tradeoff 

We often care about things like MSE:

$$ MSE(x) = \mathbb{E}\left[\left(\hat{f}(x) - f(x)\right)^2\right]$$

$$=\left(\mathbb{E}[\hat{f}(x)] - f(x)\right)^2 + {\rm Var}(\hat{f}(x))$$


* The bias of $\hat{f}$ increases and the variance of $\hat{f}$ decreases as $h$ increases. 
* This is the "bias variance" tradeoff in smoothing 


---


## You can do this with supervised learning too

$$E_{\hat{F}}[Y|X=x_0] = {\rm a.v.e.} \{ y_i; x_i = x_0\}$$

* If the values of $x_i$ are categorical we can estimate this directly. 

* If not we need to "borrow strength"
* You've seen this before for linear regression

Define $\{W_i(x)\}_{i=1}^{n}$ for each $x$ and let

$$s(x) = \sum_{i=1}^n W_i(x) y_i$$

http://www.biostat.jhsph.edu/~ririzarr/Teaching/754/

---

## Why this works (intuitively)


$$ E[ Y | X ] = \int y f_{X,Y}(x,y) \, dy / f_X(x)$$

$$s(x) = \frac{ n^{-1}\sum_{i=1}^n K\left( \frac{x - x_i}{h} \right) y_i }
  { n^{-1}\sum_{i=1}^n K\left   ( \frac{ x - x_i }{h} \right)}$$

Again we are basically just taking integrals and replacing them with sums. Noticing a theme here? Write down the theoretical parameter you are trying to estimate and then substitute empirical analogs. 

http://www.biostat.jhsph.edu/~ririzarr/Teaching/754/

---

## Back to univariate smoothing for the moment


$$Bias(x) = \int K(z) (f(x-hz) - f(z))dz$$

$$Var(x) = n^{-1} \int \frac{1}{h^2} K\left(\frac{x-y}{h}\right)^2 f(y)dy - n^{-1} \left(\int \frac{1}{h}K\left(\frac{x-y}{h}\right)f(y)dy \right)^2$$

Assume $h = h_n \rightarrow 0$ with $nh_n \rightarrow 0$. If this is true then bias/variance go to zero as $n\rightarrow \infty$.

You can asymptotically minimize $MSE(X)$ by solving $\frac{\partial}{\partial h} MSE(x) = 0$ 

You get something like this:

$$h_{opt} = n^{-1/5} \left(\frac{f(x)\int K^2(z)dz}{(f''(x)^2 (\int z^2 K(z)dz)^2)}\right)^{1/5}$$

Derivation: http://stat.ethz.ch/education/semesters/SS_2006/CompStat/sk-ch2.pdf

---

## Class exercises

1. What are some cases where density estimation might give you trouble? 
2. How would we estimate the number of modes in a density estimate as a function of $h$? 


---

## Answer to question 2


```r
nmodes <- function(y){
       x <- diff(y)
       n <- length(x)
       sum(x[2:n] < 0  & x[1:(n-1)] >  0)
}
```


---

## In higher dimensions

$X_1, \ldots, X_n \sim f(x_1,\ldots,x_d)$

We can estimate a multivariate smoother

$$ \hat{f}(x) = \frac{1}{nh^d} \sum_{i=1}^n K\left(\frac{x_i-X_i}{h}\right)$$

wher the kernel $K(\cdot)$ is now a function on a d-dimensional vector satisfying

$K(u) \geq 0$, $\int_{\mathbb{R}^d} K(u)du = 1$, $\int_{\mathbb{R}^d}uK(u)du = 0$ and 
$\int_{\mathbb{R}^d} uu^T K(u)du = I_d$

Usually you use a product kernel like $K(u) = \prod_{j=1}^d k(u_j)$. 

---

## Curse of dimensionality

Best possible MSE rate is $O(n^{-4/(4+d)})$

<img class="center" src="../../assets/img/cursedim.png" height=450>

[http://statweb.stanford.edu/~tibs/ElemStatLearn/](http://statweb.stanford.edu/~tibs/ElemStatLearn/)

---

## Clustering

Clustering organizes things that are __close__ into groups


* How do we define close?
* How do we group things?
* How do we visualize the grouping? 
* How do we interpret the grouping? 

---

## Hugely important/impactful

<img class=center src=../../assets/img/cluster.png height=450>

[http://scholar.google.com/scholar?hl=en&q=cluster+analysis&btnG=&as_sdt=1%2C21&as_sdtp=](http://scholar.google.com/scholar?hl=en&q=cluster+analysis&btnG=&as_sdt=1%2C21&as_sdtp=)

---

## Hierarchical clustering

* An agglomerative approach
  * Find closest two things
  * Put them together
  * Find next closest
* Requires
  * A defined distance
  * A merging approach
* Produces
  * A tree showing how close things are to each other


---


## How do we define close?

* Most important step
  * Garbage in -> garbage out
* Distance or similarity
  * Continuous - euclidean distance
  * Continuous - correlation similarity
  * Binary - manhattan distance
* Pick a distance/similarity that makes sense for your problem
  
  

---

## Example distances - Euclidean

<img class=center src=../../assets/img/distance.png height=450>

[http://rafalab.jhsph.edu/688/lec/lecture5-clustering.pdf](http://rafalab.jhsph.edu/688/lec/lecture5-clustering.pdf)


---

## Example distances - Euclidean

<img class=center src=../../assets/img/distance2.png height=300>

In general:

$$\sqrt{(A_1-A_2)^2 + (B_1-B_2)^2 + \ldots + (Z_1-Z_2)^2}$$
[http://rafalab.jhsph.edu/688/lec/lecture5-clustering.pdf](http://rafalab.jhsph.edu/688/lec/lecture5-clustering.pdf)



---

## Example distances - Manhattan

<img class=center src=../../assets/img/manhattan.svg height=300>

In general:

$$|A_1-A_2| + |B_1-B_2| + \ldots + |Z_1-Z_2|$$

[http://en.wikipedia.org/wiki/Taxicab_geometry](http://en.wikipedia.org/wiki/Taxicab_geometry)



---

## Hierarchical clustering - example


```r
set.seed(1234); par(mar=c(0,0,0,0))
x <- rnorm(12,mean=rep(1:3,each=4),sd=0.2)
y <- rnorm(12,mean=rep(c(1,2,1),each=4),sd=0.2)
plot(x,y,col="blue",pch=19,cex=2)
text(x+0.05,y+0.05,labels=as.character(1:12))
```

<div class="rimage center"><img src="fig/createData.png" title="plot of chunk createData" alt="plot of chunk createData" class="plot" /></div>



---

## Hierarchical clustering - `dist`

* Important parameters: _x_,_method_

```r
dataFrame <- data.frame(x=x,y=y)
dist(dataFrame)
```

```
         1       2       3       4       5       6       7       8       9      10      11
2  0.34121                                                                                
3  0.57494 0.24103                                                                        
4  0.26382 0.52579 0.71862                                                                
5  1.69425 1.35818 1.11953 1.80667                                                        
6  1.65813 1.31960 1.08339 1.78081 0.08150                                                
7  1.49823 1.16621 0.92569 1.60132 0.21110 0.21667                                        
8  1.99149 1.69093 1.45649 2.02849 0.61704 0.69792 0.65063                                
9  2.13630 1.83168 1.67836 2.35676 1.18350 1.11500 1.28583 1.76461                        
10 2.06420 1.76999 1.63110 2.29239 1.23848 1.16550 1.32063 1.83518 0.14090                
11 2.14702 1.85183 1.71074 2.37462 1.28154 1.21077 1.37370 1.86999 0.11624 0.08318        
12 2.05664 1.74663 1.58659 2.27232 1.07701 1.00777 1.17740 1.66224 0.10849 0.19129 0.20803
```


---

## Hierarchical clustering - #1

<div class="rimage center"><img src="fig/unnamed-chunk-6.png" title="plot of chunk unnamed-chunk-6" alt="plot of chunk unnamed-chunk-6" class="plot" /></div>




---

## Hierarchical clustering - #2

<div class="rimage center"><img src="fig/unnamed-chunk-7.png" title="plot of chunk unnamed-chunk-7" alt="plot of chunk unnamed-chunk-7" class="plot" /></div>




---

## Hierarchical clustering - #3

<div class="rimage center"><img src="fig/unnamed-chunk-8.png" title="plot of chunk unnamed-chunk-8" alt="plot of chunk unnamed-chunk-8" class="plot" /></div>




---

## Hierarchical clustering - hclust


```r
dataFrame <- data.frame(x=x,y=y)
distxy <- dist(dataFrame)
hClustering <- hclust(distxy)
plot(hClustering)
```

<div class="rimage center"><img src="fig/unnamed-chunk-9.png" title="plot of chunk unnamed-chunk-9" alt="plot of chunk unnamed-chunk-9" class="plot" /></div>



---

## Prettier dendrograms


```r
myplclust <- function( hclust, lab=hclust$labels, lab.col=rep(1,length(hclust$labels)), hang=0.1,...){
  ## modifiction of plclust for plotting hclust objects *in colour*!
  ## Copyright Eva KF Chan 2009
  ## Arguments:
  ##    hclust:    hclust object
  ##    lab:        a character vector of labels of the leaves of the tree
  ##    lab.col:    colour for the labels; NA=default device foreground colour
  ##    hang:     as in hclust & plclust
  ## Side effect:
  ##    A display of hierarchical cluster with coloured leaf labels.
  y <- rep(hclust$height,2); x <- as.numeric(hclust$merge)
  y <- y[which(x<0)]; x <- x[which(x<0)]; x <- abs(x)
  y <- y[order(x)]; x <- x[order(x)]
  plot( hclust, labels=FALSE, hang=hang, ... )
  text( x=x, y=y[hclust$order]-(max(hclust$height)*hang),
        labels=lab[hclust$order], col=lab.col[hclust$order], 
        srt=90, adj=c(1,0.5), xpd=NA, ... )
}
```



---

## Pretty dendrograms


```r
dataFrame <- data.frame(x=x,y=y)
distxy <- dist(dataFrame)
hClustering <- hclust(distxy)
myplclust(hClustering,lab=rep(1:3,each=4),lab.col=rep(1:3,each=4))
```

<div class="rimage center"><img src="fig/unnamed-chunk-10.png" title="plot of chunk unnamed-chunk-10" alt="plot of chunk unnamed-chunk-10" class="plot" /></div>


---

## Even Prettier dendrograms


<img class=center src=../../assets/img/prettydendro.png height=450>


[http://gallery.r-enthusiasts.com/RGraphGallery.php?graph=79](http://gallery.r-enthusiasts.com/RGraphGallery.php?graph=79)


---

## Merging points - complete

<div class="rimage center"><img src="fig/unnamed-chunk-11.png" title="plot of chunk unnamed-chunk-11" alt="plot of chunk unnamed-chunk-11" class="plot" /></div>




---

## Merging points - average

<div class="rimage center"><img src="fig/unnamed-chunk-12.png" title="plot of chunk unnamed-chunk-12" alt="plot of chunk unnamed-chunk-12" class="plot" /></div>



---

## `heatmap()`


```r
dataFrame <- data.frame(x=x,y=y)
set.seed(143)
dataMatrix <- as.matrix(dataFrame)[sample(1:12),]
heatmap(dataMatrix)
```

<div class="rimage center"><img src="fig/unnamed-chunk-13.png" title="plot of chunk unnamed-chunk-13" alt="plot of chunk unnamed-chunk-13" class="plot" /></div>



---

## K-means clustering

* A partioning approach
  * Fix a number of clusters
  * Get "centroids" of each cluster
  * Assign things to closest centroid
  * Reclaculate centroids
* Requires
  * A defined distance metric
  * A number of clusters
  * An initial guess as to cluster centroids
* Produces
  * Final estimate of cluster centroids
  * An assignment of each point to clusters
  

---

## K-means clustering -  example



```r
set.seed(1234); par(mar=c(0,0,0,0))
x <- rnorm(12,mean=rep(1:3,each=4),sd=0.2)
y <- rnorm(12,mean=rep(c(1,2,1),each=4),sd=0.2)
plot(x,y,col="blue",pch=19,cex=2)
text(x+0.05,y+0.05,labels=as.character(1:12))
```

<div class="rimage center"><img src="fig/createDataK.png" title="plot of chunk createDataK" alt="plot of chunk createDataK" class="plot" /></div>



---

## K-means clustering -  starting centroids


<div class="rimage center"><img src="fig/unnamed-chunk-14.png" title="plot of chunk unnamed-chunk-14" alt="plot of chunk unnamed-chunk-14" class="plot" /></div>


---

## K-means clustering -  assign to closest centroid

<div class="rimage center"><img src="fig/unnamed-chunk-15.png" title="plot of chunk unnamed-chunk-15" alt="plot of chunk unnamed-chunk-15" class="plot" /></div>


---

## K-means clustering -  recalculate centroids

<div class="rimage center"><img src="fig/unnamed-chunk-16.png" title="plot of chunk unnamed-chunk-16" alt="plot of chunk unnamed-chunk-16" class="plot" /></div>



---

## K-means clustering -  reassign values

<div class="rimage center"><img src="fig/unnamed-chunk-17.png" title="plot of chunk unnamed-chunk-17" alt="plot of chunk unnamed-chunk-17" class="plot" /></div>




---

## K-means clustering -  update centroids

<div class="rimage center"><img src="fig/unnamed-chunk-18.png" title="plot of chunk unnamed-chunk-18" alt="plot of chunk unnamed-chunk-18" class="plot" /></div>



---

## `kmeans()`

* Important parameters: _x_, _centers_, _iter.max_, _nstart_


```r
dataFrame <- data.frame(x,y)
kmeansObj <- kmeans(dataFrame,centers=3)
names(kmeansObj)
```

```
[1] "cluster"      "centers"      "totss"        "withinss"     "tot.withinss" "betweenss"   
[7] "size"        
```

```r
kmeansObj$cluster
```

```
 [1] 3 3 3 3 1 1 1 1 2 2 2 2
```


---

## `kmeans()`


```r
par(mar=rep(0.2,4))
plot(x,y,col=kmeansObj$cluster,pch=19,cex=2)
points(kmeansObj$centers,col=1:3,pch=3,cex=3,lwd=3)
```

<div class="rimage center"><img src="fig/unnamed-chunk-19.png" title="plot of chunk unnamed-chunk-19" alt="plot of chunk unnamed-chunk-19" class="plot" /></div>


---

## Heatmaps


```r
set.seed(1234)
dataMatrix <- as.matrix(dataFrame)[sample(1:12),]
kmeansObj2 <- kmeans(dataMatrix,centers=3)
par(mfrow=c(1,2), mar = c(2, 4, 0.1, 0.1))
image(t(dataMatrix)[,nrow(dataMatrix):1],yaxt="n")
image(t(dataMatrix)[,order(kmeansObj$cluster)],yaxt="n")
```

<div class="rimage center"><img src="fig/unnamed-chunk-20.png" title="plot of chunk unnamed-chunk-20" alt="plot of chunk unnamed-chunk-20" class="plot" /></div>



---

## H-clustering aglomeration choices

Single 

$$d_{SL}(G,H) = \min_{i\in G, i' \in H} d_{ii'}$$

Complete

$$d_{SL}(G,H) = \max_{i\in G, i' \in H} d_{ii'}$$

Average

$$d_{GA}(G,H) = \frac{1}{N_G N_H} \sum_{i \in G} \sum_{i' \in H} d_{ii'}$$

---

## What this looks like on real data

<img class=center src=../../assets/img/hclusttypes.png height=450>

https://statistics.stanford.edu/~tibs/ElemStatLearn

---

## Consistency

Assuming that the data vector $X_p \sim p_k(x)$ for some $k=1,\ldots,K$
then as $N \rightarrow \infty$

$$d_{SL}(G,H) \rightarrow 0$$ 
$$d_{CL}(G,H) \rightarrow \infty$$
$$d_{GA}(G,H) \rightarrow \int \int d(x,x')p_{G}(x)p_{H}(x')dxdx'$$

---

## Another way to view clustering

<img class=center src=../../assets/img/clustertree.png height=300>

* Can use plug-in estimate of the tree
* Piecewise constant in low dimensions
* Trouble with curse of dimensionality in large dimensions

http://www.stat.cmu.edu/~rnugent/teaching/CMU729/Lectures/NPClust.pdf

---

## K-means 

Given initial clusters $m^{(1)}_1,\ldots,m^{(1)}_k$ we iterate between:

__Assign each point to a cluster__

$$S_i^{(t)} = \left\{x_p: ||x_p - m_i^{(t)}||^2 \leq ||x_p - m_j^{(t)}||^2, \forall j\right\}$$

__Update means__

$$m_{i}^{(t+1)}=\frac{1}{|S_i^{(t)}|} \sum_{x_j \in S_i^{(t)}} x_j$$

Stop when the $m_i$ have converged to local modes. 

Similar to an [EM algorithm](http://en.wikipedia.org/wiki/Expectation%E2%80%93maximization_algorithm).

---

## K-means is matrix factorization

<img class=center src=../../assets/img/kmeansmat1.png height=450>

https://dl.dropboxusercontent.com/u/7710864/jhsph753/lectures/vadim.pdf

---

# K-means is matrix factorization

<img class=center src=../../assets/img/kmeansmat2.png height=250>

Let $X_{m \times n}$ be the data matrix $B_{n \times k}$ be the matrix of weights and $A_{k \times n}$ be the assignment matrix. Then

$$XBA = MA$$ 

realizes the assignment

$x_i \rightarrow m_j$, where $m_j = X b_j$.

https://dl.dropboxusercontent.com/u/7710864/jhsph753/lectures/vadim.pdf

---

## K-means final details

* K-means is trying to solve the constrained optimization problem
  * $E = \min_{B,A} ||X-XBA||^2$
  * where $B$ is stochastic and $A$ is binary
* You can write this down in a model based way
  * Gaussian assumption $\rightarrow$ EM algorithm solution
* Finding an optimal k-means partitioning of the data is [NP hard](http://en.wikipedia.org/wiki/NP-hard) in general. 
* You will get different answers with different starting points!
* Usually start with multiple starting points and average ([bagging](http://en.wikipedia.org/wiki/Bootstrap_aggregating), more on this later)


https://dl.dropboxusercontent.com/u/7710864/jhsph753/lectures/vadim.pdf

---

## Model based clustering

Assume the data are drawn from a distribution:

$$f(x | \pi,\mu,\Sigma) = \sum_{g=1}^G \pi_g \phi(X | \mu_g,\Sigma_g)$$

where $\pi_g$ is the probability a point belongs to group $g$ and $\phi(x|\mu_g,\Sigma_g$) is the multivariate Guassian density. 

* You can do this with other densities but you usually have to "roll your own"
* Gaussian densities are surprisingly flexible in many cases
* Nice summary in [Fraley and Raftery 1998 The Computer Journal](http://ftp.stat.washington.edu/raftery/Research/PDF/fraley1998.pdf)

---

## Estimating parameters

$$\pi_{ik}^{(s)} = \frac{\pi_k^{s-1} \phi(x_i; \mu_k^{s-1},\Sigma_k^{s-1})}{\sum_{k'=1}^K \pi_{k'}^{s-1} \phi(x_i; \mu_k^{s-1}, \Sigma_{k'}^{(s-1)})}$$

$$\pi_k^{(s)} = \frac{1}{n} \sum_{i=1}^n \pi_{ik}^{(s)}$$

$$ \mu_k^{(s)} = \frac{\sum_{i=1}^n \pi_{ik}^{(s)}x_i}{\sum_{i=1}^n \pi_{ik}^{(s)}}$$

$$ \Sigma_{k}^{(s)} = \frac{\sum_{i=1}^n \pi_{ik}^{(s)} (x_i - \mu_k^{(s)})}{\sum_{i=1}^n \pi_{ik}^{(s)}}$$


---

## Selecting the model with Bayes factors

$$B = \frac{p(X | M_1)}{p(x | M_2)}$$

$$p(X | M_k) = \int p(X | \theta_k, M_k) p(\theta_k | M_k) d\theta_k$$

* $\theta_k$ is the vector of parameters for model $M_k$
* $p(\theta_k | M_k)$ is the prior distribution for $M_k$. 

<img class=center src=../../assets/img/bic.png height=250>

---

## Implemented in mclust package


```r
library(mclust); data(faithful); faithfulMclust <- Mclust(faithful)
summary(faithfulMclust,parameters=TRUE)
```

```
----------------------------------------------------
Gaussian finite mixture model fitted by EM algorithm 
----------------------------------------------------

Mclust EEE (elliposidal, equal volume, shape and orientation) model with 3 components:

 log.likelihood   n df   BIC   ICL
          -1126 272 11 -2314 -2361

Clustering table:
  1   2   3 
130  97  45 

Mixing probabilities:
     1      2      3 
0.4619 0.3565 0.1816 

Means:
            [,1]   [,2]  [,3]
eruptions  4.476  2.038  3.82
waiting   80.892 54.493 77.67

Variances:
[,,1]
          eruptions waiting
eruptions   0.07728  0.4765
waiting     0.47650 33.7485
[,,2]
          eruptions waiting
eruptions   0.07728  0.4765
waiting     0.47650 33.7485
[,,3]
          eruptions waiting
eruptions   0.07728  0.4765
waiting     0.47650 33.7485
```



http://www.stat.washington.edu/mclust/


---

## Pathological example


```r
clust1 = data.frame(x=rnorm(100),y=rnorm(100))
a = runif(100,0,2*pi)
clust2 = data.frame(x=8*cos(a) + rnorm(100),y=8*sin(a) + rnorm(100))
plot(clust2,col='blue',pch=19); points(clust1,col='green',pch=19)
```

<div class="rimage center"><img src="fig/pathdata.png" title="plot of chunk pathdata" alt="plot of chunk pathdata" class="plot" /></div>


---

## Pathological example


```r
dat = rbind(clust1,clust2)
kk = kmeans(dat,centers=2)
plot(dat,col=(kk$clust+2),pch=19)
```

<div class="rimage center"><img src="fig/unnamed-chunk-22.png" title="plot of chunk unnamed-chunk-22" alt="plot of chunk unnamed-chunk-22" class="plot" /></div>




---

## Clustering wrap up

* Useful for exploring multivariate relationships
* Things that have a bigger than expected impact
  * Scaling
  * Outliers
  * Starting values (k-means)
* Selecting the number of clusters is an "openish" problem.
* Usually there is a local maxima/minima in the tuning parameter
* Better to visualize!
* As always when the model is (approximately) true you get nice properties from model based approaches
* Clusters must be interpreted and are often very hard to interpret. 

---

## Further resources

* Sources of lecture notes
  * http://stat.ethz.ch/education/semesters/SS_2006/CompStat/sk-ch2.pdf
  * http://www.cbcb.umd.edu/~hcorrada/PracticalML/
  *  [Rafa's Distances and Clustering Video](http://www.youtube.com/watch?v=wQhVWUcXM0A)
  * [Elements of statistical learning](http://www-stat.stanford.edu/~tibs/ElemStatLearn/)
  * [Vadim's lecture notes](https://dl.dropboxusercontent.com/u/7710864/jhsph753/lectures/vadim.pdf) 
  * http://www.public.iastate.edu/~maitra/stat501/lectures/ModelBasedClustering.pdf
  * http://www.ics.uci.edu/~smyth/courses/cs274/readings/fraley_raftery.pdf
