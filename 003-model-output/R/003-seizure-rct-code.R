#####################################
# R Source code for seizure data
# Created: May 13, 2019
# Updated: 
# NOTES:you need the custom extract function defined in 003-texreg-package.R for this code to work
#####################################


## ---- import-data ----
data("epil") # from MASS library
DT <- epil %>% as.data.table
DT.base <- DT %>% distinct(subject, .keep_all = TRUE)
DT.base[,`:=`(period=0,y=base)]
DT.epil <- rbind(DT,DT.base)
setkey(DT.epil,subject, period)
DT.epil[,`:=`(post=as.numeric(period>0), tj=ifelse(period==0,8,2))]

## ---- fit-models ----
fit.glm <- glm(y ~ trt*post, 
               data = DT.epil, family = "poisson", offset = log(tj))

fit.glmm <- lme4::glmer(y ~ trt*post + (1|subject), 
                  data = DT.epil, family = "poisson", offset = log(tj))

fit.gee.ind <- geepack::geeglm(y ~ trt*post, id = subject, offset = log(tj),
                                data = DT.epil, family = "poisson", corstr = "independence")

fit.gee.ex <- geepack::geeglm(y ~ trt*post, id = subject, offset = log(tj),
                                data = DT.epil, family = "poisson", corstr = "exchangeable")

fit.gee.unst <- geepack::geeglm(y ~ trt*post, id = subject, offset = log(tj),
                  data = DT.epil, family = "poisson", corstr = "unstructured")

fit.gee.ar1 <- geepack::geeglm(y ~ trt*post, id = subject, offset = log(tj),
                                data = DT.epil, family = "poisson", corstr = "ar1")

texreg::texreg(list(fit.glm,fit.glmm,fit.gee.ind, fit.gee.unst, fit.gee.ex,fit.gee.ar1), 
               custom.model.names = c("GLM","GLMM","GEE Ind","GEE Unst.","GEE Ex.","GEE AR1"), 
       custom.coef.names = c("$\\beta_0$", "$\\beta_1$","$\\beta_2$","$\\beta_3$"),
       fontsize = "scriptsize", caption = "Comparing model estimates", single.row = T,
       bold = 0.05, float.pos = 'H')



## ---- fit-models-RMD ----
fit.glm <- glm(y ~ trt*post, 
               data = DT.epil, family = "poisson", offset = log(tj))

fit.glmm <- lme4::glmer(y ~ trt*post + (1|subject), 
                        data = DT.epil, family = "poisson", offset = log(tj))

fit.gee.ind <- geepack::geeglm(y ~ trt*post, id = subject, offset = log(tj),
                               data = DT.epil, family = "poisson", corstr = "independence")

fit.gee.ex <- geepack::geeglm(y ~ trt*post, id = subject, offset = log(tj),
                              data = DT.epil, family = "poisson", corstr = "exchangeable")

fit.gee.unst <- geepack::geeglm(y ~ trt*post, id = subject, offset = log(tj),
                                data = DT.epil, family = "poisson", corstr = "unstructured")

fit.gee.ar1 <- geepack::geeglm(y ~ trt*post, id = subject, offset = log(tj),
                               data = DT.epil, family = "poisson", corstr = "ar1")

texreg::htmlreg(list(fit.glm,fit.glmm,fit.gee.ind, fit.gee.unst, fit.gee.ex,fit.gee.ar1), 
               custom.model.names = c("GLM","GLMM","GEE Ind","GEE Unst.","GEE Ex.","GEE AR1"), 
               custom.coef.names = c("$\\beta_0$", "$\\beta_1$","$\\beta_2$","$\\beta_3$"),
               caption = "Comparing model estimates", single.row = T,
               bold = 0.05)





