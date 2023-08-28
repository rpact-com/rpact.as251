#include "Rcpp.h"
using namespace Rcpp;

extern "C" {
    void mvnprd_(float* a, float* b, float* bpd, float* eps, int* n, int* inf, int* ierc, float* hinc, float* prob, float* bound, int* ifault);
}


// [[Rcpp::export]]
NumericVector mvnprd(NumericVector a, NumericVector b, NumericVector bpd, float eps, IntegerVector inf, int ierc, float hinc) {
  int n = a.size();
  if(a.size() != b.size() && b.size() != bpd.size() && bpd.size() != inf.size()) {
    //TODO error
  }

  //copy vectors into float arrays
  float af[n];
  float bf[n];
  float bpdf[n];

  for(int i = 0; i < n; i++) {
    af[i] = (float) a[i];
    bf[i] = (float) b[i];
    bpdf[i] = (float) bpd[i];
  }

  float prob = 0;
  float bound = 0;
  int ifault = 0;
  mvnprd_(&(af[0]), &(bf[0]), &(bpdf[0]), &eps, &n, &(inf[0]), &ierc, &hinc, &prob, &bound, &ifault);

  return NumericVector::create(prob, bound, ifault);
}
