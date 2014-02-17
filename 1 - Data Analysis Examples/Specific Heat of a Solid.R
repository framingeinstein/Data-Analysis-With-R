library(ggplot2)
library(stats)
setwd("/Users/jason/Documents/projects/ODU/PHYS413/LAB-A/")
source("functions.R")
data <- read.table("Specific Heat of a Solid.txt", header = TRUE, sep = ",")
data$z <- apply(data,1,function(row) row[1]^3)
data$se <- apply(data,1,function(row) row[2]*.04)
data$ymin <- apply(data,1,function(row) row[2] - row[4])
data$ymax <- apply(data,1,function(row) row[2] + row[4])

attach(data)
#CV = 12/5  (π)4 R (T/TD)3
fit  <- lm(y ~ z -1)

limits <- aes(x = z, ymax = ymax, ymin = ymin)
bars <- geom_errorbar(limits, width=100)

a <- ggplotRegression(fit, "Specific Heat of a Solid", "Temperature (K)", "Cv", bars)
print(a)

