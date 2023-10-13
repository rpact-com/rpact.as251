
#'
#' @title
#' rpact AS 251
#'
#' @description
#' This R package integrates Charles Dunnetts AS 251 FORTRAN 77 algorithm from the journal article 
#' "Multivariate Normal Probability Integrals with Product Correlation Structure" in R using Rcpp.
#'
#' @details
#' TODO
#'
#' @references
#' Dunnett, C. W. (1989). Algorithm AS 251: Multivariate Normal Probability Integrals with Product 
#' Correlation Structure. Journal of the Royal Statistical Society. 
#' Series C (Applied Statistics), 38(3), 564–579. 
#' [doi.org/10.2307/2347754](https://doi.org/10.2307/2347754)
#'
#' @docType package
#' @author Till Jensen, Friedrich Pahlke
#' @importFrom Rcpp evalCpp
#' @useDynLib rpact.as251, .registration = TRUE
#' @name rpact.as251
#' 
#' @exportPattern "^[[:alpha:]]+"
#'
"_PACKAGE"
#> [1] "_PACKAGE"
