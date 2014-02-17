library(ggplot2)
library(stats)
setwd("/Users/jason/Documents/projects/ODU/PHYS413/LAB-A/")
source("functions.R")
data <- read.table("Specific Heat of a Metal.txt", header = TRUE, sep = ",")
data$z <- apply(data,1,function(row) row[1]^2)
data$se <- apply(data,1,function(row) row[2]*.04)
data$yaug <- apply(data,1,function(row) row[2] / row[1])
data$ymin <- apply(data,1,function(row) row[5] - row[4]/row[1])
data$ymax <- apply(data,1,function(row) row[5] + row[4]/row[1])
attach(data)
#CV = AT + BT3
fit  <- lm(yaug ~ z)

limits <- aes(x = z, ymax = ymax, ymin = ymin)
bars <- geom_errorbar(limits, width=5)

a <- ggplotRegression(fit, "Specific Heat of a Metal", "Temperature (K)", "Cv", bars)
print(a)

