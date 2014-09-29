library(ggplot2)
library(stats)
setwd("/Users/jason/Documents/projects/ODU/PHYS413/Magnetic Torque/")
source("functions.R")
source("extrema.R")
data <- read.table("mag-tor-1.csv", header = TRUE, sep = ",")
attach(data)
fit  <- lm(y~x)
m <- summary(fit)
se <- m$sigma
#se <- se + .04
data$se <- se
data$ymin <- apply(data,1,function(row) row[2] - row[3])
data$ymax <- apply(data,1,function(row) row[2] + row[3])
data$ylog <- apply(data,1,function(row) log(row[2]))
attach(data)
limits <- aes(x = x, ymax = ymax, ymin=ymin)
bars <- geom_errorbar(limits, width=.00001)
#s <- stat_smooth(aes(x=x, y=y), se = TRUE)
#d <- ggplot(data) + geom_point(aes(x=x,y=y)) + scale_y_log10() + ggtitle("Attenuation of Radation by Iron") + xlab("Thickness (mm)") + ylab("Count Rate (counts per second)")
#d <- d + s + bars
#print(d)

a <- ggplotRegression(fit, "", "B(T)/L", expression(Omega), bars)
print(a)



