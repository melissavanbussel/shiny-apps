library(shiny)

fluidPage(
  titlePanel("Various Statistical Distributions"),
  sidebarLayout(
    sidebarPanel(
      radioButtons("dist", "Select a distribution type",
                   c("Normal" = "norm",
                     "Uniform" = "unif",
                     "Exponential" = "exp")),
      br(),
      sliderInput("obs", 
                  "Select the number of observations", 
                  value = 500,
                  min = 1, 
                  max = 1000),
      br(),
      radioButtons("colour", "Select a colour for the histogram",
                   choices = c("Blue" = "cadetblue3",
                               "Purple" = "violet" ,
                               "Green" = "darkseagreen")),
      br(),
      helpText("Note: The optional parameters in each distribution (such as mean) are defaulted to their
               default values in R. 0, 0.5, and 1 respectively are the default means in R for the normal,
               uniform, and exponential distributions."),
      br(),
      downloadButton("down", "Download"),
      br(),
      helpText("Click the download button to download the table of generated values.")
    ),
    mainPanel(
      tabsetPanel(type = "tabs", 
                  tabPanel("Plot", plotOutput("plot")), 
                  tabPanel("Summary", verbatimTextOutput("summary")), 
                  tabPanel("Table of Generated Values", tableOutput("table"))
      )
    )
  )
)