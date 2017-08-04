# explore correlation coefficients 
library(shiny)

shinyServer(
  function(input, output) {
    output$plot <- renderPlot({
      xvar <- input$xvar
      yvar <- input$yvar
      cor <- cor(mtcars[,xvar], mtcars[,yvar])
      plot(mtcars[,xvar], mtcars[,yvar], xlab = xvar, ylab = yvar, main = paste(
        "r = ", cor, ", R-Squared = ", cor^2, sep = ""
      ), pch = 19, col = "darkseagreen")
      abline(lm(mtcars[,yvar] ~ mtcars[,xvar]))
    })

    output$str <- renderPrint({
      str(iris)
      
    })
  }
)