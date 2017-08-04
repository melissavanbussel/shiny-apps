# interactive chisq distribution
library(shiny)

shinyUI(
  fluidPage(
    titlePanel("Interactive Chi-Square Distribution"),
    sidebarLayout(
      sidebarPanel(
        sliderInput("obs", "Select the number of observations", min = 1, max = 1000, val = 100),
        br(),
        sliderInput("df", "Select the degrees of freedom", min = 1, max = 100, val = 4),
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
                                                                          distribution with the specified degrees of freedom.")),
                    tabPanel("Summary", verbatimTextOutput("summary")),
                    tabPanel("Table of Generated Values", tableOutput("table")))
        
                    )
        )
    )
  )