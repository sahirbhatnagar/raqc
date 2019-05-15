---
title: "003-Model Output"
author: "Randomized Control Trial on Epileptic Seizures"
date: "2019-05-14"
output:
  bookdown::html_document2:
    keep_md: true
    theme: flatly
    highlight: tango
    fig_caption: yes
    toc: true
    toc_float:
      collapsed: true
      smooth_scroll: true
    number_sections: true
bibliography: 003-bibliography.bib
link-citations: yes
editor_options: 
  chunk_output_type: console
header-includes:
   - \usepackage{bbm}
---










# Introduction

Outputting regression estimates to \LaTeX tables is one of the most tedious tasks an analyst has to perform. If an error is made during the data-cleaning or analysis steps, one is forced to manually re-enter the parameter estimates and their standard errors. Furthermore, manual entry of so many numbers is prone to error. In this example, we illustrate how to automate the task of creating tables from model output using the `xtable::xtable` [@xtable] and `texreg::texreg` [@texreg] functions. We illustrate this task using the epileptic seizures data in 59 individuals randomized to the anti-epileptic drug progabide or placebo [@thall1990some]. For each patient, the number of epileptic seizures was recorded during a baseline period of 8 weeks, and then for 4 consecutive 2-week periods post-randomization. 

<br>


# The Models

Let $Y_{ij}$ be the number of seizures on patient $i$ during period $j$ for $i=1,\ldots, 59$ and $j=0,1,2,3,4$, and $T_j$ is the observation time during period $j$, for $j=0,1,2,3,4$ with $T_0=8 \textrm{ weeks}$ and $T_j=2\textrm{ weeks}$ for $j=1,2,3,4$.   



## GLM

The response model is $Y_{ij}|\boldsymbol{\beta},\mu_{ij} \sim_{ind} \textrm{Poisson}(\mu_{ij})$ with
\begin{align}
\log \left(\mu_{ij} \right)  = &\log(T_{j}) + \beta_0 + \beta_1 \cdot  \mathbf{1}_{\left\lbrace \textrm{progabide} \right\rbrace }(\mbox{treatment}_{i}) + \nonumber \\ 
& \beta_2 \cdot  \mathbf{1}_{\left\lbrace \textrm{post} \right\rbrace }(\mbox{randomization}_{i}) + \nonumber \\ 
& \beta_3 \cdot \mathbf{1}_{\left\lbrace \textrm{progabide} \right\rbrace }(\mbox{treatment}_{i})  \times \mathbf{1}_{\left\lbrace \textrm{post} \right\rbrace }(\mbox{randomization}_{i})   \label{eq:eq1}
\end{align}


## GLMM

We consider the following two-stage model [@wakefield2013bayesian]:\\
\textit{Stage One}: The response model is $Y_{ij}|\boldsymbol{\beta},\mu_{ij},b_i \sim_{ind} \textrm{Poisson}(\mu_{ij})$ with
\begin{align}
\log \left(\mu_{ij} \right)  = &\log(T_{j}) + \beta_0 + \beta_1 \cdot  \mathbf{1}_{\left\lbrace \textrm{progabide} \right\rbrace }(\mbox{treatment}_{i}) + \nonumber \\ 
& \beta_2 \cdot  \mathbf{1}_{\left\lbrace \textrm{post} \right\rbrace }(\mbox{randomization}_{i}) + \nonumber \\ 
& \beta_3 \cdot \mathbf{1}_{\left\lbrace \textrm{progabide} \right\rbrace }(\mbox{treatment}_{i})  \times \mathbf{1}_{\left\lbrace \textrm{post} \right\rbrace }(\mbox{randomization}_{i}) + b_i  \label{eq:eq2}
\end{align}

\textit{Stage Two}: The random effects model is $b_i\, |\, \sigma_0^2 \sim_{iid} \mathcal{N}(0,\sigma_0^2)$.

## GEE

Marginal mean is given by~\eqref{eq:eq1}, and variance model $var(Y_{ij}) = \alpha \mu_{ij}$. We consider various forms for the working correlation.


# Results




