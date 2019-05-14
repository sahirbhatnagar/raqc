#########################################################
# R Source code file for analysis
# for 001-motivating-example.Rmd. 
# Hosted on github repo 'sahirbhatnagar/CSSC2018'
# Author: Sahir Bhatnagar
# Created: May 31, 2018
# Updated: 
# Notes: 
#########################################################


## ---- pairs ----
graphics::pairs(~ pbf1 + age + weight + neck + abdomen + forearm + 
                  wrist, data = DT, main = "Simple Scatterplot Matrix of Fat data")

## ---- fit1 ----
fit1 <- lm(pbf1 ~ ., data = DT)

## ---- linear-regression ----
texreg::texreg(fit1, digits=2, caption='Multiple Linear Regression of the Body Fat Data', label = "tab:results", 
               booktabs = TRUE, dcolumn = TRUE, single.row = TRUE, use.packages = FALSE)


## ---- fit1-coef ----
# print results to a table
sjPlot::tab_model(fit1, dv.labels = "Percentage Body Fat")

## ---- fit1-plot ----
# plot coefficients
sjPlot::plot_model(fit1, type = "est")


## ---- diagnostics ----
par(mfrow=c(2,2))
plot(fit1)

## ---- fit1-pred ----
sjPlot::plot_model(fit1, type = "pred")

## ---- influence-plot ----
car::influencePlot(fit1)


## ---- fit2 ----
DT2 <- DT[-c(42), , ]
fit2 <- lm(pbf1~., data = DT2)


## ---- compare-fits ----
sjPlot::tab_model(fit1, fit2, 
                  dv.labels = c("With obs. 42","Without obs. 42"),
                  p.style = "numeric")


## ---- linear-regression2 ----
texreg::texreg(list(fit1,fit2), digits=2,custom.model.names = c("With obs. 42","Without obs. 42"), 
               caption='Sensitivity analsysis; Multiple Linear Regression of the Body Fat Data', 
               label = "tab:results2", booktabs = TRUE, dcolumn = TRUE, single.row = TRUE, use.packages = FALSE)

## ---- fig-diagnostics2 ----
par(mfrow=c(2,2))
plot(fit2)

## ---- influence-plot2 ----
car::influencePlot(fit2)
