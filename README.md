# rpact.as251

## Introduction

This R package integrates Charles Dunnetts AS 251 FORTRAN 77 algorithm from the journal article "Multivariate Normal Probability Integrals with Product Correlation Structure" in R using Rcpp. 

## Pitfalls

The Fortran implementation makes use of REAL variables, which correspond to the float datatype in C++. Therefore the input NumericVectors are cast to float arrays.