<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<table cellspacing="0" align="center" style="border: none;">
<caption align="bottom" style="margin-top:0.3em;">Comparing model estimates</caption>
<tr>
<th style="text-align: left; border-top: 2px solid black; border-bottom: 1px solid black; padding-right: 12px;"><b></b></th>
<th style="text-align: left; border-top: 2px solid black; border-bottom: 1px solid black; padding-right: 12px;"><b>GLM</b></th>
<th style="text-align: left; border-top: 2px solid black; border-bottom: 1px solid black; padding-right: 12px;"><b>GLMM</b></th>
<th style="text-align: left; border-top: 2px solid black; border-bottom: 1px solid black; padding-right: 12px;"><b>GEE Ind</b></th>
<th style="text-align: left; border-top: 2px solid black; border-bottom: 1px solid black; padding-right: 12px;"><b>GEE Unst.</b></th>
<th style="text-align: left; border-top: 2px solid black; border-bottom: 1px solid black; padding-right: 12px;"><b>GEE Ex.</b></th>
<th style="text-align: left; border-top: 2px solid black; border-bottom: 1px solid black; padding-right: 12px;"><b>GEE AR1</b></th>
</tr>
<tr>
<td style="padding-right: 12px; border: none;">$\beta_0$</td>
<td style="padding-right: 12px; border: none;"><b>1.35</b> (0.03)<sup style="vertical-align: 0px;">***</sup></td>
<td style="padding-right: 12px; border: none;"><b>1.03</b> (0.15)<sup style="vertical-align: 0px;">***</sup></td>
<td style="padding-right: 12px; border: none;"><b>1.35</b> (0.16)<sup style="vertical-align: 0px;">***</sup></td>
<td style="padding-right: 12px; border: none;">1.15 (1.64)</td>
<td style="padding-right: 12px; border: none;"><b>1.35</b> (0.16)<sup style="vertical-align: 0px;">***</sup></td>
<td style="padding-right: 12px; border: none;"><b>1.31</b> (0.16)<sup style="vertical-align: 0px;">***</sup></td>
</tr>
<tr>
<td style="padding-right: 12px; border: none;">$\beta_1$</td>
<td style="padding-right: 12px; border: none;">0.03 (0.05)</td>
<td style="padding-right: 12px; border: none;">-0.02 (0.21)</td>
<td style="padding-right: 12px; border: none;">0.03 (0.22)</td>
<td style="padding-right: 12px; border: none;">-0.14 (2.06)</td>
<td style="padding-right: 12px; border: none;">0.03 (0.22)</td>
<td style="padding-right: 12px; border: none;">0.02 (0.21)</td>
</tr>
<tr>
<td style="padding-right: 12px; border: none;">$\beta_2$</td>
<td style="padding-right: 12px; border: none;"><b>0.11</b> (0.05)<sup style="vertical-align: 0px;">*</sup></td>
<td style="padding-right: 12px; border: none;"><b>0.11</b> (0.05)<sup style="vertical-align: 0px;">*</sup></td>
<td style="padding-right: 12px; border: none;">0.11 (0.12)</td>
<td style="padding-right: 12px; border: none;">-0.06 (0.50)</td>
<td style="padding-right: 12px; border: none;">0.11 (0.12)</td>
<td style="padding-right: 12px; border: none;">0.16 (0.11)</td>
</tr>
<tr>
<td style="padding-right: 12px; border: none;">$\beta_3$</td>
<td style="padding-right: 12px; border: none;">-0.10 (0.07)</td>
<td style="padding-right: 12px; border: none;">-0.10 (0.06)</td>
<td style="padding-right: 12px; border: none;">-0.10 (0.21)</td>
<td style="padding-right: 12px; border: none;">0.13 (0.83)</td>
<td style="padding-right: 12px; border: none;">-0.10 (0.21)</td>
<td style="padding-right: 12px; border: none;">-0.13 (0.27)</td>
</tr>
<tr>
<td style="border-top: 1px solid black;">AIC</td>
<td style="border-top: 1px solid black;">4643.05</td>
<td style="border-top: 1px solid black;">2030.67</td>
<td style="border-top: 1px solid black;"></td>
<td style="border-top: 1px solid black;"></td>
<td style="border-top: 1px solid black;"></td>
<td style="border-top: 1px solid black;"></td>
</tr>
<tr>
<td style="padding-right: 12px; border: none;">BIC</td>
<td style="padding-right: 12px; border: none;">4657.80</td>
<td style="padding-right: 12px; border: none;">2049.11</td>
<td style="padding-right: 12px; border: none;"></td>
<td style="padding-right: 12px; border: none;"></td>
<td style="padding-right: 12px; border: none;"></td>
<td style="padding-right: 12px; border: none;"></td>
</tr>
<tr>
<td style="padding-right: 12px; border: none;">Log Likelihood</td>
<td style="padding-right: 12px; border: none;">-2317.53</td>
<td style="padding-right: 12px; border: none;">-1010.34</td>
<td style="padding-right: 12px; border: none;"></td>
<td style="padding-right: 12px; border: none;"></td>
<td style="padding-right: 12px; border: none;"></td>
<td style="padding-right: 12px; border: none;"></td>
</tr>
<tr>
<td style="padding-right: 12px; border: none;">Deviance</td>
<td style="padding-right: 12px; border: none;">3574.07</td>
<td style="padding-right: 12px; border: none;"></td>
<td style="padding-right: 12px; border: none;"></td>
<td style="padding-right: 12px; border: none;"></td>
<td style="padding-right: 12px; border: none;"></td>
<td style="padding-right: 12px; border: none;"></td>
</tr>
<tr>
<td style="padding-right: 12px; border: none;">Num. obs.</td>
<td style="padding-right: 12px; border: none;">295</td>
<td style="padding-right: 12px; border: none;">295</td>
<td style="padding-right: 12px; border: none;">295</td>
<td style="padding-right: 12px; border: none;">295</td>
<td style="padding-right: 12px; border: none;">295</td>
<td style="padding-right: 12px; border: none;">295</td>
</tr>
<tr>
<td style="padding-right: 12px; border: none;">Num. groups: subject</td>
<td style="padding-right: 12px; border: none;"></td>
<td style="padding-right: 12px; border: none;">59</td>
<td style="padding-right: 12px; border: none;"></td>
<td style="padding-right: 12px; border: none;"></td>
<td style="padding-right: 12px; border: none;"></td>
<td style="padding-right: 12px; border: none;"></td>
</tr>
<tr>
<td style="padding-right: 12px; border: none;">Var: subject (Intercept)</td>
<td style="padding-right: 12px; border: none;"></td>
<td style="padding-right: 12px; border: none;">0.61</td>
<td style="padding-right: 12px; border: none;"></td>
<td style="padding-right: 12px; border: none;"></td>
<td style="padding-right: 12px; border: none;"></td>
<td style="padding-right: 12px; border: none;"></td>
</tr>
<tr>
<td style="border-bottom: 2px solid black;">Num. clust.</td>
<td style="border-bottom: 2px solid black;"></td>
<td style="border-bottom: 2px solid black;"></td>
<td style="border-bottom: 2px solid black;">59</td>
<td style="border-bottom: 2px solid black;">59</td>
<td style="border-bottom: 2px solid black;">59</td>
<td style="border-bottom: 2px solid black;">59</td>
</tr>
<tr>
<td style="padding-right: 12px; border: none;" colspan="8"><span style="font-size:0.8em"><sup style="vertical-align: 0px;">***</sup>p &lt; 0.001, <sup style="vertical-align: 0px;">**</sup>p &lt; 0.01, <sup style="vertical-align: 0px;">*</sup>p &lt; 0.05</span></td>
</tr>
</table>
<table style="border-collapse:collapse; border:none;">
<tr>
<th style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm;  text-align:left; ">&nbsp;</th>
<th colspan="3" style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm; ">y</th>
</tr>
<tr>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  text-align:left; ">Predictors</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">Incidence Rate Ratios</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">CI</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">p</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">(Intercept)</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">2.81</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">2.08&nbsp;&ndash;&nbsp;3.79</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">progabide</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.98</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.65&nbsp;&ndash;&nbsp;1.47</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.907</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">post</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">1.11</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">1.02&nbsp;&ndash;&nbsp;1.22</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.020</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">trtprogabide:post</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.90</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.80&nbsp;&ndash;&nbsp;1.03</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.117</td>
</tr>
<tr>
<td colspan="4" style="font-weight:bold; text-align:left; padding-top:.8em;">Random Effects</td>
</tr>

