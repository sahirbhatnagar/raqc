#########################################################
# R Source code file for required packages
# for 001-motivating-example.Rmd/Rnw
# Hosted on github repo 'sahirbhatnagar/raqc'
# Author: Sahir Bhatnagar
# Created: May 31, 2018
# Updated: 
# Notes: we use pacman to install packages. p_load will
# check if the package is installed, install and load it
#########################################################

## ---- required-packages ----

if (!require("pacman")) install.packages("pacman")

pacman::p_load(knitr)

# for easy location of files
pacman::p_load(here)

# data loading and manipulation
pacman::p_load(data.table)

# easy plotting and tables of regression output
pacman::p_load(sjPlot)
pacman::p_load(ggeffects)

# influencePlot
pacman::p_load(car)

# the pipe %>% 
pacman::p_load(magrittr)

# this allows you to use bookdown::html_document2 in the YAML 
# which allows for figure labelling and referencing
pacman::p_load(bookdown) 
