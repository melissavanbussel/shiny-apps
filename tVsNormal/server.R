# t vs normal 
library(shiny)

shinyServer(
  function(input, output) {
    output$plot <- renderPlot({
      dfchisq <- input$dfchisq
      dt <- input$dft
      lambda <- input$lambda
      x <- seq(-10, 10, length = 1000)
      y <- dnorm(x, mean = 0, sd = 1)
      chi <- dchisq(x, df = dfchisq)
      t <- dt(x, df = dt)
      xpois <- seq(1:200)
      plot(x, y, type = "n", xlim = c(-4, 10), ylim = c(0.01, 0.45), main = "Common Distributions plotted on top of one another", ylab = "P(X)", xlab = "X")
      lines(x, y, col = "black", lwd = 2)
      lines(x, chi, col = "darkseagreen", lwd = 2)
      lines(x, t, col = "coral1", lwd = 2)
      lines(dpois(xpois, lambda), col = "purple", lwd = 2)
      par(mar=c(5.1, 4.1, 4.1, 8.1), xpd=TRUE)
      legend("topright", inset=c(-0.2,0), legend=c("A","B"), pch=c(1,3), title="Group")
      #legend(x = 1, y =95, legend = c("Normal", "Chi-Square", "t", "Poisson"), col = c("black", "darkseagreen", "coral1", "violet"), lwd = c(2,2,2,2))
    })
    
    output$text <- renderUI({
      str1 <- paste("The Normal Distribution is the most widely used distribution.
                    It is also known as the Gaussian distribution, or bell curve. A Normal Distribution
                    takes two parameters: mean and standard deviation. When the mean is equal to zero
                    and the standard deviation is equal to one, the curve is known as the Standard Normal Distribution.
                    A real-world example where a Normal Distribution is used is the IQ test. This normal distribution has a mean
                    of 100 and a standard deviation of 15. Therefore, the average score is 100, and approximately 95% of people have scores between
                    70 and 130.")
      str2 <- paste("")
      str3 <- paste("The t-Distribution is also commonly known as the Student's t-Distribution. It is a continuous probability distribution, 
                    and it is used to estimate parameters when the sample size is small and/or the population standard deviation is unknown.")
      str4 <- paste("")
      str5 <- paste("The Chi-Squared Distribution is often used in goodness of fit tests, or in tests for independence using contingency tables.
                    The Chi-Squared Distribution takes one parameter: degrees of freedom. A real world example where the Chi-Squared Distriubtion is used
                    is in Mendelian genetics: you can perform a Chi-Squared test to determine whether or not some sample data fits the 9:3:3:1 ratio.")
      str6 <- paste("")
      str7 <- paste("The Poisson distribution is a discrete probability distribution, hence why it looks so choppy on the plot.
                    This means that Poisson random variables can only take on integer values. The Poisson Distribution takes one
                    parameter: lambda. A real-world example where the Poisson Distribution is used is in physics: physicists can use a 
                    device called a scintillation counter to count the number of gamma rays emitted by a radioactive source, such as Cesium-137,
                    in a given time interval. They repeat these counts many times, and then plot the counts per time interval as a function of 
                    time passed. The shape of the curve will resemble a Poisson Distribution. In fact, if you take physics courses at Trent,
                    you will have a chance to do this experiment yourself!")
      HTML(paste(str1, str2, str3, str4, str5, str6, str7, sep = '<br/>'))
      
    })
    
  }
)