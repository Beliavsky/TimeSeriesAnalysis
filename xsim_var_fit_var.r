# Simulates a VAR(1) process, fits VAR models for different lag lengths, 
# computes AIC, BIC, and HQ, and identifies the best lag for each
# criterion.

library("MTS")

nacf = 2
lag.ar.max = 8

# Set VAR
nobs = 30
p1 = matrix(c(0.2, -0.6, 0.3, 1.1), 2, 2)
sig = matrix(c(4, 0.8, 0.8, 1), 2, 2)
# Simulate VAR process
set.seed(6000)
cat("\n.Random.seed =", .Random.seed, "\n")
m1 = VARMAsim(nobs, arlags = c(1), phi = p1, sigma = sig)
zt = m1$series

# Print the coefficients of the simulated process
cat("\nSimulated process coefficients:\n")
cat("AR Coefficients (phi):\n")
print(p1)
cat("Covariance Matrix (sigma):\n")
print(sig)

cat("\ndim(zt):", dim(zt), "\n")
print(acf(zt, lag.max = nacf))

# Initialize a data frame to store results
results = data.frame(
  Lag = integer(),
  AIC = numeric(),
  BIC = numeric(),
  HQ = numeric()
)

# Loop over lag.ar values and collect AIC, BIC, and HQ
for (lag.ar in 1:lag.ar.max) {
  cat("\nlag.ar =", lag.ar, "\n")
  m1 = VAR(zt, p = lag.ar)
  results = rbind(
    results,
    data.frame(Lag = lag.ar, AIC = m1$aic, BIC = m1$bic, HQ = m1$hq)
  )
}

cat("\nResults:\n")
print(results, row.names=FALSE)

# Identify the best lag according to each criterion
best_aic = results$Lag[which.min(results$AIC)]
best_bic = results$Lag[which.min(results$BIC)]
best_hq = results$Lag[which.min(results$HQ)]

cat("\nBest lag according to AIC:", best_aic, "\n")
cat("Best lag according to BIC:", best_bic, "\n")
cat("Best lag according to  HQ:", best_hq, "\n")
