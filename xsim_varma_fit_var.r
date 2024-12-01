# Simulates a VARMA(1,1) process, fits VAR models for different lag lengths, 
# computes AIC, BIC, and HQ, and identifies the best lag for each
# criterion.

library("MTS")

nacf = 2
lag.ar.max = 5

# Set VARMA parameters
nobs = 1000
ma1.scale = 1.0
p1 = matrix(c(0.2, -0.6, 0.3, 1.1), 2, 2)
sig = matrix(c(4, 0.8, 0.8, 1), 2, 2)
th1 = ma1.scale * matrix(c(-0.5, 0, 0, -0.6), 2, 2)
m1 = VARMAsim(nobs, arlags = c(1), malags = c(1), phi = p1, theta = th1, sigma = sig)
zt = m1$series

# Print the coefficients of the simulated process
cat("\nSimulated process coefficients:\n")
cat("AR Coefficients (phi):\n")
print(p1)
cat("MA Coefficients (theta):\n")
print(th1)
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
