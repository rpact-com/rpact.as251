
.sigmaToBPD <- function(sigma) {
    bpd <- rep(NA_real_, ncol(sigma))
    if (ncol(sigma) == 2) {
        bpd[1:2] <- sqrt(sigma[1, 2])
        return(bpd)
    }
    
    bpd[1] <- sqrt(sigma[1, 2] * sigma[1, 3] / sigma[2, 3])
    bpd[2:ncol(sigma)] <- sigma[1, 2:ncol(sigma)] / bpd[1]
    return(bpd)
}
