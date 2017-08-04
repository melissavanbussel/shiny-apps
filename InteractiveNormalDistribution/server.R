library(shiny)

function(input, output) {
  
  data <- reactive({
    rnorm(n = input$obs, mean = input$mean, sd = input$sd)
  })
  
  
  output$plot <- renderPlot({
    mean <- input$mean
    sd <- input$sd
    obs <- input$obs
    
    hist(data(), 
         main=paste("Normal distribution with mean", mean, "and SD", sd, "with", obs, "observations", sep=" "), xlab = "Value of Random Variable", col = input$colour, xlim = c(-15, 15))
  })
  
  output$line <- renderPlot({
    mean <- input$mean
    sd <- input$sd
    col <- input$colour
    x <- seq(-4, 4, length = 1000)*sd + mean 
    y <- dnorm(x, mean, sd)
    plot(x, y, type = "n", xlim = c(-15, 15), ylim = c(0.01, 0.45), main = paste("Normal distribution with mean",
                                                                                 mean, "and SD", sd, sep = " "), ylab = "P(X)", xlab = "X")
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
      paste("normal", "mean", input$mean, "sd", input$sd, "n", input$obs, '.csv', sep='_')
    },
    content = function(file) {
      write.csv(data(), file)
    }
  )
}