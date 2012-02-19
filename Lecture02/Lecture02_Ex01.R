# 2012, Jan 24th  ---- Chris Strelioff
#   * Plot the geometric model 
#     n(t+1) = R * n(t)   , for t=0 to t=10   
#   * Parameters:
#     R = 1.2   "Reproductive number"
#   * Initial condition:
#     n(t=0) = 10 

## clear workspace
cat('\n','* Clearing Workspace','\n'); rm(list=ls())

## get working directory for you instance of R
mydir <- getwd()
cat('\n','* Working directory set to: ', mydir, '\n')

# make vector of times
cat('\n','* Generate vetor of times', '\n')
show(time <- 0:10)

# set parameters and IC
R <- 1.2;n0 <- 10
cat('\n', '* Setting parameters and IC', '\n  R=', R, '\n  n[0]=', n0, '\n')

# use vectorized operation to evaluate n(t) at these times
#  - employ solution n(t) = R^(t) * n(0)
cat('\n','* Generate values for n(t)', '\n'); show(nn <- (R^time)*(n0))

# generate plot and save as pdf
cat('\n','* Plotting', '\n')
pdf('GeometricModel.pdf')  # set ouput filename -- this startouput to file
plot(time,nn, xlab="time t", ylab="N(t)", col="red")
dev.off() # this stops output to file
