library(ggplot2)
library(stats)
setwd("/Users/jason/Documents/projects/ODU/PHYS413/2 - Franck-Hertz Experiment/")
source("functions.R")
source("extrema.R")
data <- read.table("Franck-Hertz-3.csv", header = TRUE, sep = ",")
#data$z <- apply(data,1,function(row) (row[1]))
#data$se <- apply(data,1,function(row) row[2]*.001)
#data$ymin <- apply(data,1,function(row) row[2] - row[4])
#data$ymax <- apply(data,1,function(row) row[2] + row[4])
attach(data)

#s <- stat_smooth(aes(x=z, y=y), se = TRUE)
#d <- ggplot(data) + geom_point(aes(x=z,y=y)) + ggtitle("Franck Hertz") + xlab("Ua (V)") + ylab("Uy (V)")
#d <- d + s #+ bars
#print(d)

#M =  M0 [1-1/(T/TC)2]
#fit  <- lm(y ~ z)

#limits <- aes(x = z, ymax = ymax, ymin = ymin)
#bars <- geom_errorbar(limits, width=0)
#a <- ggplotRegression(fit, "", "Voltage (V)", "Current (A)", bars)

#b <- findpeaks(Y, 20, X)
#print(a)

require(pastecs)

newdata <- subset(data, X > 20)
sm <- lowess(newdata$X, newdata$Y, f=0.05)
sm$X <- sm$x;
sm$Y <- sm$y;
ts_y<-ts(sm$y)
tp<-turnpoints(ts_y)
#plot
plot(sm)
points(sm$x[tp$tppos],sm$y[tp$tppos],col="red")

sm$se <- apply(sm,1,function(row) row[2] *.01)
sm$ymin <- apply(sm,1,function(row) row[2] - row[3])
sm$ymax <- apply(sm,1,function(row) row[2] + row[3])
limits <- aes(x = sm$x, ymax = ymax, ymin = ymin)
bars <- geom_errorbar(limits, width=1)


#print(a)




