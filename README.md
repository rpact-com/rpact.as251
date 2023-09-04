# rpact.as251

## Introduction

This R package integrates Charles Dunnetts AS 251 FORTRAN 77 algorithm from the journal article "Multivariate Normal Probability Integrals with Product Correlation Structure" in R using Rcpp. 

## Pitfalls

The Fortran implementation makes use of REAL variables, which correspond to the float datatype in C++.
When calling the Fortran function from C++, the parameters are passed by their address.
If a pointer to a double array were to be passed, the Fortran code would keep reading it as float array causing every other float to be the gibberish, as part of the mantisse of the previous double value is read.
For this reason, the input NumericVectors are cast to float arrays. 

See [Extending R with C++ and Fortran](https://gallery.rcpp.org/articles/Combining-R-with-Cpp-and-Fortran/)
