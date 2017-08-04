library(shiny)

shinyServer(
  function(input, output) {
    answer <- reactive({
      mean <- input$mean
      sd <- input$sd
      prob <- input$prob
      qnorm(p = prob, mean = mean, sd = sd)
    })
    
    output$zscore <- renderText({
      prob <- input$prob
      mean <- input$mean
      sd <- input$sd
      paste("The Z-score for probability ", prob, " with mean ", mean, " and SD ", sd, " is ", answer(), ".", sep = "")
    })
  }
)