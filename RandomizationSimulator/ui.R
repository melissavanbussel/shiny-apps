# flip coin / random dice simulator 
library(shiny)

shinyUI(
  fluidPage(
    titlePanel("Coin Flip Simulator"),
    sidebarLayout(
      sidebarPanel(
        sliderInput("prob", "What is the probability of getting tails?", min = 0, max = 1, val = 0.5),
        sliderInput("obs", "How many times would you like to flip the coin?", min = 1, max = 1000, val = 10)
      ),
      mainPanel(
        plotOutput("plot"),
        htmlOutput("text"),
        helpText("Notice how the observed proportion is not necessarily the same as the probability distribution you sampled from.")
      )
    )
  )
)