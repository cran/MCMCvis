#' The 'MCMCvis' package
#'
#' `MCMCvis` is an R package used to visualize, manipulate, and summarize MCMC output. MCMC output may be derived from Bayesian model output fit with JAGS, Stan, or other MCMC samplers.
#'
#' @section Details:
#' The following functions are currently available:
#'
#'      -\code{MCMCsummary} - summarize MCMC output for particular parameters of interest
#'
#'      -\code{MCMCpstr} - summarize MCMC output for particular parameters of interest while preserving original parameter structure
#'
#'      -\code{MCMCtrace} - create trace and density plots of MCMC chains for particular parameters of interest
#'
#'      -\code{MCMCchains} - easily extract posterior chains from MCMC output for particular parameters of interest
#'
#'      -\code{MCMCplot} - create caterpillar plots from MCMC output for particular parameters of interest)
#'
#'      -\code{MCMCdiag} - create a .txt file and save specified objects that summarize model inputs, outputs, and diagnostics
#'
#' Example data can be loaded using \code{data(MCMC_data)}.
#'
#' `MCMCvis` was designed to perform key functions for MCMC analysis using minimal code, in order to free up time/brainpower for interpretation of analysis results. Functions support simple and straightforward subsetting of model parameters within the calls, and produce presentable, 'publication-ready' output.
#'
#' The vignette can be run using \code{vignette('MCMCvis')} if vignette is built when installing package.
#'
#' @section Author(s):
#' Casey Youngflesh <caseyyoungflesh@gmail.com>
#' Christian Che-Castaldo <chrischecastaldo@protonmail.com>
#'
'_PACKAGE'
