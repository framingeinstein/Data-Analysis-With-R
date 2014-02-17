library(ggplot2)
library(stats)
setwd("/Users/jason/Documents/projects/ODU/PHYS413/2 - Franck-Hertz Experiment/")
source("functions.R")
data <- read.table("Franck-Hertz.txt", header = TRUE, sep = ",")
data$z <- apply(data,1,function(row) (-1*row[1]))
data$se <- apply(data,1,function(row) row[2]*.001)
data$ymin <- apply(data,1,function(row) row[2] - row[4])
data$ymax <- apply(data,1,function(row) row[2] + row[4])
attach(data)

#s <- stat_smooth(aes(x=z, y=y), se = TRUE)
#d <- ggplot(data) + geom_point(aes(x=z,y=y)) + ggtitle("Franck Hertz") + xlab("Ua (V)") + ylab("Uy (V)")
#d <- d + s #+ bars
#print(d)

#M =  M0 [1-1/(T/TC)2]
fit  <- lm(y ~ z)

limits <- aes(x = z, ymax = ymax, ymin = ymin)
bars <- geom_errorbar(limits, width=0)

a <- ggplotRegression(fit, "Magnetization of Ferromagnet", "Temperature Squared (K^2)", "Magnetization (Gauss)", bars)
print(a)
