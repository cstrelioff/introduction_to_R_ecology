# Feb 2nd, 2012  -- Christopher C Strelioff
#
# Use deSolve to integrate and plot the 
# density-dependent growth ordinary 
# differential equation
#
# dN/dt = r N (1- N/K)
#

# clear workspace
rm(list=ls())

library(deSolve) # deSolve loaded

# define ODE
desDepGrowthODE <- function(t, N, pars) {
  # dN/dt = r * N * ( 1 - N/K )  
  dNdt <- pars['r'] * N * ( 1 - N/pars['K'])
  # return as list
	return(list(dNdt))
}
# setup Init condition, times, parameters
IC <- c(N=10)
times <- seq(0, 20, by=0.1)
pars <- c(r=0.75, K=500)

# call lsoda to get output
output <- lsoda(IC, times, desDepGrowthODE, pars)

# plot
plot(output[,1],output[,2],type='l',xlab='t',ylab='N(t)')
abline(h=pars['K'],lty=2)  # dashed line at y==K