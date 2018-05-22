## ---- eval = FALSE-------------------------------------------------------
#  library(rjags)
#  
#  #create JAGS model
#  mf <- "
#  model {
#  for (i in 1:10)
#  {
#    y[i] ~ dnorm(mu, 0.01);
#  }
#  mu ~ dnorm(0, 0.01)
#  }
#  "
#  
#  data <- list(y = rnorm(10))
#  
#  jm <- rjags::jags.model(textConnection(mf),
#                          data = data,
#                          n.chains = 3)
#  
#  jags_out <- rjags::coda.samples(jm,
#                                   variable.names = 'mu',
#                                   n.iter = 10)

## ------------------------------------------------------------------------
library(MCMCvis)

## ---- eval = FALSE-------------------------------------------------------
#  #plug object directly into package function
#  MCMCsummary(jags_out, round = 2)

## ---- eval = FALSE-------------------------------------------------------
#  ##     mean   sd  2.5%   50% 97.5% Rhat
#  ## mu -0.67 2.95 -6.03 -0.75  4.01 1.19

## ---- eval = FALSE-------------------------------------------------------
#  library(rstan)
#  
#  #create Stan model
#  
#  sm <- "
#  data {
#  real y[10];
#  }
#  parameters {
#  real mu;
#  }
#  model {
#  for (i in 1:10)
#  {
#    y[i] ~ normal(mu, 10);
#  }
#  mu ~ normal(0, 10);
#  }
#  "
#  
#  stan_out <- stan(model_code = sm,
#                    data = data,
#                    iter = 5)

## ---- eval = FALSE-------------------------------------------------------
#  #plug object directly into package function
#  MCMCsummary(stan_out, round = 2)

## ---- eval = FALSE-------------------------------------------------------
#  ##       mean   sd  2.5%   50% 97.5% Rhat
#  ## mu   -0.26 2.82 -4.49 -0.62  4.45 0.94
#  ## lp__ -0.44 0.50 -1.47 -0.30 -0.04 1.21

## ---- message=FALSE------------------------------------------------------
data(MCMC_data)

MCMCsummary(MCMC_data)

## ---- message=FALSE------------------------------------------------------

MCMCsummary(MCMC_data, round = 2)

## ------------------------------------------------------------------------
MCMCsummary(MCMC_data, 
          params = 'alpha', 
          digits = 2)

## ------------------------------------------------------------------------
MCMCsummary(MCMC_data, 
          params = 'alpha\\[1\\]', 
          ISB = FALSE,
          round = 2)

## ------------------------------------------------------------------------
MCMCsummary(MCMC_data, 
          params = 'alpha',
          excl = 'alpha\\[1\\]', 
          ISB = FALSE,
          round = 2)

## ------------------------------------------------------------------------
MCMCsummary(MCMC_data, 
          params = 'alpha',
          Rhat = TRUE,
          n.eff = TRUE,
          round = 2)

## ------------------------------------------------------------------------
MCMCsummary(MCMC_data, 
          params = 'alpha',
          Rhat = TRUE,
          n.eff = TRUE,
          func = function(x) quantile(x, probs = c(0.01, 0.99)),
          func_name = c('1%', '99%'),
          round = 2)

## ---- fig.width=5, fig.height=6------------------------------------------
MCMCpstr(MCMC_data,
         params = 'alpha',
         func = mean,
         type = 'summary')

## ---- fig.width=5, fig.height=6------------------------------------------
MCMCpstr(MCMC_data, 
         func = function(x) quantile(x, probs = c(0.01, 0.99)))

## ------------------------------------------------------------------------
ex <- MCMCpstr(MCMC_data, type = 'chains')

dim(ex$alpha)

## ---- fig.width=5, fig.height=6------------------------------------------
MCMCtrace(MCMC_data, 
        params = c('beta\\[1\\]', 'beta\\[2\\]', 'beta\\[3\\]'),
        ISB = FALSE,
        pdf = FALSE)

## ---- fig.width=5, fig.height=6------------------------------------------
MCMCtrace(MCMC_data, 
        params = 'beta',
        type = 'density',
        ind = TRUE, 
        pdf = FALSE)

## ---- eval=FALSE---------------------------------------------------------
#  MCMCtrace(MCMC_data,
#          pdf = TRUE,
#          open_pdf = FALSE,
#          filename = 'MYpdf',
#          wd = 'DIRECTORY_HERE')

## ---- fig.width=5, fig.height=6------------------------------------------
MCMCtrace(MCMC_data, 
        params = c('beta\\[1\\]', 'beta\\[2\\]', 'beta\\[3\\]'),
        ISB = FALSE,
        iter = 100,
        ind = TRUE,
        pdf = FALSE)

## ---- fig.width=5, fig.height=6------------------------------------------
#same prior used for all parameters
PR <- rnorm(15000, 0, 32) #equivalent to dnorm(0, 0.001) in JAGS
MCMCtrace(MCMC_data,
          params = c('beta\\[1\\]', 'beta\\[2\\]', 'beta\\[3\\]'),
          ISB = FALSE,
          priors = PR,
          pdf = FALSE)

## ---- fig.width=5, fig.height=6------------------------------------------
#same prior used for all parameters
PR <- rnorm(15000, 0, 32) #equivalent to dnorm(0, 0.001) in JAGS
PPO <- MCMCtrace(MCMC_data, 
                 params = c('beta\\[1\\]', 'beta\\[2\\]', 'beta\\[3\\]'),
                 ISB = FALSE,
                 priors = PR,
                 pdf = FALSE,
                 post_zm = FALSE,
                 PPO_out = TRUE)

PPO

## ---- fig.width=5, fig.height=6------------------------------------------
#generating values for each parameter used to simulate data
GV <- c(-10, -5.5, -15)
MCMCtrace(MCMC_data,
          params = c('beta\\[1\\]', 'beta\\[2\\]', 'beta\\[3\\]'),
          ISB = FALSE,
          gvals = GV,
          pdf = FALSE)

## ------------------------------------------------------------------------
ex <- MCMCchains(MCMC_data, 
               params = 'beta')

#extract mean values for each parameter
apply(ex, 2, mean)

## ------------------------------------------------------------------------
ex2 <- MCMCchains(MCMC_data, 
                  params = 'beta', 
                  mcmc.list = TRUE)

## ---- fig.width=5, fig.height=6------------------------------------------
MCMCplot(MCMC_data, 
       params = 'beta')

## ---- fig.width=5, fig.height=6------------------------------------------
MCMCplot(MCMC_data, 
       params = 'beta',
       ref_ovl = TRUE)

## ---- fig.width=5, fig.height=6------------------------------------------
MCMCplot(MCMC_data, 
       params = 'beta', 
       rank = TRUE,
       xlab = 'ESTIMATE')

## ---- fig.width=5, fig.height=6------------------------------------------
MCMCplot(MCMC_data, 
       params = 'beta', 
       rank = TRUE,
       horiz = FALSE,
       ylab = 'ESTIMATE')

## ---- fig.width=5, fig.height=6------------------------------------------
MCMCplot(MCMC_data, 
       params = 'beta', 
       xlim = c(-60, 40),
       xlab = 'My x-axis label',
       main = 'MCMCvis plot',
       labels = c('First param', 'Second param', 'Third param', 
                  'Fourth param', 'Fifth param', 'Sixth param'), 
       col = 'red',
       labels_sz = 1.5,
       med_sz = 2,
       thick_sz = 7,
       thin_sz = 3,
       ax_sz = 4,
       main_text_sz = 2)

