library(ggplot2)
setwd("/Users/jason/Documents/projects/ODU/PHYS413/LAB-A/")
source("functions.R")
data <- read.table("Radiation Attenuation.txt", header = TRUE, sep = ",")
data$se <- apply(data,1,function(row) row[2]*.04)
data$ymin <- apply(data,1,function(row) log(row[2] - row[3]))
data$ymax <- apply(data,1,function(row) log(row[2] + row[3]))
data$ylog <- apply(data,1,function(row) log(row[2]))
attach(data)
fit  <- lm(ylog~x)
m <- summary(fit)
se <- m$sigma
se <- se + .04
limits <- aes(x = x, ymax = ymax, ymin=ymin)
bars <- geom_errorbar(limits, width=0.001)
#s <- stat_smooth(aes(x=x, y=y), se = TRUE)
#d <- ggplot(data) + geom_point(aes(x=x,y=y)) + scale_y_log10() + ggtitle("Attenuation of Radation by Iron") + xlab("Thickness (mm)") + ylab("Count Rate (counts per second)")
#d <- d + s + bars
#print(d)

a <- ggplotRegression(fit, "Attenuation of Radation by Iron", "Thickness (mm)", "ln(Count Rate (counts per second))", bars)
print(a)

