# t vs normal 

library(shiny)

shinyUI(
  fluidPage(
    titlePanel("Comparison of Various Distributions"),
    sidebarLayout(
      sidebarPanel(
        sliderInput("dfchisq", "Select the degrees of freedom for the Chi-Square Distribution", min = 1, max = 15, val = 4),
        br(),
        sliderInput("dft", "Select the degrees of freedom for the t-Distribution", min = 1, max = 100, val = 1),
        br(),
        sliderInput("lambda", "Select the value of lambda for the Poisson Distribution", min = 1, max = 15, val = 4)
      ),
      mainPanel(
        tabsetPanel(type = "tabs",
                    tabPanel("Plot", plotOutput("plot"), helpText(
                      "Black = Normal (mean = 0, SD = 1)"),
                      helpText("Green = Chi-Square"),
                      helpText("Orange = t"),
                      helpText("Purple = Poisson")
                      ),
                    tabPanel("Facts about each distribution", htmlOutput("text")))
                    )
        )
    )
  )