# 2012, Jan 31st -- Christopher Strelioff
#
# Use logisticModel function to plot many trajectories
# for difference n0
#
# Use: rd = constant, K=500, timesteps=100
#      rd < 0 : decrease to zero
#      rd > 0 : fixed point, oscillations, chaos
#

# clear workspace
rm(list=ls())

# set working directory -- set you working directory here!
#setwd('~/Desktop/R_Work/')

# use source to get access to function
source('Lecture03_Ex02.R')

# set static parameter values
rd <- 2.5
K <- 500
timesteps <- 100

# calculate sensible nMax
if (rd > 0) {
  # maximum n value for given rd,K (Prob Set 1)
  nMax <- K*(1+1/rd)  
} else {
  nMax <- K
}

# make a vector of n0 values to consider
n0_vec <- seq(100,nMax-1,length=5)

# make time vector
time <- 1:(timesteps+1) 

# initialize plot
plot(0,type="n",xlab="t", ylab="n(t)",xlim=c(1,timesteps),ylim=c(0,nMax))

# for loop to generate data for each n0
for (n0 in n0_vec) {
  # generate data
  ndata <- logisticModel(n0,rd,K,timesteps)
  # plot both lines and points
  points(time,ndata)
  lines(time,ndata)
}

# add dashed line at y == K
abline(h=K,lty=2)


