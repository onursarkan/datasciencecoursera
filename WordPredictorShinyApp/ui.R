#########################################################
# Coursera Data Science Specialization Capstone Project #
# Mehmet Onur Sarkan                                    #
#########################################################
# This R script is the client side(user interface) shiny application.


## Related libraries are loaded:
library(shiny)
library(shinythemes)

shinyUI(
  navbarPage("Coursera Data Science Specialization Capstone Project by Mehmet Onur Sarkan", 
    theme = shinytheme("cosmo"),
    fluidRow(column(3),
      column(6,
        tags$div(textInput("text",label=h3("Enter input text:"),value = ),
        tags$span(style="color:grey",("After the writing text, please wait for the model loading.")),
        br(),tags$hr(),h4("Predicted next word:"),
        tags$span(style="color:darkred",
        tags$strong(tags$h3(textOutput("predictedWord")))),
        align="center")),
      column(3)
    ),
    tags$hr(),
    tags$br()
  )
)
