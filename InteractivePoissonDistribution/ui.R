library(shiny)

shinyUI(
  fluidPage(
    titlePanel("Interactive Poisson Distribution"),
    sidebarLayout(
      sidebarPanel(
        sliderInput("obs", "Select the number of observations", min = 1, max = 1000, val = 100),
        br(),
        sliderInput("lambda", "Select the value of lambda of the Poisson Disribution", min = 1, max = 10, val = 5),
        br(),
        radioButtons("colour", "Select the colour of the histogram or line drawing",
                     choices=c("Blue" = "cadetblue3",
                               "Purple" = "violet",
                               "Green" = "darkseagreen")), 
        downloadButton("down", "Download"),
        br(),
        helpText("Click the download button to download the data currently being shown")
      ),
      mainPanel(
        tabsetPanel(type = "tabs",
                    tabPanel("Histogram", plotOutput("plot")),
                    tabPanel("Line Drawing", plotOutput("line"), helpText("Note that the number of observations 
                                                                          no longer matters; this is simply displaying the 
                                                                          distribution with the specified lambda.")),
                    tabPanel("Summary", verbatimTextOutput("summary")),
                    tabPanel("Table of Generated Values", helpText("Notice how all the values are integers."),tableOutput("table")))
        
                    )
        )
    )
  )