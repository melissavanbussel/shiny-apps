library(shiny)

function(input, output) {
  
  answer <- reactive({
    a <- input$a
    mean <- input$mean
    sd <- input$sd
    type <- input$type
    if (type == 1) {
      pnorm(q = a, mean = mean, sd = sd)
    } else {
      if (type == 2) {
        1 - pnorm(q = a, mean = mean, sd = sd)
      } else {
        if (type == 3) {
          if (a >= 0) {
            pnorm(q = -a, mean = mean, sd = sd)*2
          } else {
            pnorm(q = a, mean = mean, sd = sd)*2
          }
        } else {
          if (type == 4) {
            if (a >= 0) {
              1 - pnorm(-a)*2
            }
            else {
              1 - pnorm(a)*2
            }
          }
        }
      }
    }
  })
  
  output$plot <- renderPlot({
    mean <- input$mean
    sd <- input$sd
    col <- input$colour
    x <- seq(-4, 4, length = 1000)*sd + mean 
    y <- dnorm(x, mean, sd)
    type <- input$type
    a <- input$a
    if (type == 1) {
      lb <- input$a
      i <- x <= lb
      plot(x, y, type = "n", xlim = c(-15, 15), ylim = c(0.01, 0.4), main = paste("Normal distribution with mean",
                                                                                   mean, "and SD", sd, sep = " "), ylab = "", xlab = "")
      lines(x, y)
      polygon(c(lb,x[i]), c(0,y[i]), col=col) 
    } else {
      if (type == 2) {
        ub <- input$a
        i <- x >= ub
        plot(x, y, type = "n", xlim = c(-15, 15), ylim = c(0.01, 0.4), main = paste("Normal distribution with mean",
                                                                                     mean, "and SD", sd, sep = " "), ylab = "", xlab = "")
        lines(x, y)
        polygon(c(x[i], ub), c(y[i], 0), col=col) 
      } else {
        if (type == 3) {
          if (a >= 0) {
            lb <- input$a*-1
            ub <- input$a
            i <- x <= lb
            j <- x >= ub
            plot(x, y, type = "n", xlim = c(-15, 15), ylim = c(0.01, 0.4), main = paste("Normal distribution with mean",
                                                                                        mean, "and SD", sd, sep = " "), ylab = "", xlab = "")
            lines(x, y)
            polygon(c(lb,x[i]), c(0,y[i]), col=col)
            polygon(c(x[j], ub), c(y[j], 0), col=col)
          } else {
            lb <- input$a
            ub <- input$a*-1
            i <- x <= lb
            j <- x >= ub
            plot(x, y, type = "n", xlim = c(-15, 15), ylim = c(0.01, 0.4), main = paste("Normal distribution with mean",
                                                                                        mean, "and SD", sd, sep = " "), ylab = "", xlab = "")
            lines(x, y)
            polygon(c(lb,x[i]), c(0,y[i]), col=col)
            polygon(c(x[j], ub), c(y[j], 0), col=col)
          }
        } else {
          if (type == 4) {
            if (a <= 0) {
              ub <- input$a 
              lb <- input$a*-1 
              i <- x >= ub & x <= lb
              plot(x, y, type = "n", xlim = c(-15, 15), ylim = c(0.01, 0.4), main = paste("Normal distribution with mean",
                                                                                          mean, "and SD", sd, sep = " "), ylab = "", xlab = "")
              lines(x, y)
              polygon(c(ub, x[i], lb), c(0, y[i], 0), col=col) 
            } else {
              ub <- input$a*-1 
              lb <- input$a 
              i <- x >= ub & x <= lb
              plot(x, y, type = "n", xlim = c(-15, 15), ylim = c(0.01, 0.4), main = paste("Normal distribution with mean",
                                                                                          mean, "and SD", sd, sep = " "), ylab = "", xlab = "")
              lines(x, y)
              polygon(c(ub, x[i], lb), c(0, y[i], 0), col=col) 
            }
          }
        }
      }
    }
  })
  
  output$answer <- renderText({
    type <- input$type
    mean <- input$mean
    sd <- input$sd
    a <- input$a
    
    if (type == 1) {
      paste("The probability of X being less than ", input$a, " is ", answer(), "," , " when the mean is ", mean, " and the SD is ", sd, sep = "")
    } else {
      if (type == 2) {
        paste("The probabiltiy of X being greater than ", input$a, " is ", answer(), ",", " when the mean is ", mean, " and the SD is ", sd, sep = "")
      } else {
        if (type == 3) {
          if (a >= 0) {
            paste("The probability of X being greater than ", input$a*-1, " or greater than ", input$a, " is ", answer(), ",", " when the mean is ", mean, " and the SD is ", sd, sep = "")
          }  else {
            paste("The probability of X being greater than ", input$a, " or greater than ", input$a*-1, " is ", answer(), ",", " when the mean is ", mean, " and the SD is ", sd, sep = "")
          }
        } else {
          if (type == 4) {
            if (a >= 0) {
              paste("The probability of X being between ", input$a*-1, " and ", input$a, " is ", answer(), ",", " when the mean is ", mean, " and the SD is ", sd, sep = "")
            } else {
              paste("The probability of X being between ", input$a, " and ", input$a*-1, " is ", answer(), ",", " when the mean is ", mean, " and the SD is ", sd, sep = "")
            }
          }
        }
      }
    }
  })
  
output$prob <- reactive({
  type <- input$type
  a <- input$a
  if (type == 1) {
    paste("P(X < ", input$a, ") = ", answer(), sep = "")
  } else {
    if (type == 2) {
      paste("P(X > ", input$a, ") = ", answer(), sep = "")
    } else {
      if (type == 3) {
        if (a >= 0) {
          paste("P(X < ", input$a*-1, " or X > ", input$a, ") = ", answer(), sep ="")
        } else {
          paste("P(X < ", input$a, " or X > ", input$a*-1, ") = ", answer(), sep ="")
        }
      } else {
        if (type == 4) {
          if (a >= 0) {
            paste("P(X > ", input$a*-1, " or X < ", input$a, ") = ", answer(), sep ="")
          } else {
            paste("P(X > ", input$a, " or X < ", input$a*-1, ") = ", answer(), sep ="")
          }
        }
      }
    }
  }
})  
  
}