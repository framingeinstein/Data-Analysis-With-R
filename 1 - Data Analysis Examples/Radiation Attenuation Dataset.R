library(ggplot2)
setwd("/Users/jason/Documents/projects/ODU/PHYS413/1 - Data Analysis Examples/")
source("functions.R")
data <- read.table("Beta Attenuation.key", header = TRUE, sep = ",")

attach(data)
fit  <- lm(ylog~x)
m <- summary(fit)
se <- m$sigma
se <- se + .04

data$se <- se
data$ymin <- apply(data,1,function(row) row[2] - row[3])
data$ymax <- apply(data,1,function(row) row[2] + row[3])
data$ylog <- apply(data,1,function(row) log(row[2]))
limits <- aes(x = x, ymax = ymax, ymin= ymin)
bars <- geom_errorbar(limits, width=0.005)
#s <- stat_smooth(aes(x=x, y=y), se = TRUE)
#d <- ggplot(data) + geom_point(aes(x=x,y=y)) + scale_y_log10() + ggtitle("Attenuation of Radation by Iron") + xlab("Thickness (mm)") + ylab("Count Rate (counts per second)")
#d <- d + s + bars
#print(d)

a <- ggplotRegression(fit, "", "Thickness (cm)", "ln(counts/s)", bars)
print(a)

