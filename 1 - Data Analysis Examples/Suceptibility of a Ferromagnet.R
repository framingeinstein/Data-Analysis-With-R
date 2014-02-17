library(ggplot2)
library(stats)
setwd("/Users/jason/Documents/projects/ODU/PHYS413/LAB-A/")
source("functions.R")
data <- read.table("Susceptibility of a Ferromagnet.txt", header = TRUE, sep = ",")
data$z <- apply(data,1,function(row) 1/row[2])
data$se <- apply(data,1,function(row) row[2]*.04)
data$ymin <- apply(data,1,function(row) 1/(row[2] - row[4]))
data$ymax <- apply(data,1,function(row) 1/(row[2] + row[4]))

attach(data)

fit  <- lm(z ~ x)

limits <- aes(x = x, ymax = ymax, ymin = ymin)
bars <- geom_errorbar(limits, width=7)

a <- ggplotRegression(fit, "Suceptibility of Ferromagnet", "Temperature (K)", "Suceptibility", bars)
print(a)

