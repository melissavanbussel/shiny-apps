library(shiny)

shinyUI(
  fluidPage(
    titlePanel("Z-Score Calculator"),
    sidebarLayout(
      sidebarPanel(
        sliderInput("mean", "Select the mean for the Normal Distribution", min = -10, max = 10, val = 0),
        br(),
        sliderInput("sd", "Select the standard deviation of the Normal Disribution", min = 0, max = 10, val = 1),
        br(),
        sliderInput("prob", "Select the probability you're interested in finding the Z-Score for", min = 0, max = 1, val = 0.05, step = 0.01)
      ),
      mainPanel(
        textOutput("zscore")
      )
    )
  )
)