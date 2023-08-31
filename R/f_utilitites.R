
sigmaToBPD <- function(sigma) {
    bpd <- rep(NA_real_, ncol(sigma))
    bpd[1] <- sqrt(sigma[1, 2] * sigma[1, 3] / sigma[2, 3])
    for (i in (2:ncol(sigma))) {
        bpd[i] <- sigma[1, i] / bpd[1]
    }
    return(bpd)
}
