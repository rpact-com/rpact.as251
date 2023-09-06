
#'
#' Algorithm AS 251.1  appl.statist. (1989), vol.38, no.3
#' 
#' For a multivariate normal vector with correlation structure
#' defined by RHO(I,J) = BPD(I) * BPD(J), computes the probability
#' that the vector falls in a rectangle in n-space with error
#' less than eps.
#' 
#' @param A Upper limits of integration. Array of N dimensions
#' @param B Lower limits of integration. Array of N dimensions
#' @param BPD Values defining correlation structure. Array of N dimensions
#' @param INF Determines where integration is done to infinity. Array of N dimensions. 
#' Valid values for INF(I): 
#'   0 = c(B(I), Inf), 
#'   1 = c(-Inf, A(I)), 
#'   2 = c(B(I), A(I))
#' @param EPS desired accuracy.  Defaults to 1e-06
#' @param IERC error control. If set to 1, strict error control based on 
#' fourth derivative is used.  If set to zero, error control based on halving intervals is used
#' @param HINC Interval width for Simpson's rule. Value of zero caused a default .24 to be used
#' 
#' @export
#'  
mvnprd <- function(..., A, B, BPD, EPS = 1e-06, INF, IERC = 1, HINC = 0) {
    if (length(A) != length(B) || length(B) != length(BPD) || length(BPD) != length(INF)) {
        stop("Illegal argument: input vectors must have the same length (",
            paste0(sort(unique(c(length(A), length(B), length(BPD), length(INF)))), collapse = " != "), ")")
    }

    result <- .mvnprd(A, B, BPD, EPS, INF, IERC, HINC)
    value <- result[1]
    attr(value, "bound") <- result[2]
    attr(value, "iFault") <- as.integer(result[3])
    return(value)
}

#'
#' Algorithm AS 251.1  appl.statist. (1989), vol.38, no.3
#' 
#' For a multivariate normal vector with correlation structure
#' defined by rho(i,j) = bpd(i) * bpd(j), computes the probability
#' that the vector falls in a rectangle in n-space with error
#' less than eps.
#' 
#' @param lower Lower limits of integration. Array of N dimensions
#' @param upper Upper limits of integration. Array of N dimensions
#' @param sigma Values defining correlation structure. Array of N dimensions
#' @param eps desired accuracy.  Defaults to 1e-06
#' @param errorControl error control. If set to 1, strict error control based on 
#'        fourth derivative is used. If set to zero, error control based on halving intervals is used
#' @param intervalSimpsonRule Interval width for Simpson's rule. Value of zero caused a default .24 to be used
#' 
#' @export
#'  
as251Normal <- function(
    lower, upper, sigma, ..., 
    eps = 1e-06, 
    errorControl = c("strict", "halvingIntervals"), 
    intervalSimpsonsRule = 0) {
    
    errorControl <- match.arg(errorControl)
    if (errorControl == "strict") {
        errorControl <- 1
    } else {
        errorControl <- 0
    }
    
    bpd <- .sigmaToBPD(sigma)
    n <- length(bpd)
    lower <- rep(lower, n)
    upper <- rep(upper, n)
    
    inf <- rep(2, n)
    inf[is.infinite(upper) & upper > 0] <- 0
    inf[is.infinite(lower) & lower < 0] <- 1
    
    result <- mvnprd(A = upper, B = lower, BPD = bpd, EPS = eps, INF = inf, 
        IERC = errorControl, HINC = intervalSimpsonsRule)
    iFault <- attr(result, "iFault")
    return(result)
}

#'
#' Algorithm AS 251.1  appl.statist. (1989), vol.38, no.3
#' 
#' For a multivariate normal vector with correlation structure
#' defined by RHO(I,J) = BPD(I) * BPD(J), computes the probability
#' that the vector falls in a rectangle in n-space with error
#' less than eps.
#' 
#' @param NDF Degrees of Freedom. Use 0 for infinite D.F.
#' @param A Upper limits of integration. Array of N dimensions
#' @param B Lower limits of integration. Array of N dimensions
#' @param BPD Values defining correlation structure. Array of N dimensions
#' @param INF Determines where integration is done to infinity. Array of N dimensions. 
#' Valid values for INF(I): 
#'   0 = c(B(I), Inf), 
#'   1 = c(-Inf, A(I)), 
#'   2 = c(B(I), A(I))
#' @param D Non-Centrality Vector
#' @param EPS desired accuracy.  Defaults to 1e-06
#' @param IERC error control. If set to 1, strict error control based on 
#' fourth derivative is used.  If set to zero, error control based on halving intervals is used
#' @param HINC Interval width for Simpson's rule. Value of zero caused a default .24 to be used
#' 
#' @examples 
#' N <- 3
#' rho <- 0.5
#' B   <- rep(-5.0,      length=N)
#' A   <- rep(5.0,       length=N)
#' INF <- rep(2,         length=N)
#' BPD <- rep(sqrt(rho), length=N)
#' D   <- rep(0.0,       length=N)
#' result <- mvstud(0, A, B, BPD, INF, D)
#' result
#' 
#' @export
#'  
mvstud <- function(..., NDF, A, B, BPD, D, EPS = 1e-06, INF, IERC = 1, HINC = 0) {
    if (length(A) != length(B) || length(B) != length(BPD) || length(BPD) != length(INF) || length(INF) != length(D)) {
        stop("Illegal argument: input vectors must have the same length (",
            paste0(sort(unique(c(length(A), length(B), length(BPD), length(INF), length(D)))), collapse = " != "), ")")
    }

    result <- .mvstud(NDF, A, B, BPD, D, EPS, INF, IERC, HINC)
    value <- result[1]
    attr(value, "bound") <- result[2]
    attr(value, "iFault") <- as.integer(result[3])
    return(value)
}

#'
#' Algorithm AS 251.1  appl.statist. (1989), vol.38, no.3
#' 
#' For a multivariate normal vector with correlation structure
#' defined by rho(i,j) = bpd(i) * bpd(j), computes the probability
#' that the vector falls in a rectangle in n-space with error
#' less than eps.
#' 
#' @param lower Lower limits of integration. Array of N dimensions
#' @param upper Upper limits of integration. Array of N dimensions
#' @param sigma Values defining correlation structure. Array of N dimensions
#' @param df Degrees of Freedom. Use 0 for infinite D.F.
#' @param eps desired accuracy.  Defaults to 1e-06
#' @param errorControl error control. If set to 1, strict error control based on 
#'        fourth derivative is used. If set to zero, error control based on halving intervals is used
#' @param intervalSimpsonRule Interval width for Simpson's rule. Value of zero caused a default .24 to be used
#' 
#' @export
#'  
as251StudentT <- function(
    lower, upper, sigma, ..., 
    df,
    eps = 1e-06, 
    errorControl = c("strict", "halvingIntervals"), 
    intervalSimpsonsRule = 0) {
    
    errorControl <- match.arg(errorControl)
    if (errorControl == "strict") {
        errorControl <- 1
    } else {
        errorControl <- 0
    }
    
    bpd <- .sigmaToBPD(sigma)
    n <- length(bpd)
    lower <- rep(lower, n)
    upper <- rep(upper, n)
    
    inf <- rep(2, n)
    inf[is.infinite(upper) & upper > 0] <- 0
    inf[is.infinite(lower) & lower < 0] <- 1
    
    d <- rep(0.0, n)
    
    result <- mvstud(NDF = df, A = upper, B = lower, BPD = bpd, D = d, EPS = eps, INF = inf, 
        IERC = errorControl, HINC = intervalSimpsonsRule)
    iFault <- attr(result, "iFault") 
    return(result)
}
