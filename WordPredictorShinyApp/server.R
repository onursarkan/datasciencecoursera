#########################################################
# Coursera Data Science Specialization Capstone Project #
# Mehmet Onur Sarkan                                    #
#########################################################
# This R script is the server side shiny application.
# By using input text, next word is predicted.

## Related libraries are loaded:
library(shiny)
library(shinythemes)
source("./wordPredictor.R")

shinyServer(
  function(input, output) {
    wordPrediction <- reactive({
      inputText <- input$text
      processedTxt <- processedInput(inputText)
      wordCount <- length(processedTxt)
      wordPrediction <- wordPredictor(wordCount,processedTxt)})      
  output$predictedWord <- renderPrint(wordPrediction())
  output$enteredWords <- renderText({ input$text }, quoted = FALSE)
})