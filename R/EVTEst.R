rm(list=ls())

library(tidyverse)
library(evir)
data(danish)
Y = danish
#Y = c(rnorm(1000),rnorm(1000,0,2))
th = quantile(Y,.95)
res_eva <- eva::gpdFit(Y, threshold = th)
res_evir <- evir::gpd(Y, threshold = th)
res_fExtremes <- fExtremes::gpdFit(Y,u = th)
res_QRM <- QRM::fit.GPD(Y, threshold = th)
res_ismev <- ismev::gpd.fit(Y, threshold = th)
res_texmex <- texmex::gpdRangeFit(Y, umin = th, umax = th)
# res3 <- extRemes::fevd(Y, threshold=th, type="GP", optim.args = list(method = "BFGS", gr = NULL))
res_extRemes <- extRemes::fevd(Y, threshold=th, type="GP")
EVAest <- rev(res_eva$par.ests)
EVIRest <- res_evir$par.ests
FEXTREMESest <- res_fExtremes@fit$par.ests
QRMest <- res_QRM$par.ests
ISMEVest <- rev(res_ismev$mle)
TEXMEXest <- rev(res_texmex$par[1,])
EXTREMESest <- rev(res_extRemes$results$par)
ESTtib <- tibble(EVAest,EVIRest,FEXTREMESest,QRMest,ISMEVest,TEXMEXest,EXTREMESest)
print(ESTtib)

# print(EVAest)
# print(res_evir$par.ests)
# print(res_fExtremes@fit$par.ests)
# print(QRMest)
# print(ISMEVest)
# print(TEXMEXest)
# print(EXTREMESest)
