#include "Rcpp.h"
using namespace Rcpp;

// First we'll declare the MVNPRD Fortran function
// as mvnprd_ in an extern "C" linkage specification
// making sure to have the arguments passed as pointers.
extern "C" {
  void mvnprd_(float* a, float* b, float* bpd, float* eps, int* n, int* inf, int* ierc, float* hinc, float* prob, float* bound, int* ifault);
  void mvstud_(int* ndf, float* a, float* b, float* bpd, float* eps, int* n, int* inf, float* d, int* ierc, float* hnc, float* prob, float* bnd, int* iflt);
}


// [[Rcpp::export(".mvnprd")]]
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

// [[Rcpp::export(".mvstud")]]
NumericVector mvstud(int ndf, NumericVector a, NumericVector b, NumericVector bpd, float eps, IntegerVector inf , NumericVector d, int ierc, float hnc) {
  int n = a.size();

  //initialize float arrays
  float* af = new float[n];
  float* bf = new float[n];
  float* bpdf = new float[n];
  float* df = new float[n];

  //copy vectors into float arrays
  for(int i = 0; i < n; i++) {
    af[i] = (float) a[i];
    bf[i] = (float) b[i];
    bpdf[i] = (float) bpd[i];
    df[i] = (float) d[i];
  }

  //initialize result variables
  float prob = 0;
  float bnd = 0;
  int iflt = 0;

  mvstud_(&ndf, &(af[0]), &(bf[0]), &(bpdf[0]), &eps, &n, &(inf[0]), &(df[0]), &ierc, &hnc, &prob, &bnd, &iflt);

  //free allocated memory
  delete[] af;
  delete[] bf;
  delete[] bpdf;
  delete[] df;

  return NumericVector::create(prob, bnd, iflt);
}
