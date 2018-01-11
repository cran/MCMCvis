## ---- message=FALSE------------------------------------------------------
library(MCMCvis)

data(MCMC_data)

MCMCsummary(MCMC_data)

## ------------------------------------------------------------------------
MCMCsummary(MCMC_data, 
          params = 'alpha')

## ------------------------------------------------------------------------
MCMCsummary(MCMC_data, 
          params = 'alpha\\[1\\]', 
          ISB = FALSE)

## ------------------------------------------------------------------------
MCMCsummary(MCMC_data, 
          params = 'alpha',
          excl = 'alpha\\[1\\]', 
          ISB = FALSE)

## ------------------------------------------------------------------------
MCMCsummary(MCMC_data, 
          params = 'alpha',
          Rhat = TRUE,
          n.eff = TRUE)

## ------------------------------------------------------------------------
MCMCsummary(MCMC_data, 
          params = 'alpha',
          Rhat = TRUE,
          n.eff = TRUE,
          func = function(x) quantile(x, probs = c(0.01, 0.99)),
          func_name = c('1%', '99%'))

## ---- fig.width=5, fig.height=6------------------------------------------
MCMCpstr(MCMC_data,
         params = 'alpha',
         func = mean)

## ---- fig.width=5, fig.height=6------------------------------------------
MCMCpstr(MCMC_data, 
         func = function(x) quantile(x, probs = 0.01))

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
#          filename = 'MYpdf',
#          wd = 'DIRECTORY_HERE')

## ---- fig.width=5, fig.height=6------------------------------------------
MCMCtrace(MCMC_data, 
        params = c('beta\\[1\\]', 'beta\\[2\\]', 'beta\\[3\\]'),
        ISB = FALSE,
        iter = 1800,
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
       ref_ovl = FALSE, 
       ref = NULL)

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
                  'Fourth param', 'Fifth param', 'Sixth param', 
                  'Seventh param', 'Eighth param', 'Nineth param', 
                  'Tenth param'), 
       labels_sz = 1.5,
       med_sz = 2,
       thick_sz = 7,
       thin_sz = 3,
       ax_sz = 4,
       main_text_sz = 2)

