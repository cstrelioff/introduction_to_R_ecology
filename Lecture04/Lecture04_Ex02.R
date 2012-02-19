# Feb 2nd, 2012  -- Christopher C Strelioff
#
# Use deSolve to integrate and plot a
# simple Lotka-Volterra predator-prey 
#  model
#
# dH/dt = b H - a P H
# dP/dt = e a P H - s P
#

# clear workspace
rm(list=ls())

library(deSolve) # load deSolve

predPreyLVODE <- function(t, N, pars) {
  # get state variables from N
  H <- N[1]; P <- N[2]
  # dH/dt = b*H - a*P*H
  dHdt <- pars['b'] * H - pars['a']*P*H 
  # dP/dt = e*a*P*H - s*P
  dPdt <- pars['e']*pars['a']*P*H - pars['s']*P
  # return as list
  return(list(c(dHdt,dPdt)))
}

# IC, time, parameters
IC <- c(H=160,P=40) 
pars <- c(b=0.5,a=0.01,e=0.2,s=0.2)
times <- seq(0,400,by=0.1)

# run lsoda
output <- lsoda(IC, times, predPreyLVODE, pars)

# plot
plot(output[,1],output[,2],type='l',lty=1, ylim=c(0,max(output[,2])),
     xlab='t',ylab='Population Size')
lines(output[,1],output[,3],lty=2)

# make a legend
legend("bottomleft", c("H(t)","P(t)"), cex=0.8, lty=c(1,2))

