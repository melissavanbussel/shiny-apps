# simple hypothesis test 
library(shiny)
library(shinythemes)

shinyUI(
  navbarPage(theme = shinytheme("flatly"),
    tabPanel("Welcome!",
             ("Hypotheis test for a proportion")),
    tabPanel("Welcome",
             h3("Welcome!"),
             helpText("In this applet, you will be walked through a sample question for a hypothesis test on a proportion. Read
                      the information on the screen, and when you are ready to continue, click the next panel in the navigation bar
                      at the top. It is important that you understand each step in the process, so don't move on until you understand
                      what's been shown so far. You can go back at any time."),
             br(),
             helpText("The question in this applet is taken from page 383 of Triola's 'Elementary Statistics'."),
             h3("The question"),
             helpText("Assume that 100 babies are born to 100 couples using the XSORT method of sex selection, which
                      is claimed to make girls more likely than boys to be born. If 58 of the 100 babies are born girls,
                      test the claim that the XSORT method of sex selection makes girls more likely than boys to be born.")),
    tabPanel("Step 1",
             h3("Step 1: Identify the hypotheses and the direction"),
             helpText("The first step in solving this problem is to identify the null and the alternative hypothesis. The null
                      hypothesis for a proportion test takes the form"),
             img(src = "null.png", align = "center"),
             helpText("while the alternative hypothesis takes the form"),
             img(src = "alt.png", align = "center"),
             helpText("Try to determine the null and alternative hypotheses on your own, as well as the tail (two, right, or left). When you have your answer, go to the
                      next page to check if you're right.")),
    tabPanel("Step 2",
             h3("Answer: Null and alternative hypotheses"),
             helpText("The null hypothesis is that the proportion of girls born using the XSORT method is NOT greater than 50%."),
             helpText("The alternative hypothesis is that the proportion of girls born using the XSORT method IS greater than 50%."),
             helpText("The test is right-tailed, since we are testing if the proportion is GREATER than 50%. Therefore, the null and alternative hypotheses are:"),
             img(src="hyp.png", align = "center"),
             h3("Step 2: Check any requirements"),
             helpText("In this case, we are doing a test on a single proportion. The sampling distribution for this is Normal, and we must check the 
                      following requirements: "),
             img(src="reqs.png", align = "center"),
             selectInput("reqs", "Does our situation meet the requirements?", choices = c("", "Yes", "No")),
             textOutput("reqsanswer"),
             br(),
             helpText("Go to the next page when you're ready to continue.")),
    tabPanel("Step 3",
             h3("Step 3: Calculate the value of the test-statistic"),
             helpText("We are testing a single proportion, therefore our test statistic is:"),
             img(src ="teststat.png", align = "center"),
             selectInput("teststat", "What is the value of our test-statistic?", choices = c("", 1.62, 1.60, -1.6, -1.62)),
             textOutput("teststatanswer"),
             helpText("Go to the next page when you're ready to continue.")),
    tabPanel("Step 4",
             h3("Step 4: Find the critical value and/or p-value"),
             helpText("In order to this hypothesis test, we only need to find one of the two. It's good to be comfortable
                      with both methods, though, so we will find both for this question. "),
             h3("Finding the critical value"),
             selectInput("z", "Which table/distribution should we use?", choices = c("","Z-table", "t-table", "F-table")),
             textOutput("zanswer"),
             helpText("Now we need to pick a significance level. Typically, the question will tell you which significance level
                      to use. Since our question didn't, which significance level do you think we should use?"),
             radioButtons("sig", "Which level of significance should we use?", choices = c("",0.05, 0.10, 0.5)),
             textOutput("siganswer"),
             helpText("Try to find the critical value for the significance level you picked on your own. When you're ready to check your answer, use the drop-down menu below."),
             selectInput("crit", "What is the critical value at 0.05 level of significance?", choices = c("",1.64, 1.28, 0, 1.96)),
             textOutput("critanswer"),
             h3("Finding the p-value"),
             helpText("Finding the p-value is essentially finding the significance level at which we would change our conclusion from rejecting the null hypothesis to
                      failing to reject the null hypothesis. That is, what value of alpha would correspond to a Z-score that is equal to the value we got for our test statistic value, which was 1.6."),
             br(),
             helpText("Let's use some logic to make a guess at the p-value before we actually calculate it. Above, we saw that alpha = 0.025 gave us a Z-score of 1.96, while alpha = 0.05 gave us a Z-score of 1.64.Thus,
                      we can predict that the p-value will be somewhere between 0.025 and 0.05, since 1.6 is between 1.64 and 1.96. We can also guess that it will be closer
                      to 0.05, since 1.6 is closer to 1.64 than it is to 1.96. This step serves as a good sanity check for when we calculate our p-value."),
             br(),
             helpText("In RStudio, you can easily compute p-values. Use the command 1 - pnorm() to do so. As the pnorm() function's argument, put the value of your test statistic. (Note that this function is for the normal distribution only).
                      Give it a try now by typing the value of our test statistic into the text box below, and see what R tells us our p-value is."),
             numericInput("p", "Enter the value of the test statistic", value = 1, step = 0.1, min = -2, max = 2),
             textOutput("panswer"),
             helpText("We are now ready to make our conclusion. Go to the next page when you're ready.")),
    tabPanel("Step 5",
             h3("Step 5: Write a concluding statement"),
             helpText("Now that we know the test statistic, critical value, and p-value, we can make a conclusion."),
             selectInput("same", "Should our conclusion be the same using the critical value method as the p-value method?", choices = c("", "Yes", "No")),
             textOutput("sameanswer"),
             h3("Making a mathematical conclusion"),
             helpText("Our mathematical conclusion should either be:"),
             br(),
             helpText("1: Reject the null hypothesis / Accept the alternative hypothesis"),
             br(),
             helpText("2: Fail to reject the null hypothesis / Reject the alternative hypothesis"),
             br(),
             helpText("For a right tailed test, we choose option number one when our p-value is SMALLER than our significance level and our critical
                      value is BIGGER than our test statistic value."),
             h3("Making a real-world conclusion"),
             helpText("A real-world conclusion is a conclusion that answers the actual question in real-world context. For the question we were given, our 
                      real-world conclusion should be one of the following:"),
             br(),
             helpText("1. A couple is more likely to have a girl when they use the XSORT method of sex selection than if they hadn't used the XSORT method."),
             br(),
             helpText("2: A couple is not more likely to have a girl when they use the XSORT method of sex selection than if they hadn't used the XSORT method."),
             selectInput("conc", "What's your conclusion?", choices = c("","Reject the null hypothesis - Girls are more likely", "Reject the null hypothesis - Girls are NOT more likely", "Keep the null hypothesis - Girls are more likely", "Keep the null hypothesis - Girls are NOT more likely")),
             textOutput("concanswer"),
             helpText("...And you're done! Good work.")
             )
  )
)