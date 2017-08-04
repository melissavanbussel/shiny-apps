# interactive chisq distribution 
library(shiny)

function(input, output) {
  
  data <- reactive({
    rchisq(n = input$obs, df = input$df)
  })
  
  
  output$plot <- renderPlot({
    df <- input$df 
    obs <- input$obs
    
    hist(data(), 
         main=paste("Chi-Square distribution with", df, "df with", obs, "observations", sep=" "), xlab = "Value of Random Variable", col = input$colour, xlim = c(0, 20))
  })
  
  output$line <- renderPlot({
    df <- input$df
    col <- input$colour
    x <- seq(0, 20, length = 1000)
    y <- dchisq(x, df)
    plot(x, y, type = "l", xlim = c(0, 20), ylim = c(0.01, 0.45), main = paste("Chi-Square distribution with",
                                                                                 df, "df", sep = " "), ylab = "P(X)", xlab = "X")
    lines(x, y, col = col)
  })
  
  output$summary <- renderPrint({
    summary(data())
  })
  
  output$table <- renderTable({
    data.frame(x=data())
  })
  
  output$down <- downloadHandler(
    filename = function() { 
      paste("chisquare", "df", input$df, "n", input$obs, '.csv', sep='_')
    },
    content = function(file) {
      write.csv(data(), file)
    }
  )
}