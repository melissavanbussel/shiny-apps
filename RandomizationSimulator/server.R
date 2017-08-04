# flip coin / roll dice simulator 
library(shiny)

shinyServer(
  function(input, output) {
    
    answer <- reactive({
      rbinom(n = input$obs, size =1, prob = input$prob)
    })
    
    output$plot <- renderPlot({
      barplot(table(answer()), col = c("cadetblue3", "darkseagreen"), names.arg = c("Heads", "Tails"))
    })
    
    output$text <- renderUI({
      numheads <- length(which(answer() == 0))
      numtails <- length(which(answer() == 1))
      prophead <- numheads / input$obs
      proptails <- numtails / input$obs
      str1 <- paste("The number of heads is", numheads, sep = " ")
      str2 <- paste("The number of tails is", numtails, sep = " ")
      str3 <- paste("The probability of rolling a tails was", input$prob, sep = " ")
      str4 <- paste("The observed proportion of heads is", prophead, sep = " ")
      str5 <- paste("The observed proportion of tails is", proptails, sep = " ")
      HTML(paste(str1, str2, str3, str4, str5, sep = '<br/>'))
    })
  }
)