library(shiny)

shinyUI(
  fluidPage(
  titlePanel("Interactive Normal Distribution"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("obs", "Select the number of observations", min = 1, max = 1000, val = 100),
      br(),
      sliderInput("mean", "Select the mean for the Normal Distribution", min = -10, max = 10, val = 0),
      br(),
      sliderInput("sd", "Select the standard deviation of the Normal Disribution", min = 0, max = 10, val = 1),
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
                                                                        distribution with the specified mean and SD.")),
                  tabPanel("Summary", verbatimTextOutput("summary")),
                  tabPanel("Table of Generated Values", tableOutput("table")))
      
    )
  )
)
)