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
