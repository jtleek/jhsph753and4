
## Load data

library(bootstrap)
data(stamp)
stamp = stamp[,1]

## Calculate number of modes
## input is density(x)$y

nmodes <- function(y){
       x <- diff(y)
       n <- length(x)
       sum(x[2:n] < 0  & x[1:(n-1)] >  0)
}


### Get the h-value for some data

hcalc <- function(z){
      h = seq(0.001,0.009,length=100)
      nm <- rep(0,100)
      for(i in 1:100){
      	    y <- density(z,bw=h[i])$y
      	    nm[i] <- nmodes(y)
      }
      return(h[which.max(nm==1)])
}


### Confidence interval function calculation

cifunc = function(x,B){
  bootmode = rep(NA,B)
  for(i in 1:B){
    bootmode[i] = nmodes(density(sample(x,replace=T))$y)
  }
  return(quantile(bootmode,c(0.05,0.95)))
}


## Create simulated data
## and check on coverage

mode2data = matrix(NA,nrow=100,ncol=100)
ci = matrix(NA,nrow=100,ncol=2)
for(i in 1:100){
  mode2data[i,] = rnorm(100,mean=rep(c(0,2),each=50))
  ci[i,] = cifunc(mode2data[i,],B=100)
  if(i %% 10 == 0){cat(i)}
}


### See that confidence intervals
### have issue with discrete observations

mean((ci[,1] <2) & (ci[,2] >2))
mean((ci[,1] <2) & (ci[,2] >=2))
mean((ci[,1] <=2) & (ci[,2] >2))



## Now test the null that nmodes = 1

B <- 100
h0x = h0y = h0z= rep(NA,B)
hhat = density(stamp)$bw

for(i in 1:B){
  ys <- sample(stamp,replace=T)
  xs <- mean(stamp) + (1 + hhat^2/sd(stamp)^2)^(-1/2)*(ys - mean(ys) + hhat*rnorm(length(ys)))
  zs <- rnorm(length(stamp),mean=stamp,sd=hhat)
  h0x[i] = hcalc(xs)
  h0y[i] = hcalc(ys)
  h0z[i] = hcalc(zs)
}


## P-value small ish for rejecting nmodes=1
mean(h0x  < hhat)

## Waaaay small if we just resample
mean(h0y < hhat)

## Somewhat ok if we resample parametrically 
mean(h0z < hhat)




