
#' @export 
mvnprd <- function(A, B, BPD, EPS = 1e-06, INF, IERC = 1, HINC = 0) {
    if (length(A) != length(B) || length(B) != length(BPD) || length(BPD) != length(INF)) {
        stop("Input vectors must have the same length.")
    }

    result <- .mvnprd(A, B, BPD, EPS, INF, IERC, HINC)

    if (result[3] != 0) {
        warning("mvnprd returned a fault.")
    }
    return(result)
}

#' @export 
as251Normal <- function(lower, upper, sigma, inf, ..., eps = 1e-06, ierc = 1, hinc = 0) {
    bpd <- sigmaToBPD(sigma)
    n <- length(bpd)
    lower <- rep(lower, n)
    upper <- rep(upper, n)
    inf <- lower
    mvnprd(lower, upper, bpd, eps, inf, ierc, hinc)
}
