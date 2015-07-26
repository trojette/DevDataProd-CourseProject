
###########################
# Course Project - Server #
###########################

# Load Shiny's library
library(shiny)
library(UsingR)
data("galton")

shinyServer(
  function(input, output) {
    output$newHist <- renderPlot({
      hist(galton$child, xlab='child height',
           col='lightblue',main='Histogram')
      mu <- input$mu
      lines(c(mu, mu), c(0, 200),col="red",lwd=5)
      mse <- mean((galton$child - mu)^2)
      text(63, 150, paste("mu = ", mu))
      text(63, 140, paste("MSE = ", round(mse, 2)))
      text(63, 130,
           if(round(mse, 3) != 6.333)
             { paste("TRY MORE") }
           else
             { paste("SUCCESS") }
           )
    }
    )
    output$name <- renderText(paste("Welcome to you, Master", {input$name}))
    output$age <- renderText(paste("Next year you'll be", {input$age + 1}))
  }
)
