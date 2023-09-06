// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

#ifdef RCPP_USE_GLOBAL_ROSTREAM
Rcpp::Rostream<true>&  Rcpp::Rcout = Rcpp::Rcpp_cout_get();
Rcpp::Rostream<false>& Rcpp::Rcerr = Rcpp::Rcpp_cerr_get();
#endif

// mvnprd
NumericVector mvnprd(NumericVector a, NumericVector b, NumericVector bpd, float eps, IntegerVector inf, int ierc, float hinc);
RcppExport SEXP _rpact_as251_mvnprd(SEXP aSEXP, SEXP bSEXP, SEXP bpdSEXP, SEXP epsSEXP, SEXP infSEXP, SEXP iercSEXP, SEXP hincSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericVector >::type a(aSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type b(bSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type bpd(bpdSEXP);
    Rcpp::traits::input_parameter< float >::type eps(epsSEXP);
    Rcpp::traits::input_parameter< IntegerVector >::type inf(infSEXP);
    Rcpp::traits::input_parameter< int >::type ierc(iercSEXP);
    Rcpp::traits::input_parameter< float >::type hinc(hincSEXP);
    rcpp_result_gen = Rcpp::wrap(mvnprd(a, b, bpd, eps, inf, ierc, hinc));
    return rcpp_result_gen;
END_RCPP
}
// mvstud
NumericVector mvstud(int ndf, NumericVector a, NumericVector b, NumericVector bpd, NumericVector d, float eps, IntegerVector inf, int ierc, float hnc);
RcppExport SEXP _rpact_as251_mvstud(SEXP ndfSEXP, SEXP aSEXP, SEXP bSEXP, SEXP bpdSEXP, SEXP dSEXP, SEXP epsSEXP, SEXP infSEXP, SEXP iercSEXP, SEXP hncSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< int >::type ndf(ndfSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type a(aSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type b(bSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type bpd(bpdSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type d(dSEXP);
    Rcpp::traits::input_parameter< float >::type eps(epsSEXP);
    Rcpp::traits::input_parameter< IntegerVector >::type inf(infSEXP);
    Rcpp::traits::input_parameter< int >::type ierc(iercSEXP);
    Rcpp::traits::input_parameter< float >::type hnc(hncSEXP);
    rcpp_result_gen = Rcpp::wrap(mvstud(ndf, a, b, bpd, d, eps, inf, ierc, hnc));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_rpact_as251_mvnprd", (DL_FUNC) &_rpact_as251_mvnprd, 7},
    {"_rpact_as251_mvstud", (DL_FUNC) &_rpact_as251_mvstud, 9},
    {NULL, NULL, 0}
};

RcppExport void R_init_rpact_as251(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
