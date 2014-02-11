---
title       : Cleaning data
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

The most impactful methods come from answering specific data questions:

* How do we make better beer?    
  * __Data__: Measures of beer quality
  * __Statistic__:The [t-statistic](http://en.wikipedia.org/wiki/T-statistic)
* What characteristics of field lead to better crops?
  * __Data__: Field characteristics, crop yields
  * __Statistic__: [Analysis of variance (ANOVA)](http://en.wikipedia.org/wiki/Analysis_of_variance)
* How long do people live?
  * __Data__: Survival times of people (censored)
  * __Statistic__: [Kaplan-Meier Estimator](http://en.wikipedia.org/wiki/Kaplan%E2%80%93Meier_estimator)
* What movies will you like? 
  * __Data__: Lots of other peoples movie ratings
  * __Statistic(s)__: [Recommender systems](http://en.wikipedia.org/wiki/Recommender_system) 


---

## Papers of the day

Data Cleaning is some of the most high-impact work statisticians do. 

_Exploration, normalization, and summaries of high density oligonucleotide array probe level data_

[http://biostatistics.oxfordjournals.org/content/4/2/249.long](http://biostatistics.oxfordjournals.org/content/4/2/249.long)


_Capturing Heterogeneity in Gene Expression Studies by Surrogate Variable Analysis_

[http://www.plosgenetics.org/article/info%3Adoi%2F10.1371%2Fjournal.pgen.0030161](http://www.plosgenetics.org/article/info%3Adoi%2F10.1371%2Fjournal.pgen.0030161)



---

## Synthesized feedback

* Don't get distracted from the problem of interest
  * Missing data problem
* Careful with your test statistic (median instead of mean)
* More introduction to the problem
* Make sure your analysis focuses on questions, not on methods
* Overlapping confidence intervals $\neq$ not significant difference
* Figure captions should be _long_ and explicit. They should explain what the figure is. Remember how people read papers. 
* Titles should explain what you are working on. 
* Don't use R code to explain models in the writeup. Math or words. 
* Sensivity analysis can be useful for missing data

---

## Some cool data you could apply for

<img class="center" src="../../assets/img/twittergrants.png" height=450>

https://blog.twitter.com/2014/introducing-twitter-data-grants

---

## The goal is tidy data

<img class=center src="../../assets/img/01_DataScientistToolbox/excel.png" height=300 />


1. Each variable forms a column
2. Each observation forms a row
3. Each table/file stores data about one kind of observation (e.g. people/hospitals).


[http://vita.had.co.nz/papers/tidy-data.pdf](http://vita.had.co.nz/papers/tidy-data.pdf)

[Leek, Taub, and Pineda 2011 PLoS One](http://www.plosone.org/article/info%3Adoi%2F10.1371%2Fjournal.pone.0026895)

---

## data.table

* Inherets from data.frame
  * All functions that accept data.frame work on data.table
* Written in C so it is much faster
* Much, much faster at subsetting, group, and updating
 

---

## Create data tables just like data frames


```r
library(data.table)
DF = data.frame(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
head(DF,3)
```

```
        x y       z
1 -0.9690 a -0.6361
2  0.8895 a  0.4879
3 -1.2139 a -0.1279
```

```r
DT = data.table(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
head(DT,3)
```

```
         x y        z
1: -1.8915 a -0.06235
2: -0.4859 a  1.37020
3:  0.2364 a -0.63040
```


---

## See all the data tables in memory


```r
tables()
```

```
     NAME NROW MB COLS  KEY
[1,] DT      9 1  x,y,z    
Total: 1MB
```


---

## Subsetting rows


```r
DT[2,]
```

```
         x y    z
1: -0.4859 a 1.37
```

```r
DT[DT$y=="a",]
```

```
         x y        z
1: -1.8915 a -0.06235
2: -0.4859 a  1.37020
3:  0.2364 a -0.63040
```


---

## Subsetting rows


```r
DT[c(2,3)]
```

```
         x y       z
1: -0.4859 a  1.3702
2:  0.2364 a -0.6304
```



---

## Subsetting columns!?


```r
DT[,c(2,3)]
```

```
[1] 2 3
```


---

## Column subsetting in data.table

* The subsetting function is modified for data.table
* The argument you pass after the comma is called an "expression"
* In R an expression is a collection of statements enclosed in curley brackets 

```r
{
  x = 1
  y = 2
}
k = {print(10); 5}
```

```
[1] 10
```

```r
print(k)
```

```
[1] 5
```


---

## Calculating values for variables with expressions


```r
DT = data.table(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
DT[,list(mean(x),sum(z))]
```

```
        V1    V2
1: -0.5263 -1.42
```

```r
DT[,table(y)]
```

```
y
a b c 
3 3 3 
```


---

## Adding new columns


```r
DT[,w:=z^2]
```

```
          x y        z        w
1: -1.23685 a  0.06448 0.004157
2:  0.94369 a  0.95965 0.920931
3: -0.79338 a -1.35306 1.830771
4:  0.06876 b  0.21998 0.048390
5: -2.52831 b  0.77248 0.596728
6: -0.25771 b -2.13156 4.543566
7:  0.44889 c -0.44320 0.196423
8: -0.68266 c  1.08423 1.175562
9: -0.69946 c -0.59315 0.351831
```



---

## Adding new columns


```r
DT2 <- DT
DT[, y:= 2]
```

```
          x y        z        w
1: -1.23685 2  0.06448 0.004157
2:  0.94369 2  0.95965 0.920931
3: -0.79338 2 -1.35306 1.830771
4:  0.06876 2  0.21998 0.048390
5: -2.52831 2  0.77248 0.596728
6: -0.25771 2 -2.13156 4.543566
7:  0.44889 2 -0.44320 0.196423
8: -0.68266 2  1.08423 1.175562
9: -0.69946 2 -0.59315 0.351831
```


---

## Careful


```r
head(DT,n=3)
```

```
         x y        z        w
1: -1.2369 a  0.06448 0.004157
2:  0.9437 a  0.95965 0.920931
3: -0.7934 a -1.35306 1.830771
```

```r
head(DT2,n=3)
```

```
         x y        z        w
1: -1.2369 2  0.06448 0.004157
2:  0.9437 2  0.95965 0.920931
3: -0.7934 2 -1.35306 1.830771
```



---

## Multiple operations


```r
DT[,m:= {tmp <- (x+z); log2(tmp+5)}]
```

```
          x y        z        w     m
1: -1.23685 a  0.06448 0.004157 1.936
2:  0.94369 a  0.95965 0.920931 2.787
3: -0.79338 a -1.35306 1.830771 1.513
4:  0.06876 b  0.21998 0.048390 2.403
5: -2.52831 b  0.77248 0.596728 1.698
6: -0.25771 b -2.13156 4.543566 1.384
7:  0.44889 c -0.44320 0.196423 2.324
8: -0.68266 c  1.08423 1.175562 2.433
9: -0.69946 c -0.59315 0.351831 1.890
```


---

## plyr like operations


```r
DT[,a:=x>0]
```

```
          x y        z        w     m     a
1: -1.23685 a  0.06448 0.004157 1.936 FALSE
2:  0.94369 a  0.95965 0.920931 2.787  TRUE
3: -0.79338 a -1.35306 1.830771 1.513 FALSE
4:  0.06876 b  0.21998 0.048390 2.403  TRUE
5: -2.52831 b  0.77248 0.596728 1.698 FALSE
6: -0.25771 b -2.13156 4.543566 1.384 FALSE
7:  0.44889 c -0.44320 0.196423 2.324  TRUE
8: -0.68266 c  1.08423 1.175562 2.433 FALSE
9: -0.69946 c -0.59315 0.351831 1.890 FALSE
```



---

## plyr like operations


```r
DT[,b:= mean(x+w),by=a]
```

```
          x y        z        w     m     a      b
1: -1.23685 a  0.06448 0.004157 1.936 FALSE 0.3840
2:  0.94369 a  0.95965 0.920931 2.787  TRUE 0.8757
3: -0.79338 a -1.35306 1.830771 1.513 FALSE 0.3840
4:  0.06876 b  0.21998 0.048390 2.403  TRUE 0.8757
5: -2.52831 b  0.77248 0.596728 1.698 FALSE 0.3840
6: -0.25771 b -2.13156 4.543566 1.384 FALSE 0.3840
7:  0.44889 c -0.44320 0.196423 2.324  TRUE 0.8757
8: -0.68266 c  1.08423 1.175562 2.433 FALSE 0.3840
9: -0.69946 c -0.59315 0.351831 1.890 FALSE 0.3840
```



---

## Special variables

`.N` An integer, length 1, containing the numbe r


```r
set.seed(123);
DT <- data.table(x=sample(letters[1:3], 1E5, TRUE))
DT[, .N, by=x]
```

```
   x     N
1: a 33387
2: c 33201
3: b 33412
```


---

## Keys


```r
DT <- data.table(x=rep(c("a","b","c"),each=100), y=rnorm(300))
setkey(DT, x)
DT['a']
```

```
     x        y
  1: a  0.25959
  2: a  0.91751
  3: a -0.72232
  4: a -0.80828
  5: a -0.14135
  6: a  2.25701
  7: a -2.37955
  8: a -0.45425
  9: a -0.06007
 10: a  0.86090
 11: a -1.78466
 12: a -0.13074
 13: a -0.36984
 14: a -0.18066
 15: a -1.04973
 16: a  0.37832
 17: a -1.37079
 18: a -0.31612
 19: a  0.39435
 20: a -1.68988
 21: a -1.46234
 22: a  2.55838
 23: a  0.08789
 24: a  1.73141
 25: a  1.21513
 26: a  0.29954
 27: a -0.17246
 28: a  1.13250
 29: a  0.02320
 30: a  1.33587
 31: a -1.09879
 32: a -0.58176
 33: a  0.03892
 34: a  1.07315
 35: a  1.34970
 36: a  1.19528
 37: a -0.02218
 38: a  0.69849
 39: a  0.67241
 40: a -0.79165
 41: a -0.21791
 42: a  0.02307
 43: a  0.11539
 44: a -0.27708
 45: a  0.03688
 46: a  0.47520
 47: a  1.70749
 48: a  1.07601
 49: a -1.34571
 50: a -1.44025
 51: a -0.39393
 52: a  0.58106
 53: a -0.17079
 54: a -0.90585
 55: a  0.15621
 56: a -0.37323
 57: a -0.34587
 58: a -0.35829
 59: a -0.13307
 60: a -0.08960
 61: a  0.62793
 62: a -1.42883
 63: a  0.17255
 64: a -0.79115
 65: a  1.26204
 66: a -0.26941
 67: a  0.15698
 68: a -0.76060
 69: a  1.37060
 70: a  0.03758
 71: a  0.44949
 72: a  2.78869
 73: a -0.46849
 74: a  1.01261
 75: a -0.04374
 76: a  1.40670
 77: a  0.41993
 78: a  0.31009
 79: a  1.11905
 80: a -1.29814
 81: a -1.28248
 82: a  1.65943
 83: a  0.78375
 84: a  0.57771
 85: a -0.26725
 86: a -0.64569
 87: a -0.44953
 88: a -0.82620
 89: a  1.05504
 90: a -0.87927
 91: a -1.27713
 92: a -0.63412
 93: a  0.66470
 94: a -0.50958
 95: a  0.40736
 96: a  1.67775
 97: a -1.05206
 98: a -0.63691
 99: a  0.56539
100: a  0.38016
     x        y
```


---

## Joins


```r
DT1 <- data.table(x=c('a', 'a', 'b', 'dt1'), y=1:4)
DT2 <- data.table(x=c('a', 'b', 'dt2'), z=5:7)
setkey(DT1, x); setkey(DT2, x)
merge(DT1, DT2)
```

```
   x y z
1: a 1 5
2: a 2 5
3: b 3 6
```




---

## Fast reading


```r
big_df <- data.frame(x=rnorm(1E6), y=rnorm(1E6))
file <- tempfile()
write.table(big_df, file=file, row.names=FALSE, col.names=TRUE, sep="\t", quote=FALSE)
system.time(fread(file))
```

```
   user  system elapsed 
  0.372   0.014   0.386 
```

```r
system.time(read.table(file, header=TRUE, sep="\t"))
```

```
   user  system elapsed 
 11.935   0.134  12.092 
```





---

## Summary and further reading

* The latest development version contains new functions like `melt` and `dcast` for data.tables 
  * [https://r-forge.r-project.org/scm/viewvc.php/pkg/NEWS?view=markup&root=datatable](https://r-forge.r-project.org/scm/viewvc.php/pkg/NEWS?view=markup&root=datatable)
* Here is a list of differences between data.table and data.frame
  * [http://stackoverflow.com/questions/13618488/what-you-can-do-with-data-frame-that-you-cant-in-data-table](http://stackoverflow.com/questions/13618488/what-you-can-do-with-data-frame-that-you-cant-in-data-table)
* Notes based on Raphael Gottardo's notes [https://github.com/raphg/Biostat-578/blob/master/Advanced_data_manipulation.Rpres](https://github.com/raphg/Biostat-578/blob/master/Advanced_data_manipulation.Rpres), who got them from Kevin Ushey.


---

## Generate some data 


```r
set.seed(13435)
X <- data.frame("var1"=sample(1:5),"var2"=sample(6:10),"var3"=sample(11:15))
X <- X[sample(1:5),]; X$var2[c(1,3)] = NA
X
```

```
  var1 var2 var3
1    2   NA   15
4    1   10   11
2    3   NA   12
3    5    6   14
5    4    9   13
```


---

## Sorting


```r
sort(X$var1)
```

```
[1] 1 2 3 4 5
```

```r
sort(X$var1,decreasing=TRUE)
```

```
[1] 5 4 3 2 1
```

```r
sort(X$var2,na.last=TRUE)
```

```
[1]  6  9 10 NA NA
```



---

## Ordering


```r
X[order(X$var1),]
```

```
  var1 var2 var3
4    1   10   11
1    2   NA   15
2    3   NA   12
5    4    9   13
3    5    6   14
```


---

## Ordering


```r
X[order(X$var1,X$var3),]
```

```
  var1 var2 var3
4    1   10   11
1    2   NA   15
2    3   NA   12
5    4    9   13
3    5    6   14
```


---

## Ordering with plyr


```r
library(plyr)
arrange(X,var1)
```

```
  var1 var2 var3
1    1   10   11
2    2   NA   15
3    3   NA   12
4    4    9   13
5    5    6   14
```

```r
arrange(X,desc(var1))
```

```
  var1 var2 var3
1    5    6   14
2    4    9   13
3    3   NA   12
4    2   NA   15
5    1   10   11
```



---

## Adding rows and columns


```r
X$var4 <- rnorm(5)
X
```

```
  var1 var2 var3     var4
1    2   NA   15  0.18760
4    1   10   11  1.78698
2    3   NA   12  0.49669
3    5    6   14  0.06318
5    4    9   13 -0.53613
```



---

## Adding rows and columns


```r
Y <- cbind(X,rnorm(5))
Y
```

```
  var1 var2 var3     var4 rnorm(5)
1    2   NA   15  0.18760  0.62578
4    1   10   11  1.78698 -2.45084
2    3   NA   12  0.49669  0.08909
3    5    6   14  0.06318  0.47839
5    4    9   13 -0.53613  1.00053
```


---

## Example data set 

<img class=center src="../../assets/img/03_ObtainingData/restaurants.png" height=500 />


[https://data.baltimorecity.gov/Community/Restaurants/k5ry-ef3g](https://data.baltimorecity.gov/Community/Restaurants/k5ry-ef3g)

---

## Getting the data from the web


```r
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/restaurants.csv",method="curl")
restData <- read.csv("./data/restaurants.csv")
```



---

## Look at a bit of the data


```r
head(restData,n=3)
```

```
   name zipCode neighborhood councilDistrict policeDistrict                        Location.1
1   410   21206    Frankford               2   NORTHEASTERN 4509 BELAIR ROAD\nBaltimore, MD\n
2  1919   21231  Fells Point               1   SOUTHEASTERN    1919 FLEET ST\nBaltimore, MD\n
3 SAUTE   21224       Canton               1   SOUTHEASTERN   2844 HUDSON ST\nBaltimore, MD\n
```

```r
tail(restData,n=3)
```

```
                 name zipCode  neighborhood councilDistrict policeDistrict
1325 ZINK'S CAF\u0090   21213 Belair-Edison              13   NORTHEASTERN
1326     ZISSIMOS BAR   21211       Hampden               7       NORTHERN
1327           ZORBAS   21224     Greektown               2   SOUTHEASTERN
                             Location.1
1325 3300 LAWNVIEW AVE\nBaltimore, MD\n
1326      1023 36TH ST\nBaltimore, MD\n
1327  4710 EASTERN Ave\nBaltimore, MD\n
```



---

## Make summary


```r
summary(restData)
```

```
                           name         zipCode             neighborhood councilDistrict
 MCDONALD'S                  :   8   Min.   :-21226   Downtown    :128   Min.   : 1.00  
 POPEYES FAMOUS FRIED CHICKEN:   7   1st Qu.: 21202   Fells Point : 91   1st Qu.: 2.00  
 SUBWAY                      :   6   Median : 21218   Inner Harbor: 89   Median : 9.00  
 KENTUCKY FRIED CHICKEN      :   5   Mean   : 21185   Canton      : 81   Mean   : 7.19  
 BURGER KING                 :   4   3rd Qu.: 21226   Federal Hill: 42   3rd Qu.:11.00  
 DUNKIN DONUTS               :   4   Max.   : 21287   Mount Vernon: 33   Max.   :14.00  
 (Other)                     :1293                    (Other)     :863                  
      policeDistrict                        Location.1      
 SOUTHEASTERN:385    1101 RUSSELL ST\nBaltimore, MD\n:   9  
 CENTRAL     :288    201 PRATT ST\nBaltimore, MD\n   :   8  
 SOUTHERN    :213    2400 BOSTON ST\nBaltimore, MD\n :   8  
 NORTHERN    :157    300 LIGHT ST\nBaltimore, MD\n   :   5  
 NORTHEASTERN: 72    300 CHARLES ST\nBaltimore, MD\n :   4  
 EASTERN     : 67    301 LIGHT ST\nBaltimore, MD\n   :   4  
 (Other)     :145    (Other)                         :1289  
```


---

## Mpre in depth information


```r
str(restData)
```

```
'data.frame':	1327 obs. of  6 variables:
 $ name           : Factor w/ 1277 levels "#1 CHINESE KITCHEN",..: 9 3 992 1 2 4 5 6 7 8 ...
 $ zipCode        : int  21206 21231 21224 21211 21223 21218 21205 21211 21205 21231 ...
 $ neighborhood   : Factor w/ 173 levels "Abell","Arlington",..: 53 52 18 66 104 33 98 133 98 157 ...
 $ councilDistrict: int  2 1 1 14 9 14 13 7 13 1 ...
 $ policeDistrict : Factor w/ 9 levels "CENTRAL","EASTERN",..: 3 6 6 4 8 3 6 4 6 6 ...
 $ Location.1     : Factor w/ 1210 levels "1 BIDDLE ST\nBaltimore, MD\n",..: 835 334 554 755 492 537 505 530 507 569 ...
```



---

## Quantiles of quantitative variables


```r
quantile(restData$councilDistrict,na.rm=TRUE)
```

```
  0%  25%  50%  75% 100% 
   1    2    9   11   14 
```

```r
quantile(restData$councilDistrict,probs=c(0.5,0.75,0.9))
```

```
50% 75% 90% 
  9  11  12 
```


---

## Make table


```r
table(restData$zipCode,useNA="ifany")
```

```

-21226  21201  21202  21205  21206  21207  21208  21209  21210  21211  21212  21213  21214  21215 
     1    136    201     27     30      4      1      8     23     41     28     31     17     54 
 21216  21217  21218  21220  21222  21223  21224  21225  21226  21227  21229  21230  21231  21234 
    10     32     69      1      7     56    199     19     18      4     13    156    127      7 
 21237  21239  21251  21287 
     1      3      2      1 
```


---

## Make table


```r
table(restData$councilDistrict,restData$zipCode)
```

```
    
     -21226 21201 21202 21205 21206 21207 21208 21209 21210 21211 21212 21213 21214 21215 21216
  1       0     0    37     0     0     0     0     0     0     0     0     2     0     0     0
  2       0     0     0     3    27     0     0     0     0     0     0     0     0     0     0
  3       0     0     0     0     0     0     0     0     0     0     0     2    17     0     0
  4       0     0     0     0     0     0     0     0     0     0    27     0     0     0     0
  5       0     0     0     0     0     3     0     6     0     0     0     0     0    31     0
  6       0     0     0     0     0     0     0     1    19     0     0     0     0    15     1
  7       0     0     0     0     0     0     0     1     0    27     0     0     0     6     7
  8       0     0     0     0     0     1     0     0     0     0     0     0     0     0     0
  9       0     1     0     0     0     0     0     0     0     0     0     0     0     0     2
  10      1     0     1     0     0     0     0     0     0     0     0     0     0     0     0
  11      0   115   139     0     0     0     1     0     0     0     1     0     0     0     0
  12      0    20    24     4     0     0     0     0     0     0     0    13     0     0     0
  13      0     0     0    20     3     0     0     0     0     0     0    13     0     1     0
  14      0     0     0     0     0     0     0     0     4    14     0     1     0     1     0
    
     21217 21218 21220 21222 21223 21224 21225 21226 21227 21229 21230 21231 21234 21237 21239
  1      0     0     0     7     0   140     1     0     0     0     1   124     0     0     0
  2      0     0     0     0     0    54     0     0     0     0     0     0     0     1     0
  3      0     3     0     0     0     0     0     0     1     0     0     0     7     0     0
  4      0     0     0     0     0     0     0     0     0     0     0     0     0     0     3
  5      0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
  6      0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
  7     15     6     0     0     0     0     0     0     0     0     0     0     0     0     0
  8      0     0     0     0     2     0     0     0     2    13     0     0     0     0     0
  9      8     0     0     0    53     0     0     0     0     0    11     0     0     0     0
  10     0     0     1     0     0     0    18    18     0     0   133     0     0     0     0
  11     9     0     0     0     1     0     0     0     0     0    11     0     0     0     0
  12     0    26     0     0     0     0     0     0     0     0     0     2     0     0     0
  13     0     0     0     0     0     5     0     0     1     0     0     1     0     0     0
  14     0    34     0     0     0     0     0     0     0     0     0     0     0     0     0
    
     21251 21287
  1      0     0
  2      0     0
  3      2     0
  4      0     0
  5      0     0
  6      0     0
  7      0     0
  8      0     0
  9      0     0
  10     0     0
  11     0     0
  12     0     0
  13     0     1
  14     0     0
```


---

## Check for missing values


```r
sum(is.na(restData$councilDistrict))
```

```
[1] 0
```

```r
any(is.na(restData$councilDistrict))
```

```
[1] FALSE
```

```r
all(restData$zipCode > 0)
```

```
[1] FALSE
```



---

## Row and column sums


```r
colSums(is.na(restData))
```

```
           name         zipCode    neighborhood councilDistrict  policeDistrict      Location.1 
              0               0               0               0               0               0 
```

```r
all(colSums(is.na(restData))==0)
```

```
[1] TRUE
```



---

## Values with specific characteristics


```r
table(restData$zipCode %in% c("21212"))
```

```

FALSE  TRUE 
 1299    28 
```

```r
table(restData$zipCode %in% c("21212","21213"))
```

```

FALSE  TRUE 
 1268    59 
```



---

## Values with specific characteristics



```r
restData[restData$zipCode %in% c("21212","21213"),]
```

```
                                     name zipCode                neighborhood councilDistrict
29                      BAY ATLANTIC CLUB   21212                    Downtown              11
39                            BERMUDA BAR   21213               Broadway East              12
92                              ATWATER'S   21212   Chinquapin Park-Belvedere               4
111            BALTIMORE ESTONIAN SOCIETY   21213          South Clifton Park              12
187                              CAFE ZEN   21212                    Rosebank               4
220                   CERIELLO FINE FOODS   21212   Chinquapin Park-Belvedere               4
266    CLIFTON PARK GOLF COURSE SNACK BAR   21213                 Darley Park              14
276                CLUB HOUSE BAR & GRILL   21213 Orangeville Industrial Area              13
289                 CLUBHOUSE BAR & GRILL   21213 Orangeville Industrial Area              13
291                           COCKY LOU'S   21213               Broadway East              12
362       DREAM TAVERN, CARRIBEAN  U.S.A.   21213               Broadway East              13
373                         DUNKIN DONUTS   21212                    Homeland               4
383        EASTSIDE  SPORTS  SOCIAL  CLUB   21213               Broadway East              13
417                      FIELDS OLD TRAIL   21212                  Mid-Govans               4
475                             GRAND CRU   21212   Chinquapin Park-Belvedere               4
545                           RANDY'S BAR   21213               Broadway East              12
604     MURPHY'S NEIGHBORHOOD BAR & GRILL   21212                  Mid-Govans               4
616                                NEOPOL   21212   Chinquapin Park-Belvedere               4
620             NEW CLUB THUNDERBIRD INC.   21213                 Middle East              13
626                    NEW MAYFIELD, INC.   21213               Belair-Edison              13
678                          IKAN SEAFOOD   21212   Chinquapin Park-Belvedere               4
711                          KAY-CEE CLUB   21212                    Homeland               4
763                                LA'RAE   21213                      Oliver              12
777                  LEMONGRASS BALTIMORE   21213                Little Italy               1
779                   LEN'S SANDWICH SHOP   21213               Broadway East              12
845                            MCDONALD'S   21213          South Clifton Park              12
852                            MCDONALD'S   21212              Radnor-Winston               4
873                  NEW REX LIQUORS,INC.   21212                 Wilson Park               4
895                             OK TAVERN   21213               Biddle Street              13
919                          PANERA BREAD   21212                 Lake Walker               4
940                    PEIWEI ASIAN DINER   21212                  Cedarcroft               4
949                   PERGUSA ENTERPRISES   21212                    Rosebank               4
957               PHANTOM'S BAR AND GRILL   21213               Belair-Edison               3
976          POPEYES FAMOUS FRIED CHICKEN   21212              Winston-Govans               4
994                         ROBBIE'S NEST   21213               Broadway East              12
1017                          RUTLAND BAR   21213               Broadway East              12
1018                      RYAN'S DAUGHTER   21212   Chinquapin Park-Belvedere               4
1022         saigon remembered restaurant   21212                  Mid-Govans               4
1053                SHIRLEY'S  HONEY HOLE   21213               Broadway East              13
1120                     STEEPLE CHASE II   21213               Biddle Street              13
1122                               SUBWAY   21213                      Oliver              12
1153                              TAM-TAM   21212                  Mid-Govans               4
1155                                TASTE   21212                  Mid-Govans               4
1159                         TAYLORS EAST   21213                       Berea              13
1186                THE EDGE BAR & LOUNGE   21213               Broadway East              12
1187 THE EDGE BAR & LOUNGE - KITCHEN AREA   21213               Broadway East              12
1198               THE HOLLOW BAR & GRILL   21212                    Rosebank               4
1209             THE NEW BUCKETT'S LOUNGE   21213               Broadway East              13
1232                         THREE  ACE'S   21213               Belair-Edison               3
1246                 TORAIN'S  HIDE-A-WAY   21213               Broadway East              12
1259                    TSUNAMI BALTIMORE   21213                Little Italy               1
1287                         VITO'S PIZZA   21212                  Cedarcroft               4
1298 WENDY'S OLD FASHIONED HAMBURGERS #96   21212                    Homeland               4
1304                 WHITTEN'S  (4502-04)   21213           Claremont-Freedom              13
1312                          wozi lounge   21212                    Guilford               4
1319           YETI RESTAURANT & CARRYOUT   21212                    Rosebank               4
1320                     YORK CLUB TAVERN   21212                    Homeland               4
1323            ZEN WEST ROADSIDE CANTINA   21212                    Rosebank               4
1325                     ZINK'S CAF\u0090   21213               Belair-Edison              13
     policeDistrict                           Location.1
29          CENTRAL      206 REDWOOD ST\nBaltimore, MD\n
39          EASTERN      1801 NORTH AVE\nBaltimore, MD\n
92         NORTHERN   529 BELVEDERE AVE\nBaltimore, MD\n
111         EASTERN      1932 BELAIR RD\nBaltimore, MD\n
187        NORTHERN   438 BELVEDERE AVE\nBaltimore, MD\n
220        NORTHERN   529 BELVEDERE AVE\nBaltimore, MD\n
266    NORTHEASTERN       2701 ST LO DR\nBaltimore, MD\n
276         EASTERN     4217 ERDMAN AVE\nBaltimore, MD\n
289         EASTERN     4217 ERDMAN AVE\nBaltimore, MD\n
291         EASTERN      2101 NORTH AVE\nBaltimore, MD\n
362         EASTERN  2300 LAFAYETTE AVE\nBaltimore, MD\n
373        NORTHERN        5422 YORK RD\nBaltimore, MD\n
383         EASTERN 1203 COLLINGTON AVE\nBaltimore, MD\n
417        NORTHERN        5723 YORK RD\nBaltimore, MD\n
475        NORTHERN   527 BELVEDERE AVE\nBaltimore, MD\n
545         EASTERN      2135 NORTH AVE\nBaltimore, MD\n
604        NORTHERN        5847 YORK RD\nBaltimore, MD\n
616        NORTHERN   529 BELVEDERE AVE\nBaltimore, MD\n
620         EASTERN       2201 CHASE ST\nBaltimore, MD\n
626    NORTHEASTERN      3349 BELAIR RD\nBaltimore, MD\n
678        NORTHERN   529 BELVEDERE AVE\nBaltimore, MD\n
711        NORTHERN    201 HOMELAND AVE\nBaltimore, MD\n
763         EASTERN     1000 HOFFMAN ST\nBaltimore, MD\n
777    SOUTHEASTERN    1300 BANK STREET\nBaltimore, MD\n
779         EASTERN  1500 WASHINGTON ST\nBaltimore, MD\n
845         EASTERN       2001 BROADWAY\nBaltimore, MD\n
852        NORTHERN        5100 YORK RD\nBaltimore, MD\n
873        NORTHERN        4637 YORK RD\nBaltimore, MD\n
895         EASTERN      2301 BIDDLE ST\nBaltimore, MD\n
919        NORTHERN    6307 1 2 YORK RD\nBaltimore, MD\n
940        NORTHERN        6302 YORK RD\nBaltimore, MD\n
949        NORTHERN        5928 YORK RD\nBaltimore, MD\n
957    NORTHEASTERN      3539 BELAIR RD\nBaltimore, MD\n
976        NORTHERN        5002 YORK RD\nBaltimore, MD\n
994         EASTERN      2250 NORTH AVE\nBaltimore, MD\n
1017        EASTERN    1508 RUTLAND AVE\nBaltimore, MD\n
1018       NORTHERN   600 BELVEDERE AVE\nBaltimore, MD\n
1022       NORTHERN        5857 york rd\nBaltimore, MD\n
1053        EASTERN      2300 OLIVER ST\nBaltimore, MD\n
1120        EASTERN       2401 CHASE ST\nBaltimore, MD\n
1122        EASTERN      1400 NORTH AVE\nBaltimore, MD\n
1153       NORTHERN        5722 YORK RD\nBaltimore, MD\n
1155       NORTHERN   510 BELVEDERE AVE\nBaltimore, MD\n
1159        EASTERN     1201 POTOMAC ST\nBaltimore, MD\n
1186        EASTERN     2015 FEDERAL ST\nBaltimore, MD\n
1187        EASTERN     2015 FEDERAL ST\nBaltimore, MD\n
1198       NORTHERN        5921 YORK RD\nBaltimore, MD\n
1209        EASTERN     1432 CHESTER ST\nBaltimore, MD\n
1232   NORTHEASTERN      3534 belair RD\nBaltimore, MD\n
1246        EASTERN   1701 ELLSWORTH ST\nBaltimore, MD\n
1259   SOUTHEASTERN        1300 BANK ST\nBaltimore, MD\n
1287       NORTHERN        6304 YORK RD\nBaltimore, MD\n
1298       NORTHERN        5615 YORK RD\nBaltimore, MD\n
1304   NORTHEASTERN     4502 ERDMAN AVE\nBaltimore, MD\n
1312       NORTHERN        4515 YORK RD\nBaltimore, MD\n
1319       NORTHERN        5926 YORK RD\nBaltimore, MD\n
1320       NORTHERN        5407 YORK RD\nBaltimore, MD\n
1323       NORTHERN        5916 YORK RD\nBaltimore, MD\n
1325   NORTHEASTERN   3300 LAWNVIEW AVE\nBaltimore, MD\n
```



---

## Cross tabs


```r
data(UCBAdmissions)
DF = as.data.frame(UCBAdmissions)
summary(DF)
```

```
      Admit       Gender   Dept       Freq    
 Admitted:12   Male  :12   A:4   Min.   :  8  
 Rejected:12   Female:12   B:4   1st Qu.: 80  
                           C:4   Median :170  
                           D:4   Mean   :189  
                           E:4   3rd Qu.:302  
                           F:4   Max.   :512  
```



---

## Cross tabs


```r
xt <- xtabs(Freq ~ Gender + Admit,data=DF)
xt
```

```
        Admit
Gender   Admitted Rejected
  Male       1198     1493
  Female      557     1278
```



---

## Flat tables


```r
warpbreaks$replicate <- rep(1:9, len = 54)
xt = xtabs(breaks ~.,data=warpbreaks)
xt
```

```
, , replicate = 1

    tension
wool  L  M  H
   A 26 18 36
   B 27 42 20

, , replicate = 2

    tension
wool  L  M  H
   A 30 21 21
   B 14 26 21

, , replicate = 3

    tension
wool  L  M  H
   A 54 29 24
   B 29 19 24

, , replicate = 4

    tension
wool  L  M  H
   A 25 17 18
   B 19 16 17

, , replicate = 5

    tension
wool  L  M  H
   A 70 12 10
   B 29 39 13

, , replicate = 6

    tension
wool  L  M  H
   A 52 18 43
   B 31 28 15

, , replicate = 7

    tension
wool  L  M  H
   A 51 35 28
   B 41 21 15

, , replicate = 8

    tension
wool  L  M  H
   A 26 30 15
   B 20 39 16

, , replicate = 9

    tension
wool  L  M  H
   A 67 36 26
   B 44 29 28
```



---

## Flat tables


```r
ftable(xt)
```

```
             replicate  1  2  3  4  5  6  7  8  9
wool tension                                     
A    L                 26 30 54 25 70 52 51 26 67
     M                 18 21 29 17 12 18 35 30 36
     H                 36 21 24 18 10 43 28 15 26
B    L                 27 14 29 19 29 31 41 20 44
     M                 42 26 19 16 39 28 21 39 29
     H                 20 21 24 17 13 15 15 16 28
```



---

## Size of a data set


```r
fakeData = rnorm(1e5)
object.size(fakeData)
```

```
800040 bytes
```

```r
print(object.size(fakeData),units="Mb")
```

```
0.8 Mb
```


---

## Why create new variables?

* Often the raw data won't have a value you are looking for
* You will need to transform the data to get the values you would like
* Usually you will add those values to the data frames you are working with
* Common variables to create
  * Missingness indicators
  * "Cutting up" quantitative variables
  * Applying transforms


---

## Example data set 

<img class=center src="../../assets/img/03_ObtainingData/restaurants.png" height=500 />


[https://data.baltimorecity.gov/Community/Restaurants/k5ry-ef3g](https://data.baltimorecity.gov/Community/Restaurants/k5ry-ef3g)

---

## Getting the data from the web


```r
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/restaurants.csv",method="curl")
restData <- read.csv("./data/restaurants.csv")
```


---

## Creating sequences

_Sometimes you need an index for your data set_


```r
s1 <- seq(1,10,by=2) ; s1
```

```
[1] 1 3 5 7 9
```

```r
s2 <- seq(1,10,length=3); s2
```

```
[1]  1.0  5.5 10.0
```

```r
x <- c(1,3,8,25,100); seq(along = x)
```

```
[1] 1 2 3 4 5
```



---

## Subsetting variables


```r
restData$nearMe = restData$neighborhood %in% c("Roland Park", "Homeland")
table(restData$nearMe)
```

```

FALSE  TRUE 
 1314    13 
```


---

## Creating binary variables


```r
restData$zipWrong = ifelse(restData$zipCode < 0, TRUE, FALSE)
table(restData$zipWrong,restData$zipCode < 0)
```

```
       
        FALSE TRUE
  FALSE  1326    0
  TRUE      0    1
```



---

## Creating categorical variables


```r
restData$zipGroups = cut(restData$zipCode,breaks=quantile(restData$zipCode))
table(restData$zipGroups)
```

```

(-2.123e+04,2.12e+04]  (2.12e+04,2.122e+04] (2.122e+04,2.123e+04] (2.123e+04,2.129e+04] 
                  337                   375                   282                   332 
```

```r
table(restData$zipGroups,restData$zipCode)
```

```
                       
                        -21226 21201 21202 21205 21206 21207 21208 21209 21210 21211 21212 21213
  (-2.123e+04,2.12e+04]      0   136   201     0     0     0     0     0     0     0     0     0
  (2.12e+04,2.122e+04]       0     0     0    27    30     4     1     8    23    41    28    31
  (2.122e+04,2.123e+04]      0     0     0     0     0     0     0     0     0     0     0     0
  (2.123e+04,2.129e+04]      0     0     0     0     0     0     0     0     0     0     0     0
                       
                        21214 21215 21216 21217 21218 21220 21222 21223 21224 21225 21226 21227
  (-2.123e+04,2.12e+04]     0     0     0     0     0     0     0     0     0     0     0     0
  (2.12e+04,2.122e+04]     17    54    10    32    69     0     0     0     0     0     0     0
  (2.122e+04,2.123e+04]     0     0     0     0     0     1     7    56   199    19     0     0
  (2.123e+04,2.129e+04]     0     0     0     0     0     0     0     0     0     0    18     4
                       
                        21229 21230 21231 21234 21237 21239 21251 21287
  (-2.123e+04,2.12e+04]     0     0     0     0     0     0     0     0
  (2.12e+04,2.122e+04]      0     0     0     0     0     0     0     0
  (2.122e+04,2.123e+04]     0     0     0     0     0     0     0     0
  (2.123e+04,2.129e+04]    13   156   127     7     1     3     2     1
```



---

## Easier cutting


```r
library(Hmisc)
restData$zipGroups = cut2(restData$zipCode,g=4)
table(restData$zipGroups)
```

```

[-21226,21205) [ 21205,21220) [ 21220,21227) [ 21227,21287] 
           338            375            300            314 
```


---

## Creating factor variables


```r
restData$zcf <- factor(restData$zipCode)
restData$zcf[1:10]
```

```
 [1] 21206 21231 21224 21211 21223 21218 21205 21211 21205 21231
32 Levels: -21226 21201 21202 21205 21206 21207 21208 21209 21210 21211 21212 21213 21214 ... 21287
```

```r
class(restData$zcf)
```

```
[1] "factor"
```



---

## Levels of factor variables


```r
yesno <- sample(c("yes","no"),size=10,replace=TRUE)
yesnofac = factor(yesno,levels=c("yes","no"))
relevel(yesnofac,ref="yes")
```

```
 [1] no  no  yes yes yes no  yes no  yes no 
Levels: yes no
```

```r
as.numeric(yesnofac)
```

```
 [1] 2 2 1 1 1 2 1 2 1 2
```


---

## Cutting produces factor variables



```r
library(Hmisc)
restData$zipGroups = cut2(restData$zipCode,g=4)
table(restData$zipGroups)
```

```

[-21226,21205) [ 21205,21220) [ 21220,21227) [ 21227,21287] 
           338            375            300            314 
```



---

## Using the mutate function


```r
library(Hmisc); library(plyr)
restData2 = mutate(restData,zipGroups=cut2(zipCode,g=4))
table(restData2$zipGroups)
```

```

[-21226,21205) [ 21205,21220) [ 21220,21227) [ 21227,21287] 
           338            375            300            314 
```



---

## Common transforms

* `abs(x)` absolute value
* `sqrt(x)` square root
* `ceiling(x)` ceiling(3.475) is 4
* `floor(x)` floor(3.475) is 3
* `round(x,digits=n)` roun(3.475,digits=2) is 3.48
* `signif(x,digits=n)` signif(3.475,digits=2) is 3.5
* `cos(x), sin(x)` etc.
* `log(x)` natural logarithm
* `log2(x)`, `log10(x)` other common logs
* `exp(x)` exponentiating x

[http://www.biostat.jhsph.edu/~ajaffe/lec_winterR/Lecture%202.pdf](http://www.biostat.jhsph.edu/~ajaffe/lec_winterR/Lecture%202.pdf)
[http://statmethods.net/management/functions.html](http://statmethods.net/management/functions.html)


---

## Notes and further reading

* A tutorial from the developer of plyr - [http://plyr.had.co.nz/09-user/](http://plyr.had.co.nz/09-user/)
* Andrew Jaffe's R notes [http://www.biostat.jhsph.edu/~ajaffe/lec_winterR/Lecture%202.pdf](http://www.biostat.jhsph.edu/~ajaffe/lec_winterR/Lecture%202.pdf)


---

## Start with reshaping


```r
library(reshape2)
head(mtcars)
```

```
                   mpg cyl disp  hp drat    wt  qsec vs am gear carb
Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1
```



---

## Melting data frames


```r
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars,id=c("carname","gear","cyl"),measure.vars=c("mpg","hp"))
head(carMelt,n=3)
```

```
        carname gear cyl variable value
1     Mazda RX4    4   6      mpg  21.0
2 Mazda RX4 Wag    4   6      mpg  21.0
3    Datsun 710    4   4      mpg  22.8
```

```r
tail(carMelt,n=3)
```

```
         carname gear cyl variable value
62  Ferrari Dino    5   6       hp   175
63 Maserati Bora    5   8       hp   335
64    Volvo 142E    4   4       hp   109
```



[http://www.statmethods.net/management/reshape.html](http://www.statmethods.net/management/reshape.html)

---

## Casting data frames


```r
cylData <- dcast(carMelt, cyl ~ variable)
cylData
```

```
  cyl mpg hp
1   4  11 11
2   6   7  7
3   8  14 14
```

```r
cylData <- dcast(carMelt, cyl ~ variable,mean)
cylData
```

```
  cyl   mpg     hp
1   4 26.66  82.64
2   6 19.74 122.29
3   8 15.10 209.21
```


[http://www.statmethods.net/management/reshape.html](http://www.statmethods.net/management/reshape.html)


---

## Averaging values


```r
head(InsectSprays)
```

```
  count spray
1    10     A
2     7     A
3    20     A
4    14     A
5    14     A
6    12     A
```

```r
tapply(InsectSprays$count,InsectSprays$spray,sum)
```

```
  A   B   C   D   E   F 
174 184  25  59  42 200 
```


[http://www.r-bloggers.com/a-quick-primer-on-split-apply-combine-problems/](http://www.r-bloggers.com/a-quick-primer-on-split-apply-combine-problems/)

---

## Another way - split


```r
spIns =  split(InsectSprays$count,InsectSprays$spray)
spIns
```

```
$A
 [1] 10  7 20 14 14 12 10 23 17 20 14 13

$B
 [1] 11 17 21 11 16 14 17 17 19 21  7 13

$C
 [1] 0 1 7 2 3 1 2 1 3 0 1 4

$D
 [1]  3  5 12  6  4  3  5  5  5  5  2  4

$E
 [1] 3 5 3 5 3 6 1 1 3 2 6 4

$F
 [1] 11  9 15 22 15 16 13 10 26 26 24 13
```


---

## Another way - apply


```r
sprCount = lapply(spIns,sum)
sprCount
```

```
$A
[1] 174

$B
[1] 184

$C
[1] 25

$D
[1] 59

$E
[1] 42

$F
[1] 200
```


---

## Another way - combine


```r
unlist(sprCount)
```

```
  A   B   C   D   E   F 
174 184  25  59  42 200 
```

```r
sapply(spIns,sum)
```

```
  A   B   C   D   E   F 
174 184  25  59  42 200 
```


---

## Another way - plyr package


```r
ddply(InsectSprays,.(spray),summarise,sum=sum(count))
```

```
  spray sum
1     A 174
2     B 184
3     C  25
4     D  59
5     E  42
6     F 200
```



---

## Creating a new variable


```r
spraySums <- ddply(InsectSprays,.(spray),summarise,sum=ave(count,FUN=sum))
dim(spraySums)
```

```
[1] 72  2
```

```r
head(spraySums)
```

```
  spray sum
1     A 174
2     A 174
3     A 174
4     A 174
5     A 174
6     A 174
```


---

## More information

* A tutorial from the developer of plyr - [http://plyr.had.co.nz/09-user/](http://plyr.had.co.nz/09-user/)
* A nice reshape tutorial [http://www.slideshare.net/jeffreybreen/reshaping-data-in-r](http://www.slideshare.net/jeffreybreen/reshaping-data-in-r)
* A good plyr primer - [http://www.r-bloggers.com/a-quick-primer-on-split-apply-combine-problems/](http://www.r-bloggers.com/a-quick-primer-on-split-apply-combine-problems/)
* See also the functions
  * acast - for casting as multi-dimensional arrays
  * arrange - for faster reordering without using order() commands
  * mutate - adding new variables

---

## Peer review data



```r
fileUrl1 <- "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
fileUrl2 <- "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
download.file(fileUrl1,destfile="./data/reviews.csv",method="curl")
download.file(fileUrl2,destfile="./data/solutions.csv",method="curl")
reviews <- read.csv("./data/reviews.csv"); solutions <- read.csv("./data/solutions.csv")
head(reviews,2)
```

```
  id solution_id reviewer_id      start       stop time_left accept
1  1           3          27 1304095698 1304095758      1754      1
2  2           4          22 1304095188 1304095206      2306      1
```

```r
head(solutions,2)
```

```
  id problem_id subject_id      start       stop time_left answer
1  1        156         29 1304095119 1304095169      2343      B
2  2        269         25 1304095119 1304095183      2329      C
```




---

## Merging data - merge()

* Merges data frames
* Important parameters: _x_,_y_,_by_,_by.x_,_by.y_,_all_

```r
names(reviews)
```

```
[1] "id"          "solution_id" "reviewer_id" "start"       "stop"        "time_left"  
[7] "accept"     
```

```r
names(solutions)
```

```
[1] "id"         "problem_id" "subject_id" "start"      "stop"       "time_left"  "answer"    
```


---

## Merging data - merge()


```r
mergedData = merge(reviews,solutions,by.x="solution_id",by.y="id",all=TRUE)
head(mergedData)
```

```
  solution_id id reviewer_id    start.x     stop.x time_left.x accept problem_id subject_id
1           1  4          26 1304095267 1304095423        2089      1        156         29
2           2  6          29 1304095471 1304095513        1999      1        269         25
3           3  1          27 1304095698 1304095758        1754      1         34         22
4           4  2          22 1304095188 1304095206        2306      1         19         23
5           5  3          28 1304095276 1304095320        2192      1        605         26
6           6 16          22 1304095303 1304095471        2041      1        384         27
     start.y     stop.y time_left.y answer
1 1304095119 1304095169        2343      B
2 1304095119 1304095183        2329      C
3 1304095127 1304095146        2366      C
4 1304095127 1304095150        2362      D
5 1304095127 1304095167        2345      A
6 1304095131 1304095270        2242      C
```


---

## Default - merge all common column names


```r
intersect(names(solutions),names(reviews))
```

```
[1] "id"        "start"     "stop"      "time_left"
```

```r
mergedData2 = merge(reviews,solutions,all=TRUE)
head(mergedData2)
```

```
  id      start       stop time_left solution_id reviewer_id accept problem_id subject_id answer
1  1 1304095119 1304095169      2343          NA          NA     NA        156         29      B
2  1 1304095698 1304095758      1754           3          27      1         NA         NA   <NA>
3  2 1304095119 1304095183      2329          NA          NA     NA        269         25      C
4  2 1304095188 1304095206      2306           4          22      1         NA         NA   <NA>
5  3 1304095127 1304095146      2366          NA          NA     NA         34         22      C
6  3 1304095276 1304095320      2192           5          28      1         NA         NA   <NA>
```


---

## Using join in the plyr package 

_Faster, but less full featured - defaults to left join, see help file for more_

```r
df1 = data.frame(id=sample(1:10),x=rnorm(10))
df2 = data.frame(id=sample(1:10),y=rnorm(10))
arrange(join(df1,df2),id)
```

```
   id        x       y
1   1  2.15231  1.9963
2   2 -1.05017 -1.8964
3   3  0.67459 -0.7388
4   4 -0.02148  0.9996
5   5  0.91804  2.6998
6   6 -0.30831  1.7473
7   7  0.46534  1.0070
8   8  1.48010 -1.0179
9   9 -0.29983  0.2366
10 10 -0.33971 -0.3394
```



---

## If you have multiple data frames


```r
df1 = data.frame(id=sample(1:10),x=rnorm(10))
df2 = data.frame(id=sample(1:10),y=rnorm(10))
df3 = data.frame(id=sample(1:10),z=rnorm(10))
dfList = list(df1,df2,df3)
join_all(dfList)
```

```
   id        x       y       z
1   5 -0.75669  0.8900 -0.9236
2   8 -1.42660  1.5570  1.1704
3   9 -0.30153  1.6631  1.0485
4  10 -0.77925  0.3986 -0.1691
5   2 -1.06585  1.2353 -0.5201
6   4  0.07436  0.4063  1.0924
7   3  2.04580  1.5946  0.9850
8   7  0.64047  0.1239 -1.1864
9   1  1.16579  2.8547 -0.6123
10  6  0.92515 -0.3780 -0.5564
```


---

## More on merging data

* The quick R data merging page - [http://www.statmethods.net/management/merging.html](http://www.statmethods.net/management/merging.html)
* plyr information - [http://plyr.had.co.nz/](http://plyr.had.co.nz/)
* Types of joins - [http://en.wikipedia.org/wiki/Join_(SQL)](http://en.wikipedia.org/wiki/Join_(SQL))

---

## Example - Baltimore camera data

<img class=center src=../../assets/img/03_ObtainingData/cameras.png height=500>

[https://data.baltimorecity.gov/Transportation/Baltimore-Fixed-Speed-Cameras/dz54-2aru](https://data.baltimorecity.gov/Transportation/Baltimore-Fixed-Speed-Cameras/dz54-2aru)


---

## Fixing character vectors - tolower(), toupper()


```r
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/cameras.csv",method="curl")
cameraData <- read.csv("./data/cameras.csv")
names(cameraData)
```

```
[1] "address"      "direction"    "street"       "crossStreet"  "intersection" "Location.1"  
```

```r
tolower(names(cameraData))
```

```
[1] "address"      "direction"    "street"       "crossstreet"  "intersection" "location.1"  
```


---

## Fixing character vectors - strsplit()

* Good for automatically splitting variable names
* Important parameters: _x_, _split_


```r
splitNames = strsplit(names(cameraData),"\\.")
splitNames[[5]]
```

```
[1] "intersection"
```

```r
splitNames[[6]]
```

```
[1] "Location" "1"       
```



---

## Quick aside - lists


```r
mylist <- list(letters = c("A", "b", "c"), numbers = 1:3, matrix(1:25, ncol = 5))
head(mylist)
```

```
$letters
[1] "A" "b" "c"

$numbers
[1] 1 2 3

[[3]]
     [,1] [,2] [,3] [,4] [,5]
[1,]    1    6   11   16   21
[2,]    2    7   12   17   22
[3,]    3    8   13   18   23
[4,]    4    9   14   19   24
[5,]    5   10   15   20   25
```


[http://www.biostat.jhsph.edu/~ajaffe/lec_winterR/Lecture%203.pdf](http://www.biostat.jhsph.edu/~ajaffe/lec_winterR/Lecture%203.pdf)


---

## Quick aside - lists


```r
mylist[1]
```

```
$letters
[1] "A" "b" "c"
```

```r
mylist$letters
```

```
[1] "A" "b" "c"
```

```r
mylist[[1]]
```

```
[1] "A" "b" "c"
```


[http://www.biostat.jhsph.edu/~ajaffe/lec_winterR/Lecture%203.pdf](http://www.biostat.jhsph.edu/~ajaffe/lec_winterR/Lecture%203.pdf)


---

## Fixing character vectors - sapply()

* Applies a function to each element in a vector or list
* Important parameters: _X_,_FUN_


```r
splitNames[[6]][1]
```

```
[1] "Location"
```

```r
firstElement <- function(x){x[1]}
sapply(splitNames,firstElement)
```

```
[1] "address"      "direction"    "street"       "crossStreet"  "intersection" "Location"    
```


---

## Peer review experiment data


<img class=center src="../../assets/img/03_ObtainingData/cooperation.png" height=500 />


[http://www.plosone.org/article/info:doi/10.1371/journal.pone.0026895](http://www.plosone.org/article/info:doi/10.1371/journal.pone.0026895)



---

## Fixing character vectors - sub()

* Important parameters: _pattern_, _replacement_, _x_


```r
names(reviews)
```

```
[1] "id"          "solution_id" "reviewer_id" "start"       "stop"        "time_left"  
[7] "accept"     
```

```r
sub("_","",names(reviews),)
```

```
[1] "id"         "solutionid" "reviewerid" "start"      "stop"       "timeleft"   "accept"    
```


---

## Fixing character vectors - gsub()


```r
testName <- "this_is_a_test"
sub("_","",testName)
```

```
[1] "thisis_a_test"
```

```r
gsub("_","",testName)
```

```
[1] "thisisatest"
```


---

## Finding values - grep(),grepl()


```r
grep("Alameda",cameraData$intersection)
```

```
[1]  4  5 36
```

```r
table(grepl("Alameda",cameraData$intersection))
```

```

FALSE  TRUE 
   77     3 
```

```r
cameraData2 <- cameraData[!grepl("Alameda",cameraData$intersection),]
```


---

## More on grep()


```r
grep("Alameda",cameraData$intersection,value=TRUE)
```

```
[1] "The Alameda  & 33rd St"   "E 33rd  & The Alameda"    "Harford \n & The Alameda"
```

```r
grep("JeffStreet",cameraData$intersection)
```

```
integer(0)
```

```r
length(grep("JeffStreet",cameraData$intersection))
```

```
[1] 0
```


[http://www.biostat.jhsph.edu/~ajaffe/lec_winterR/Lecture%203.pdf](http://www.biostat.jhsph.edu/~ajaffe/lec_winterR/Lecture%203.pdf)


---

## More useful string functions


```r
library(stringr)
nchar("Jeffrey Leek")
```

```
[1] 12
```

```r
substr("Jeffrey Leek",1,7)
```

```
[1] "Jeffrey"
```

```r
paste("Jeffrey","Leek")
```

```
[1] "Jeffrey Leek"
```


---

## More useful string functions


```r
paste0("Jeffrey","Leek")
```

```
[1] "JeffreyLeek"
```

```r
str_trim("Jeff      ")
```

```
[1] "Jeff"
```


---

## Important points about text in data sets

* Names of variables should be 
  * All lower case when possible
  * Descriptive (Diagnosis versus Dx)
  * Not duplicated
  * Not have underscores or dots or white spaces
* Variables with character values
  * Should usually be made into factor variables (depends on application)
  * Should be descriptive (use TRUE/FALSE instead of 0/1 and Male/Female versus 0/1 or M/F)


---

## Regular expressions

- Regular expressions can be thought of as a combination of literals and _metacharacters_
- To draw an analogy with natural language, think of literal text forming the words of this language, and the metacharacters defining its grammar
- Regular expressions have a rich set of metacharacters

---

## Literals

Simplest pattern consists only of literals. The literal “nuclear” would match to the following lines:

```markdown
Ooh. I just learned that to keep myself alive after a
nuclear blast! All I have to do is milk some rats
then drink the milk. Aweosme. :}

Laozi says nuclear weapons are mas macho

Chaos in a country that has nuclear weapons -- not good.

my nephew is trying to teach me nuclear physics, or
possibly just trying to show me how smart he is
so I’ll be proud of him [which I am].

lol if you ever say "nuclear" people immediately think
DEATH by radiation LOL
```

---

## Literals

The literal “Obama” would match to the following lines

```markdown
Politics r dum. Not 2 long ago Clinton was sayin Obama
was crap n now she sez vote 4 him n unite? WTF?
Screw em both + Mcain. Go Ron Paul!

Clinton conceeds to Obama but will her followers listen??

Are we sure Chelsea didn’t vote for Obama?

thinking ... Michelle Obama is terrific!

jetlag..no sleep...early mornig to starbux..Ms. Obama
was moving
```

---

## Regular Expressions

- Simplest pattern consists only of literals; a match occurs if the sequence of literals occurs anywhere in the text being tested

- What if we only want the word “Obama”? or sentences that end in the word “Clinton”, or “clinton” or “clinto”?

---

## Regular Expressions

We need a way to express 
- whitespace word boundaries 
- sets of literals
- the beginning and end of a line 
- alternatives (“war” or “peace”)
Metacharacters to the rescue!

---

## Metacharacters

Some metacharacters represent the start of a line

```markdown
^i think
```

will match the lines

```markdown
i think we all rule for participating
i think i have been outed
i think this will be quite fun actually
i think i need to go to work
i think i first saw zombo in 1999.
```

---

## Metacharacters

$ represents the end of a line

```markdown
morning$
```

will match the lines

```markdown
well they had something this morning
then had to catch a tram home in the morning
dog obedience school in the morning
and yes happy birthday i forgot to say it earlier this morning
I walked in the rain this morning
good morning
```

---

## Character Classes with []

We can list a set of characters we will accept at a given point in the match

```markdown
[Bb][Uu][Ss][Hh]
```

will match the lines

```markdown
The democrats are playing, "Name the worst thing about Bush!"
I smelled the desert creosote bush, brownies, BBQ chicken
BBQ and bushwalking at Molonglo Gorge
Bush TOLD you that North Korea is part of the Axis of Evil
I’m listening to Bush - Hurricane (Album Version)
```

---

## Character Classes with []

```markdown
^[Ii] am
```

will match

```markdown
i am so angry at my boyfriend i can’t even bear to
look at him

i am boycotting the apple store

I am twittering from iPhone

I am a very vengeful person when you ruin my sweetheart.

I am so over this. I need food. Mmmm bacon...
```

---

## Character Classes with []

Similarly, you can specify a range of letters [a-z] or [a-zA-Z]; notice that the order doesn’t matter

```markdown
^[0-9][a-zA-Z]
```

will match the lines

```markdown
7th inning stretch
2nd half soon to begin. OSU did just win something
3am - cant sleep - too hot still.. :(
5ft 7 sent from heaven
1st sign of starvagtion
```

---

## Character Classes with []

When used at the beginning of a character class, the “^” is also a metacharacter and indicates matching characters NOT in the indicated class

```markdown
[^?.]$
```

will match the lines

```markdown
i like basketballs
6 and 9
dont worry... we all die anyway!
Not in Baghdad
helicopter under water? hmmm
```

---

## More Metacharacters

“.” is used to refer to any character. So

```markdown
9.11
```

will match the lines

```markdown
its stupid the post 9-11 rules
if any 1 of us did 9/11 we would have been caught in days.
NetBios: scanning ip 203.169.114.66
Front Door 9:11:46 AM
Sings: 0118999881999119725...3 !
```

---

## More Metacharacters: |

This does not mean “pipe” in the context of regular expressions; instead it translates to “or”; we can use it to combine two expressions, the subexpressions being called alternatives

```markdown
flood|fire
```

will match the lines

```markdown
is firewire like usb on none macs?
the global flood makes sense within the context of the bible
yeah ive had the fire on tonight
... and the floods, hurricanes, killer heatwaves, rednecks, gun nuts, etc.
￼
```

---

## More Metacharacters: |

We can include any number of alternatives...

```markdown
flood|earthquake|hurricane|coldfire
```

will match the lines

```markdown
Not a whole lot of hurricanes in the Arctic.
We do have earthquakes nearly every day somewhere in our State
hurricanes swirl in the other direction
coldfire is STRAIGHT!
’cause we keep getting earthquakes
```

---

## More Metacharacters: |

The alternatives can be real expressions and not just literals

```markdown
^[Gg]ood|[Bb]ad
```

will match the lines

```markdown
good to hear some good knews from someone here
Good afternoon fellow american infidels!
good on you-what do you drive?
Katie... guess they had bad experiences...
my middle name is trouble, Miss Bad News
```

---

## More Metacharacters: ( and )

Subexpressions are often contained in parentheses to constrain the alternatives

```markdown
^([Gg]ood|[Bb]ad)
```

will match the lines

```markdown
bad habbit
bad coordination today
good, becuase there is nothing worse than a man in kinky underwear
Badcop, its because people want to use drugs
Good Monday Holiday
Good riddance to Limey
```

---

## More Metacharacters: ?

The question mark indicates that the indicated expression is optional

```markdown
[Gg]eorge( [Ww]\.)? [Bb]ush
```

will match the lines

```markdown
i bet i can spell better than you and george bush combined
BBC reported that President George W. Bush claimed God told him to invade I
a bird in the hand is worth two george bushes
```

---

## One thing to note...

In the following

```markdown
[Gg]eorge( [Ww]\.)? [Bb]ush
```

we wanted to match a “.” as a literal period; to do that, we had to “escape” the metacharacter, preceding it with a backslash In general, we have to do this for any metacharacter we want to include in our match

---

## More metacharacters: * and +

The * and + signs are metacharacters used to indicate repetition; * means “any number, including none, of the item” and + means “at least one of the item”

```markdown
(.*)
```

will match the lines

```markdown
anyone wanna chat? (24, m, germany)
hello, 20.m here... ( east area + drives + webcam )
(he means older men)
()
```

---

## More metacharacters: * and +

The * and + signs are metacharacters used to indicate repetition; * means “any number, including none, of the item” and + means “at least one of the item”

```markdown
[0-9]+ (.*)[0-9]+
```

will match the lines

```markdown
working as MP here 720 MP battallion, 42nd birgade
so say 2 or 3 years at colleage and 4 at uni makes us 23 when and if we fin
it went down on several occasions for like, 3 or 4 *days*
Mmmm its time 4 me 2 go 2 bed
```

---

## More metacharacters: { and }

{ and } are referred to as interval quantifiers; the let us specify the minimum and maximum number of matches of an expression

```markdown
[Bb]ush( +[^ ]+ +){1,5} debate
```

will match the lines

```markdown
Bush has historically won all major debates he’s done.
in my view, Bush doesn’t need these debates..
bush doesn’t need the debates? maybe you are right
That’s what Bush supporters are doing about the debate.
Felix, I don’t disagree that Bush was poorly prepared for the debate.
indeed, but still, Bush should have taken the debate more seriously.
Keep repeating that Bush smirked and scowled during the debate
```

---

## More metacharacters: and

- m,n means at least m but not more than n matches 
- m means exactly m matches
- m, means at least m matches

---

## More metacharacters: ( and ) revisited

- In most implementations of regular expressions, the parentheses not only limit the scope of alternatives divided by a “|”, but also can be used to “remember” text matched by the subexpression enclosed
- We refer to the matched text with \1, \2, etc.

---

## More metacharacters: ( and ) revisited

So the expression

```markdown
+([a-zA-Z]+) +\1 +
```

will match the lines

```markdown
time for bed, night night twitter!
blah blah blah blah
my tattoo is so so itchy today
i was standing all all alone against the world outside...
hi anybody anybody at home
estudiando css css css css.... que desastritooooo
```

---

## More metacharacters: ( and ) revisited

The * is “greedy” so it always matches the _longest_ possible string that satisfies the regular expression. So

```markdown
^s(.*)s
```

matches

```markdown
sitting at starbucks
setting up mysql and rails
studying stuff for the exams
spaghetti with marshmallows
stop fighting with crackers
sore shoulders, stupid ergonomics
```

---

## More metacharacters: ( and ) revisited

The greediness of * can be turned off with the ?, as in

```markdown
^s(.*?)s$
```

---

## Summary

- Regular expressions are used in many different languages; not unique to R.
- Regular expressions are composed of literals and metacharacters that represent sets or classes of characters/words
- Text processing via regular expressions is a very powerful way to extract data from “unfriendly” sources (not all data comes as a CSV file)
- Used with the functions `grep`,`grepl`,`sub`,`gsub` and others that involve searching for text strings
(Thanks to Mark Hansen for some material in this lecture.)

---

## Starting simple


```r
d1 = date()
d1
```

```
[1] "Wed Feb  5 16:52:42 2014"
```

```r
class(d1)
```

```
[1] "character"
```


---

## Date class


```r
d2 = Sys.Date()
d2
```

```
[1] "2014-02-05"
```

```r
class(d2)
```

```
[1] "Date"
```


---

## Formatting dates

`%d` = day as number (0-31), `%a` = abbreviated weekday,`%A` = unabbreviated weekday, `%m` = month (00-12), `%b` = abbreviated month,
`%B` = unabbrevidated month, `%y` = 2 digit year, `%Y` = four digit year


```r
format(d2,"%a %b %d")
```

```
[1] "Wed Feb 05"
```


---

## Creating dates


```r
x = c("1jan1960", "2jan1960", "31mar1960", "30jul1960"); z = as.Date(x, "%d%b%Y")
z
```

```
[1] "1960-01-01" "1960-01-02" "1960-03-31" "1960-07-30"
```

```r
z[1] - z[2]
```

```
Time difference of -1 days
```

```r
as.numeric(z[1]-z[2])
```

```
[1] -1
```


---

## Converting to Julian 


```r
weekdays(d2)
```

```
[1] "Wednesday"
```

```r
months(d2)
```

```
[1] "February"
```

```r
julian(d2)
```

```
[1] 16106
attr(,"origin")
[1] "1970-01-01"
```


---

## Lubridate 


```r
library(lubridate); ymd("20140108")
```

```
[1] "2014-01-08 UTC"
```

```r
mdy("08/04/2013")
```

```
[1] "2013-08-04 UTC"
```

```r
dmy("03-04-2013")
```

```
[1] "2013-04-03 UTC"
```


[http://www.r-statistics.com/2012/03/do-more-with-dates-and-times-in-r-with-lubridate-1-1-0/](http://www.r-statistics.com/2012/03/do-more-with-dates-and-times-in-r-with-lubridate-1-1-0/)

---

## Dealing with times


```r
ymd_hms("2011-08-03 10:15:03")
```

```
[1] "2011-08-03 10:15:03 UTC"
```

```r
ymd_hms("2011-08-03 10:15:03",tz="Pacific/Auckland")
```

```
[1] "2011-08-03 10:15:03 NZST"
```

```r
?Sys.timezone
```


[http://www.r-statistics.com/2012/03/do-more-with-dates-and-times-in-r-with-lubridate-1-1-0/](http://www.r-statistics.com/2012/03/do-more-with-dates-and-times-in-r-with-lubridate-1-1-0/)

---

## Some functions have slightly different syntax


```r
x = dmy(c("1jan2013", "2jan2013", "31mar2013", "30jul2013"))
wday(x[1])
```

```
[1] 3
```

```r
wday(x[1],label=TRUE)
```

```
[1] Tues
Levels: Sun < Mon < Tues < Wed < Thurs < Fri < Sat
```


---

## Notes and further resources

* More information in this nice lubridate tutorial [http://www.r-statistics.com/2012/03/do-more-with-dates-and-times-in-r-with-lubridate-1-1-0/](http://www.r-statistics.com/2012/03/do-more-with-dates-and-times-in-r-with-lubridate-1-1-0/)
* The lubridate vignette is the same content [http://cran.r-project.org/web/packages/lubridate/vignettes/lubridate.html](http://cran.r-project.org/web/packages/lubridate/vignettes/lubridate.html)
* Ultimately you want your dates and times as class "Date" or the classes "POSIXct", "POSIXlt". For more information type `?POSIXlt`
  
