#explore correaltion coefficients using mtcars dataset 
library(shiny) 
library(shinythemes)

shinyUI(
  fluidPage(theme = shinytheme("flatly"),
    titlePanel("Exploring Correlation using mtcars dataset"),
    sidebarLayout(
      sidebarPanel(
        selectInput("xvar", "Select the x-variable", choices = c(
          "Miles per Gallon" = "mpg",
          "Number of Cylinders" ="cyl",
          "Displacement in Cubic Inches" ="disp",
          "Horsepower" ="hp",
          "Rear Axle Ratio" ="drat",
          "Weight" = "wt",
          "1/4 mile time" ="qsec",
          "V/S" = "vs", 
          "Transmission (0 = automatic, 1 = manual)" = "am",
          "Number of forward gears" = "gear",
          "Number of carburetors" ="carb"
        ), selected = "mpg"),
        selectInput("yvar", "Select the y-variable", choices = c(
          "Miles per Gallon" = "mpg",
          "Number of Cylinders" ="cyl",
          "Displacement in Cubic Inches" ="disp",
          "Horsepower" ="hp",
          "Rear Axle Ratio" ="drat",
          "Weight" = "wt",
          "1/4 mile time" ="qsec",
          "V/S" = "vs", 
          "Transmission (0 = automatic, 1 = manual)" = "am",
          "Number of forward gears" = "gear",
          "Number of carburetors" ="carb"
        ), selected = "wt"),
        helpText("Value of r ranges from -1 to 1, where -1 indicates a strongly negative correlation, and 
                 1 represents a strongly positive correlation. 0 represents no correlation."),
        helpText("Value of R-Squared ranges from 0 to 1, where 1 represents 100% of variation accounted for by the linear model. 
                 0 represents 0% variation accounted for.")
      ),
      mainPanel(
        plotOutput("plot"),
        helpText("The black line represents the least squares regression line.")
      )
    )
  )
)