% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MCMCchains.R
\name{MCMCchains}
\alias{MCMCchains}
\title{Extract posterior chains from MCMC output}
\usage{
MCMCchains(
  object,
  params = "all",
  excl = NULL,
  ISB = TRUE,
  exact = TRUE,
  mcmc.list = FALSE,
  chain_num = NULL
)
}
\arguments{
\item{object}{Object containing MCMC output. See DETAILS below.}

\item{params}{Character string (or vector of character strings) denoting parameters of interest.

Default \code{'all'} returns chains for all parameters.}

\item{excl}{Character string (or vector of character strings) denoting parameters to exclude. Used in conjunction with \code{params} argument to select parameters of interest.}

\item{ISB}{Ignore Square Brackets (ISB). Logical specifying whether square brackets should be ignored in the \code{params} and \code{excl} arguments. If \code{TRUE}, square brackets are ignored. If \code{FALSE}, square brackets are not ignored.  This allows partial names to be used when specifying parameters of interest. Use \code{exact} argument to specify whether input from \code{params} and \code{excl} arguments should be matched exactly.}

\item{exact}{Logical specifying whether input from \code{params} and \code{excl} arguments should be matched exactly (after ignoring square brackets if \code{ISB = FALSE}). If \code{TRUE}, input from \code{params} and \code{excl} are matched exactly (after taking \code{ISB} argument into account). If \code{FALSE}, input from \code{params} and \code{excl} are matched using regular expression format (after taking \code{ISB} argument into account).}

\item{mcmc.list}{Logical specifying whether to return an mcmc.list. If \code{TRUE}, an \code{mcmc.list} object is returned, rather than a matrix.}

\item{chain_num}{Numeric - specifies posterior chain number. When a value is specified, posterior for only that chain is output. Useful for determining the last iteration for each parameter, to be used as initial values in a subsequent model, to effectively 'continue' a model run.}
}
\description{
Extract posterior chains from MCMC output for specific parameters of interest.
}
\section{Details}{

Function returns matrix with one parameter per column (for specified parameters). Each iteration is represented as a row. Multiple chains for each parameter are combined to one posterior chain (unless \code{chain_num} is specified, in which case only the specified chain will be returned). Parameters are arranged in columns alphabetically.

\code{object} argument can be a \code{stanfit} object (\code{rstan} package), a \code{CmdStanMCMC} object (\code{cmdstanr} package), a \code{stanreg} object (\code{rstanarm} package), a \code{brmsfit} object (\code{brms} package), an \code{mcmc.list} object (\code{coda} and \code{rjags} packages), \code{mcmc} object (\code{coda} and \code{nimble} packages), \code{list} object (\code{nimble} package), an \code{R2jags} model object (\code{R2jags} package), a \code{jagsUI} model object (\code{jagsUI} package), or a matrix containing MCMC chains (each column representing MCMC output for a single parameter, rows representing iterations in the chain). The function automatically detects the object type and proceeds accordingly.
}

\examples{
#Load data
data(MCMC_data)

#Extract MCMC chains
ex <- MCMCchains(MCMC_data)
apply(ex, 2, mean)

#Extract MCMC chains for just 'beta' parameters
ex2 <- MCMCchains(MCMC_data, params = 'beta')
apply(ex2, 2, mean)

#Just 'beta[1]', 'beta[4]', and 'alpha[3]'
ex3 <- MCMCchains(MCMC_data, params = c('beta[1]', 'beta[4]', 'alpha[3]'), 
                 ISB = FALSE, exact = TRUE)
apply(ex3, 2, sd)

}
