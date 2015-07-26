
###################################
# Course Project - User interface #
###################################

# Load Shiny's library
library(shiny)

shinyUI(
  pageWithSidebar(
    headerPanel("Developing Data Products - Course Project"),
    sidebarPanel(
      # 1. Some form of input - a textbox
      textInput(inputId="name", label = "Enter your name"),
      numericInput('age', 'Enter your age', 33,
                   min = 13, max = 120, step = 1),
      sliderInput('mu', 'Reach Equilibrium',
                  value = 70, min = 62, max = 74, step = 0.05)
    ),

    mainPanel(
      # 2. Some operation on the textbox input
      # 3. And some reactive output displayed
      h2(textOutput('name')),
      textOutput('age'),
      # 4. A bit of Documentation
      # 5. On the shiny app itself
      h2('Documentation'),
      p('This is the Course Project of Coursera\'s MOOC on Developing
        Data Products'),
      p('In order to use this Shiny application, you need:'),
      tags$ol(
        tags$li('to enter your name and age the text area
                on the left panel;'),
        tags$li('to use the slider in order to reach the
                "SUCCESS" announcement.')
      ),
      h2('Main application - Reach Equilibrium'),
      plotOutput('newHist')
    )
  )
)
