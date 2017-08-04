library(shiny)

function(input, output) {

  data <- reactive({
    dist <- switch(input$dist,
                   norm = rnorm,
                   unif = runif,
                   exp = rexp,
                   rnorm)
    dist(input$obs)
  })
  

  output$plot <- renderPlot({
    distrib <- switch(input$dist,
                      norm = "Normal",
                      unif = "Uniform",
                      exp = "Exponential",
                      "Normal")
    obs <- input$obs
    
    hist(data(), 
         main=paste(distrib, "distribution with", obs, "observations", sep=" "), xlab = "Value of Random Variable", col = input$colour)
  })
  
  output$summary <- renderPrint({
    summary(data())
  })
  
  output$table <- renderTable({
    data.frame(x=data())
  })
  
  output$down <- downloadHandler(
    filename = function() { 
      paste(input$dist, '.csv', sep='')
    },
    content = function(file) {
      write.csv(data(), file)
    }
  )
}