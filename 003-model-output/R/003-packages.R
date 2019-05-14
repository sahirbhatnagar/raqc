## ---- required-packages ----

getPckg <- function(pckg) install.packages(pckg, repos = "http://cran.r-project.org")

if (!require("pacman")) install.packages("pacman")

pacman::p_load(knitr, here, texreg, xtable, MASS, dplyr, data.table, bookdown, geepack, lme4)


