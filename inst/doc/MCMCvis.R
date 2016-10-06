## ---- message=FALSE------------------------------------------------------
library(MCMCvis)

data(MCMC_data)

MCMCsummary(MCMC_data)

## ------------------------------------------------------------------------
MCMCsummary(MCMC_data, 
          params = 'alpha')

## ------------------------------------------------------------------------
MCMCsummary(MCMC_data, 
          params = 'alpha[1]')

## ------------------------------------------------------------------------
MCMCsummary(MCMC_data, 
          params = 'alpha',
          excl = 'alpha[1]')

## ---- fig.width=5, fig.height=6------------------------------------------
MCMCtrace(MCMC_data, 
        params = c('beta[1]', 'beta[2]', 'beta[3]'))

## ---- fig.width=5, fig.height=6------------------------------------------
MCMCtrace(MCMC_data, 
        params = c('beta[1]', 'beta[2]', 'beta[3]',
                'beta[4]', 'beta[5]', 'beta[6]'),
        type = 'density',
        ind = TRUE)

## ---- fig.width=5, fig.height=6------------------------------------------
MCMCtrace(MCMC_data, 
        params = c('beta[1]', 'beta[2]', 'beta[3]'),
        iter_st = 1800,
        ind = TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  MCMCtrace(MCMC_data,
#          pdf = TRUE,
#          filename = 'MYpdf',
#          wd = 'DIRECTORY HERE')

## ------------------------------------------------------------------------
ex <- MCMCchains(MCMC_data, 
               params = 'beta')

#extract mean values for each parameter
apply(ex, 2, mean)

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
       rank = TRUE)

## ---- fig.width=5, fig.height=6------------------------------------------
MCMCplot(MCMC_data, 
       params = 'beta', 
       xlim = c(-60, 25),
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

