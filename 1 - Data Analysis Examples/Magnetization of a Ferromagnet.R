library(ggplot2)
library(stats)
setwd("/Users/jason/Documents/projects/ODU/PHYS413/1 - Data Analysis Examples/")
source("functions.R")
data <- read.table("Magnetization of a Ferromagnet.txt", header = TRUE, sep = ",")
data$z <- apply(data,1,function(row) (row[1])^2)
data$se <- apply(data,1,function(row) row[2]*.001)
data$ymin <- apply(data,1,function(row) row[2] - row[4])
data$ymax <- apply(data,1,function(row) row[2] + row[4])
attach(data)
#M =  M0 [1-1/(T/TC)2]
fit  <- lm(y ~ z)

limits <- aes(x = z, ymax = ymax, ymin = ymin)
bars <- geom_errorbar(limits, width=25000)

a <- ggplotRegression(fit, "Magnetization of Ferromagnet", "Temperature Squared (K^2)", "Magnetization (Gauss)", bars)
print(a)