<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">&sigma;<sup>2</sup></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">0.30</td>

<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">&tau;<sub>00</sub> <sub>subject</sub></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">0.61</td>

<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">ICC <sub>subject</sub></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">0.67</td>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm; border-top:1px solid;">Observations</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left; border-top:1px solid;" colspan="3">295</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">Marginal R<sup>2</sup> / Conditional R<sup>2</sup></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">0.004 / 0.671</td>
</tr>

</table>



<br>



# Code {-}


```r
if (!require("pacman")) install.packages("pacman")
pacman::p_load(knitr, here)  # needed for filepaths

options(width = 60, digits = 2)
set.seed(45)
opts_chunk$set(echo = FALSE, tidy = TRUE, cache = FALSE, warning = FALSE, 
    message = FALSE)
opts_template$set(fig.large = list(fig.width = 7, fig.height = 5, 
    fig.align = "center", fig.pos = "H"), fig.small = list(fig.width = 6, 
    fig.height = 4, fig.align = "center", fig.pos = "H"), fig.full = list(fig.width = 8, 
    fig.height = 6, fig.align = "center", fig.pos = "H"))
opts_knit$set(eval.after = "fig.cap")  # for captions to be evaluated after R objects are available 

knitr::read_chunk(here::here("R", "003-packages.R"))
knitr::read_chunk(here::here("R", "003-seizure-rct-code.R"))
knitr::read_chunk(here::here("R", "003-texreg-geepack.R"))
print(sessionInfo(), locale = FALSE)
if (!require("pacman")) install.packages("pacman")

pacman::p_load(knitr, here, texreg, xtable, MASS, dplyr, data.table, 
    bookdown, geepack, lme4)
##################################### R Source code for seizure data Created: May 13, 2019
##################################### Updated: NOTES:you need the custom extract function defined
##################################### in 003-texreg-package.R for this code to work
data("epil")  # from MASS library
DT <- epil %>% as.data.table
DT.base <- DT %>% distinct(subject, .keep_all = TRUE)
DT.base[, `:=`(period = 0, y = base)]
DT.epil <- rbind(DT, DT.base)
setkey(DT.epil, subject, period)
DT.epil[, `:=`(post = as.numeric(period > 0), tj = ifelse(period == 
    0, 8, 2))]
fit.glm <- glm(y ~ trt * post, data = DT.epil, family = "poisson", 
    offset = log(tj))

fit.glmm <- lme4::glmer(y ~ trt * post + (1 | subject), data = DT.epil, 
    family = "poisson", offset = log(tj))

fit.gee.ind <- geepack::geeglm(y ~ trt * post, id = subject, 
    offset = log(tj), data = DT.epil, family = "poisson", corstr = "independence")

fit.gee.ex <- geepack::geeglm(y ~ trt * post, id = subject, offset = log(tj), 
    data = DT.epil, family = "poisson", corstr = "exchangeable")

fit.gee.unst <- geepack::geeglm(y ~ trt * post, id = subject, 
    offset = log(tj), data = DT.epil, family = "poisson", corstr = "unstructured")

fit.gee.ar1 <- geepack::geeglm(y ~ trt * post, id = subject, 
    offset = log(tj), data = DT.epil, family = "poisson", corstr = "ar1")

texreg::texreg(list(fit.glm, fit.glmm, fit.gee.ind, fit.gee.unst, 
    fit.gee.ex, fit.gee.ar1), custom.model.names = c("GLM", "GLMM", 
    "GEE Ind", "GEE Unst.", "GEE Ex.", "GEE AR1"), custom.coef.names = c("$\\beta_0$", 
    "$\\beta_1$", "$\\beta_2$", "$\\beta_3$"), fontsize = "scriptsize", 
    caption = "Comparing model estimates", single.row = T, bold = 0.05, 
    float.pos = "H")
fit.glm <- glm(y ~ trt * post, data = DT.epil, family = "poisson", 
    offset = log(tj))

fit.glmm <- lme4::glmer(y ~ trt * post + (1 | subject), data = DT.epil, 
    family = "poisson", offset = log(tj))

fit.gee.ind <- geepack::geeglm(y ~ trt * post, id = subject, 
    offset = log(tj), data = DT.epil, family = "poisson", corstr = "independence")

fit.gee.ex <- geepack::geeglm(y ~ trt * post, id = subject, offset = log(tj), 
    data = DT.epil, family = "poisson", corstr = "exchangeable")

fit.gee.unst <- geepack::geeglm(y ~ trt * post, id = subject, 
    offset = log(tj), data = DT.epil, family = "poisson", corstr = "unstructured")

fit.gee.ar1 <- geepack::geeglm(y ~ trt * post, id = subject, 
    offset = log(tj), data = DT.epil, family = "poisson", corstr = "ar1")

texreg::htmlreg(list(fit.glm, fit.glmm, fit.gee.ind, fit.gee.unst, 
    fit.gee.ex, fit.gee.ar1), custom.model.names = c("GLM", "GLMM", 
    "GEE Ind", "GEE Unst.", "GEE Ex.", "GEE AR1"), custom.coef.names = c("$\\beta_0$", 
    "$\\beta_1$", "$\\beta_2$", "$\\beta_3$"), caption = "Comparing model estimates", 
    single.row = T, bold = 0.05)

sjPlot::tab_model(fit.glmm)
extract.geepack <- function(model) {
    s <- summary(model)
    names <- rownames(s$coef)
    co <- s$coef[, 1]
    se <- s$coef[, 2]
    pval <- s$coef[, 4]
    
    n <- nrow(model.frame(model))
    nclust <- length(s$geese$clusz)
    
    gof = c(n, nclust)
    gof.names = c("Num. obs.", "Num. clust.")
    
    tr <- createTexreg(coef.names = names, coef = co, se = se, 
        pvalues = pval, gof.names = gof.names, gof = gof, gof.decimal = rep(FALSE, 
            length(gof)))
    return(tr)
}

setMethod("extract", signature = className("geeglm", "geepack"), 
    definition = extract.geepack)

## example from the geeglm documentation data(dietox)
## dietox$Cu <- as.factor(dietox$Cu) gee1 <- geeglm(Weight ~
## Cu * (Time + I(Time^2) + I(Time^3)), data = dietox, id =
## Pig, family = poisson('identity'), corstr='ar1') # What the
## heck are we fitting??  summary(gee1) screenreg(gee1)
## texreg(gee1)
```

