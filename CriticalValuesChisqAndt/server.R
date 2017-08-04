library(shiny)

shinyServer(
  function(input, output) {
    answer <- reactive({
      dist <- input$dist
      df <- input$df
      tail <- input$tail
      prob <- input$prob
      if (dist == 1) {
        if (tail == 1) {
          qt(p = prob, df = df) 
        } else {
          qt(p = prob, df = df)*2 
        }
      } else {
          qchisq(p = prob, df = df)
      }
    })
    
    output$score <- renderText({
      prob <- input$prob
      dist <- input$dist
      df <- input$df
      tail <- input$tail
      if (dist == 1) {
        if (tail == 1) {
          paste("The critical t value for probability ", prob, " with ", df, " degrees of freedom ", " is ", answer(), ".", " Note that this is the area in the left tail.", sep = "")
        } else {
          paste("The critical t value for probability ", prob, " with ", df, " degrees of freedom ", " is ", answer(), ".", " Note that this is the area in two tails.", sep = "")
        }
      } else {
        paste("The critical chi-square value for probability ", prob, " with ", df, " degrees of freedom ", " is ", answer(), ".", " Note that this is the area to the left of the critical value.", sep = "")
      }
    })
    
    output$plot <- renderPlot({
      dist <- input$dist
      df <- input$df
      prob <- input$prob
      tail <- input$tail
      if (dist == 1) {
        if (tail == 1) {
          x <- seq(-4, 4, length = 100)
          y <- dt(x, 4)
          lb <- -2
          i <- x <= lb
          plot(x, y, xlab = "", ylab = "", type = "l", ylim = c(0, 0.4), ann = FALSE, xaxt = "n", yaxt ="n")
          polygon(c(lb, x[i]), c(0, y[i]), col = "cadetblue3")
        } else {
          x <- seq(-4, 4, length = 100)
          y <- dt(x, 4)
          lb <- -2
          ub <- 2
          i <- x <= lb 
          j <- x >= ub
          plot(x, y, xlab = "", ylab = "", type = "l", ylim = c(0, 0.4), ann = FALSE, xaxt = "n", yaxt = "n")
          polygon(c(lb,x[i]), c(0,y[i]), col="cadetblue3")
          polygon(c(x[j], ub), c(y[j], 0), col="cadetblue3")
        }
      } else {
        if (dist == 2) {
          x <- seq(0, 10, length = 100)
          y <- dchisq(x, 4)
          lb <- 2
          i <- x <= lb
          plot(x, y, xlab = "", ylab = "", ylim = c(0, 0.2), ann = FALSE, type = "l", xaxt = "n", yaxt = "n")
          polygon(c(lb, x[i]), c(0, y[i]), col = "cadetblue3")
        }
      }
    })
    
    
  }
  
 
  
  
)