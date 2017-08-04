library(shiny)

shinyUI(
  fluidPage(
    titlePanel("Critical Value Calculator for t-Distribution and Chi-Square Distribution"),
    sidebarLayout(
      sidebarPanel(
        radioButtons("dist", "Select the distribution type", choices = c(
          "t" = 1,
          "Chi-Square" = 2
        )),
        radioButtons("tail", "For t distribution only: Select left tail or two-tailed", choices = c(
          "Left" = 1,
          "Two-Tailed" = 2
        )),
        sliderInput("df", "Select the degrees of freedom", min = 1, max = 10, val = 4),
        br(),
        sliderInput("prob", "Select the probability/area you're interested in finding the score for", min = 0, max = 1, val = 0.05, step = 0.01)
      ),
      mainPanel(
        textOutput("score"),
        plotOutput("plot"),
        helpText("The plot is for reference only; it is intended to show the part of the graph which the probability/area corresponds to. The graph does not change
                 with the sliders.")
      )
    )
  )
)