# Session Information


```
## R version 3.6.0 (2019-04-26)
## Platform: x86_64-pc-linux-gnu (64-bit)
## Running under: Pop!_OS 18.10
## 
## Matrix products: default
## BLAS:   /usr/lib/x86_64-linux-gnu/blas/libblas.so.3.8.0
## LAPACK: /usr/lib/x86_64-linux-gnu/lapack/liblapack.so.3.8.0
## 
## attached base packages:
## [1] stats     graphics  grDevices utils     datasets 
## [6] methods   base     
## 
## other attached packages:
##  [1] lme4_1.1-20       Matrix_1.2-17     geepack_1.2-1    
##  [4] bookdown_0.9      data.table_1.12.0 dplyr_0.8.0.1    
##  [7] MASS_7.3-51.1     xtable_1.8-4      texreg_1.36.23   
## [10] here_0.1          knitr_1.22        pacman_0.5.0     
## 
## loaded via a namespace (and not attached):
##  [1] tidyr_0.8.2        splines_3.6.0     
##  [3] modelr_0.1.4       assertthat_0.2.1  
##  [5] stats4_3.6.0       coin_1.2-2        
##  [7] yaml_2.2.0         pillar_1.3.1      
##  [9] backports_1.1.3    lattice_0.20-38   
## [11] glue_1.3.1         digest_0.6.18     
## [13] glmmTMB_0.2.3      snakecase_0.9.2   
## [15] minqa_1.2.4        colorspace_1.4-0  
## [17] sandwich_2.5-0     psych_1.8.12      
## [19] htmltools_0.3.6    plyr_1.8.4        
## [21] pkgconfig_2.0.2    broom_0.5.1       
## [23] sjPlot_2.6.2       haven_2.1.0       
## [25] purrr_0.3.2        mvtnorm_1.0-8     
## [27] scales_1.0.0       stringdist_0.9.5.1
## [29] emmeans_1.3.2      tibble_2.1.1      
## [31] bayesplot_1.6.0    generics_0.0.2    
## [33] ggplot2_3.1.0      sjlabelled_1.0.16 
## [35] TH.data_1.0-10     TMB_1.7.15        
## [37] lazyeval_0.2.1     mnormt_1.5-5      
## [39] survival_2.43-3    magrittr_1.5      
## [41] crayon_1.3.4       estimability_1.3  
## [43] evaluate_0.13      nlme_3.1-139      
## [45] foreign_0.8-71     forcats_0.4.0     
## [47] tools_3.6.0        hms_0.4.2         
## [49] formatR_1.6        multcomp_1.4-8    
## [51] stringr_1.4.0      munsell_0.5.0     
## [53] prediction_0.3.6.2 ggeffects_0.8.0   
## [55] compiler_3.6.0     rlang_0.3.4       
## [57] grid_3.6.0         nloptr_1.2.1      
## [59] ggridges_0.5.1     rmarkdown_1.12    
## [61] gtable_0.2.0       codetools_0.2-16  
## [63] sjstats_0.17.3     sjmisc_2.7.7      
## [65] R6_2.4.0           zoo_1.8-4         
## [67] pwr_1.2-2          rprojroot_1.3-2   
## [69] modeltools_0.2-22  stringi_1.4.3     
## [71] parallel_3.6.0     Rcpp_1.0.1        
## [73] tidyselect_0.2.5   xfun_0.6          
## [75] coda_0.19-2
```


# References

