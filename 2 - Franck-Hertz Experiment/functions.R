ggplotRegression <- function (fit, title, xlab, ylab, bars) {

	require(ggplot2)
	
	plot <- ggplot(fit$model, aes_string(x = names(fit$model)[2], y = names(fit$model)[1])) + 
  		geom_point() + ggtitle(title) + xlab(xlab) + ylab(ylab)
  		#stat_smooth(method = "lm", col = "red") + bars
                     
	return(plot)
}