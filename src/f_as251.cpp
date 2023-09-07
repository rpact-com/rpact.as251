#include "Rcpp.h"

// [[Rcpp::plugins(cpp11)]]

using namespace Rcpp;

extern "C" {
    void mvnprd_(
    	float* a,
		float* b,
		float* bpd,
		float* eps,
		int* n,
		int* inf,
		int* ierc,
		float* hinc,
		float* prob,
		float* bound,
		int* ifault);
}

// [[Rcpp::export(".mvnprd")]]
NumericVector mvnprd(
	NumericVector a,
	NumericVector b,
	NumericVector bpd,
	float eps,
	IntegerVector inf,
	int ierc,
	float hinc) {

  int n = a.size();

  // initialize float arrays
  float* af = new float[n];
  float* bf = new float[n];
  float* bpdf = new float[n];

  // copy vectors into float arrays
  for (int i = 0; i < n; i++) {
    af[i] = (float) a[i];
    bf[i] = (float) b[i];
    bpdf[i] = (float) bpd[i];
  }

  // initialize result variables
  float prob = 0;
  float bound = 0;
  int ifault = 0;

  mvnprd_(&(af[0]), &(bf[0]), &(bpdf[0]), &eps, &n, &(inf[0]), &ierc, &hinc, &prob, &bound, &ifault);

  // free allocated memory
  delete[] af;
  delete[] bf;
  delete[] bpdf;

  return NumericVector::create(prob, bound, ifault);
}

// SUBROUTINE MVNPRD(     A, B, BPD, EPS,  N, INF,    IERC, HINC, PROB, BOUND, IFAULT)
// SUBROUTINE MVSTUD(NDF, A, B, BPD, ERRB, N, INF, D, IERC, HNC,  PROB, BND,   IFLT)

/**
\item{NDF}{ Degrees of Freedom.  Use 0 for infinite D.F. }
\item{A}{ Upper limits of integration.  Array of N dimensions }
\item{B}{ Lower limits of integration.  Array of N dimensions }
\item{BPD}{ Values defining correlation structure.  Array of N dimensions }
\item{INF}{ Determines where integration is done to infinity.  Array of
            N dimensions.  Valid values for INF(I): 0=(B(I), inf),
            1=(-inf, A(I)), 2=(B(I),A(I)) }
\item{D}{ Non-Centrality Vector }
\item{EPS}{ desired accuracy.  Defaults to 1e-04 }
\item{IERC}{ error control.  If set to 1, strict error control based on
             fourth derivative is used.  If set to zero, error control based
             on halving intervals is used }
\item{HINC}{ Interval width for Simpson's rule.  Value of zero caused
             a default .24 to be used }
*/

extern "C" {
    void mvstud_(
    	int* ndf,
    	float* a,
		float* b,
		float* bpd,
		float* errb,
		int* n,
		int* inf,
		float* d,
		int* ierc,
		float* hnc,
		float* prob,
		float* bnd,
		int* iflt);
}

// [[Rcpp::export(".mvstud")]]
NumericVector mvstud(
	int ndf,
	NumericVector a,
	NumericVector b,
	NumericVector bpd,
	NumericVector d,
	float eps,
	IntegerVector inf,
	int ierc,
	float hnc) {

  int n = a.size();

  // initialize float arrays
  float* af = new float[n];
  float* bf = new float[n];
  float* bpdf = new float[n];
  float* df = new float[n];

  // copy vectors into float arrays
  for (int i = 0; i < n; i++) {
    af[i] = (float) a[i];
    bf[i] = (float) b[i];
    bpdf[i] = (float) bpd[i];
    df[i] = (float) d[i];
  }

  // initialize result variables
  float prob = 0;
  float bnd = 0;
  int iflt = 0;

  // MVSTUD(NDF, A, B, BPD, ERRB, N, INF, D, IERC, HNC, PROB, BND, IFLT)
  mvstud_(&ndf, &(af[0]), &(bf[0]), &(bpdf[0]), &eps, &n, &(inf[0]), &(df[0]), &ierc, &hnc, &prob, &bnd, &iflt);

  // free allocated memory
  delete[] af;
  delete[] bf;
  delete[] bpdf;
  delete[] df;

  return NumericVector::create(prob, bnd, iflt);
}
