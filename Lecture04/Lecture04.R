### R code from vignette source 'Lecture04.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: Lecture04.Rnw:179-180 (eval = FALSE)
###################################################
## install.packages('packagename', dep = TRUE)


###################################################
### code chunk number 2: Lecture04.Rnw:205-206 (eval = FALSE)
###################################################
## library()


###################################################
### code chunk number 3: Lecture04.Rnw:212-213 (eval = FALSE)
###################################################
## search()


###################################################
### code chunk number 4: Lecture04.Rnw:216-217 (eval = FALSE)
###################################################
## .libPaths()


###################################################
### code chunk number 5: Lecture04.Rnw:235-236
###################################################
library(deSolve) # load deSolve


###################################################
### code chunk number 6: Lecture04.Rnw:241-242
###################################################
search()


###################################################
### code chunk number 7: Lecture04.Rnw:247-248 (eval = FALSE)
###################################################
## library(packageName)


###################################################
### code chunk number 8: Lecture04.Rnw:253-254 (eval = FALSE)
###################################################
## require(packageName)


###################################################
### code chunk number 9: Lecture04.Rnw:298-299 (eval = FALSE)
###################################################
## lsoda(IC, times, ODEfunction, pars)


###################################################
### code chunk number 10: Lecture04.Rnw:369-376 (eval = FALSE)
###################################################
## desDepGrowthODE <- function(t, N, pars) {
##   # dN/dt = r * N * ( 1 - N/K )	
##   dNdt <- pars['r'] * N * ( 1 - N/pars['K'])
##   
##   # return as list
##   return(list(dNdt))
## }


###################################################
### code chunk number 11: plot1
###################################################
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
pars <- c(r = 0.75, K=500)

# call lsoda to get output
output <- lsoda(IC, times, desDepGrowthODE, pars)

# plot
plot(output[,1],output[,2],type='l',xlab='t',ylab='N(t)')
abline(h=pars['K'],lty=2)  # dashed line at y==K


###################################################
### code chunk number 12: Lecture04.Rnw:438-448
###################################################
# setup Init condition, times, parameters
IC <- c(N=10)
times <- seq(0, 20, by=0.1)
pars <- c(r = 0.75, K=500)

# call lsoda to get output
output <- lsoda(IC, times, desDepGrowthODE, pars)

# get start of output
head(output)


###################################################
### code chunk number 13: Lecture04.Rnw:564-577 (eval = FALSE)
###################################################
## predPreyLVODE <- function(t, N, pars) {
##   # get state variables from N
##   H <- N[1]
##   P <- N[2]
##   
##   # dH/dt = b*H - a*P*H
##   dHdt <- pars['b'] * H - pars['a']*P*H 
##   # dP/dt = e*a*P*H - s*P
##   dPdt <- pars['e']*pars['a']*P*H - pars['s']*P
##   
##   # return as list
##   return(list(c(dHdt,dPdt)))
## }


###################################################
### code chunk number 14: plot2
###################################################
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
IC <- c(H=160,P=40); pars <- c(b=0.5,a=0.01,e=0.2,s=0.2)
times <- seq(0,400,by=0.1)
# run lsoda
output <- lsoda(IC, times, predPreyLVODE, pars)
# plot
plot(output[,1],output[,2],type='l',lty=1, ylim=c(0,max(output[,2])),
     xlab='t',ylab='Population Size')
lines(output[,1],output[,3],lty=2)
# make a legend
legend("bottomleft", c("H(t)","P(t)"), cex=0.8, lty=c(1,2))


