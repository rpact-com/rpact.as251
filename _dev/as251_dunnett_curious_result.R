##
## Curious result for AS251 Dunnett probabilities
## only for df = 20 and upper = 1.
## Even for df = 19 or upper = 1.001 (or eps = 1e-6, result is correct!
## September 11, 2023
##

upConst <- 0.85
sc <- 1.5
gMax <- 6
frac <- upConst * abs(sin((1:gMax)))^sc
round(frac, 4)
sigma <- sqrt(frac) %*% sqrt(t(frac))
diag(sigma) <- 1
df <- 20
upper <- 1.001
mnormt::sadmvt(lower = -Inf, upper = upper, mean = 0, S = sigma, df = df)
rpact.as251::as251StudentT(lower = -Inf, upper = upper, sigma = sigma, eps = 1e-05, df = df)

upper <- 1
mnormt::sadmvt(lower = -Inf, upper = upper, mean = 0, S = sigma, df = df)
rpact.as251::as251StudentT(lower = -Inf, upper = upper, sigma = sigma, eps = 1e-05, df = df)
