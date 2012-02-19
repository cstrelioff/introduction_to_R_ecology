logisticModel <- function(n0, rd, K, timesteps) {
  # iterate logistic model for desired number of timesteps
  N <- rep(0,timesteps+1) # preallocate vector N (faster)
  N[1] <- n0 # initialize first time point

  # use for loop to iterate
  for (t in 1:timesteps) {
    N[t+1] <- N[t]*(1 + rd*(1 - N[t]/K))
  }

  # return vector
  return(N)
}
