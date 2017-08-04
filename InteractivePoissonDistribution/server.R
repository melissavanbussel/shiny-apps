library(shiny)

function(input, output) {
  
  data <- reactive({
    rpois(n = input$obs, lambda = input$lambda)
  })
  
  
  output$plot <- renderPlot({
    lambda <- input$lambda
    obs <- input$obs
    
    hist(data(), 
         main=paste("Poisson distribution with lambda", lambda, "with", obs, "observations", sep=" "), xlab = "Value of Random Variable", col = input$colour, xlim = c(0, 20))
  })
  
  output$line <- renderPlot({
    lambda <- input$lambda
    col <- input$colour
    plot(dpois(x=0:200, lambda), type = "l", xlim = c(0, 20), ylim = c(0, 0.45), main = paste("Poisson Distribution with lambda",
                                                                                 lambda, sep = " "), xlab = "X", ylab = "P(X)", col = input$colour)
  })
  
  output$summary <- renderPrint({
    summary(data())
  })
  
  output$table <- renderTable({
    data.frame(x=data())
  })
  
  output$down <- downloadHandler(
    filename = function() { 
      paste("poisson", "lambda", input$lambda,"n", input$obs, '.csv', sep='_')
    },
    content = function(file) {
      write.csv(data(), file)
    }
  )
}