library(shiny)

shinyUI(
  fluidPage(
    titlePanel("Normal Probability Calculator"),
    sidebarLayout(
      sidebarPanel(
        sliderInput("mean", "Select the mean of the Normal Distribution", min = -15, max = 15, val = 0, step = 0.1),
        br(),
        sliderInput("sd", "Select the SD of the Normal Disribution", min = 0.01, max = 20, val = 1, step = 0.1),
        br(),
        sliderInput("a", "Select the value of a", min = -20.0, max = 20.0, val = -1, step = 0.1),
        helpText("The value of a represents the cutoff value on the plot where the area is coloured in."),
        radioButtons("type", "Select the region you're interested in finding the area of", 
                     choices = c("Lower Tail" = 1, 
                                 "Upper Tail" = 2,
                                 "Two-Tailed" = 3,
                                 "Middle" = 4)),
        radioButtons("colour", "Select the colour of the filled-in region",
                     choices=c("Blue" = "cadetblue3",
                               "Purple" = "violet",
                               "Green" = "darkseagreen"))
      ),
      mainPanel(
          textOutput("answer"),
          plotOutput("plot"),
          textOutput("prob")
        )
    )
    )
  )