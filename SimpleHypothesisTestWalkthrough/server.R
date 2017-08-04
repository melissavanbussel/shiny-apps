library(shiny)

shinyServer(
  function(input, output) {
    
    output$reqsanswer <- reactive({
      reqs <- input$reqs
      if (reqs == "") {
        print("Please make a selection from the drop-down menu")
      } else {
        if (reqs == "Yes") {
          print("You're right! Our sample size, n, was 100. Our value of p is 0.5, and our value of q was 0.5. Therefore, the requirements
                are met since nq = np = 50, which is greater than 5.")
        } else {
          if (reqs == "No") {
            print("Check your calculations again!")
          }
        }
      }
    })
    
    output$teststatanswer <- reactive({
      teststat <- input$teststat
      if (teststat == "") {
        print("Please make a selection from the drop-down menu.")
      } else {
        if (teststat == 1.62) {
          print("Check your calculations!")
        } else {
          if (teststat == 1.6) {
            print("That's correct! The value of n was 100, p was 0.5, q was 0.5, and p-hat was 0.58.")
          } else {
            if (teststat == -1.6) {
              print("Check your calculations!")
            } else {
              if (teststat == -1.62) {
                print("Check your calculations!")
              }
            }
          }
        }
      }
    })
    
    output$zanswer <- reactive({
      z <- input$z
      if (z == "Z-table") {
        print("That's correct!")
      } else {
        if (z == "t-table") {
          print("Try again...")
        } else {
          if (z == "F-table") {
            print("Try again...")
          } else {
            if (z == "") {
              print("Please make a selection")
            }
          }
        }
      }
    })
    
    output$siganswer <- reactive({
      siganswer <- input$sig
      if (siganswer == 0.05) {
        print("Good choice! We can be 95% confident in our answer. This is the most common choice when a significance level is not given, 
              such as when you're performing real-world experiments. Of course there are exceptions, but this is a good rule of thumb.")
      } else {
        if (siganswer == 0.1) {
          print("This would be a pretty good choice. We would be able to be 90% confident in our answer. Let's solve the problem using an even
                stronger confidence, though.")
        } else {
          if (siganswer == 0.5) {
            print("You might want to rethink that. If we choose that value, we'll only be able to be 50% confident in our answer. Try again.")
          } else {
            if (siganswer == "") {
              print("Please make a selection.")
            }
          }
        }
      }
    })
    
    output$panswer <- reactive({
      p <- input$p
      if (p == 1.6) {
        paste("1 - pnorm(1.6) = ", 1 - pnorm(1.6), ".", " That means our p-value is approximately 0.0548", sep = "")
      } else {
        print("That wasn't the value of our test statistic.")
      }
    })
    
    output$sameanswer <- reactive({
      same <- input$same
      if (same == "Yes") {
        print("That's right! Our answer should be the same regardless of which of the two methods we use. In fact, it's a great idea to use both,
              so that we can check our answer easily.")
      } else {
        if (same == "No") {
          print("Try again!")
        } else {
          print("Please make a selection.")
        }
      }
    })
    
    
    output$concanswer <- reactive({
      conc <- input$conc
      if (conc == "Keep the null hypothesis - Girls are NOT more likely") {
        paste("That's correct! Our test statistic, 1.6, is SMALLER than our critical value, 1.64. Our p-value, 0.0548, is LARGER than our siginificance level.
              Thus, we do not have evidence to reject the null hypothesis, and we conclude that the XSORT method of sex selection is NOT more likely to have girls be born. 
              Because our value of alpha (significance level) was 0.05, we are 95% confident in this conclusion.")
      } else {
        paste("Try again!")
      }
    })
    
    output$critanswer <- reactive({
      crit <- input$crit
      if (crit == 1.64) {
        print("That's right! If you want o avoid using annoying tables, you can find your answer easily in RStudio by typing qnorm(0.05) in the console. Your answer will
              come out as -1.64 since the function defaults to left-tail, but just multiply by -1 if your problem is right-tailed.")
      } else {
        if (crit == "") {
          print("Please make a selection")
        } else {
          print("Try again!")
        }
      }
    })
  }
)