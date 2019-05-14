#########################################################
# R Source code file for required packages
# for 002-minimum-working-example.Rmd/Rnw
# Hosted on github repo 'sahirbhatnagar/raqc'
# Author: Sahir Bhatnagar
# Created: May 31, 2018
# Updated: 
# Notes: we use pacman to install packages. p_load will
# check if the package is installed, install and load it
#########################################################

## ---- required-packages ----

if (!require("pacman")) install.packages("pacman")

pacman::p_load(knitr, here, xtable, dplyr, data.table, bookdown)

## ---- dont-run ----

head(mtcars)

