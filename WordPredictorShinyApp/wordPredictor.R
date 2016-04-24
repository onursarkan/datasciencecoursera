#########################################################
# Coursera Data Science Specialization Capstone Project #
# Mehmet Onur Sarkan                                    #
#########################################################
# This R script has 3 main responsibilties:
# 1- Frequent word patterns(n-grams) are loaded into server-side memory.
# 2- Input text is processed: processedInput()
# 3- Next word is predicted by using processed input and frequent patterns in memory: predictedWord()

##Related libraries are loaded:
library(tm)
library(stringr)
library(stylo)

## Frequent patterns are loaded:
load("./data/n2GramData.RData")
load("./data/n3GramData.RData")
load("./data/n4GramData.RData")
load("./data/n5GramData.RData")

processedInput <- function(inputText){
  processedText <- tolower(inputText)
  processedText <- removePunctuation(processedText)
  processedText <- removeNumbers(processedText)
  processedText <- str_replace_all(processedText, "[^[:alnum:]]", " ")
  processedText <- stripWhitespace(processedText)
  processedText <- txt.to.words.ext(processedText, language="English")
  return(processedText)
}

wordPredictor <- function(wCount,inputText){
  if (wCount>=4) {
    inputText <- inputText[(wCount-3):wCount] 
  } else if (wCount==3) {
    inputText <- c(NA,inputText)
  } else if(wCount==2) {
    inputText <- c(NA,NA,inputText)   
  } else {
    inputText <- c(NA,NA,NA,inputText)
  }

  predictedWord <- as.character(
    n5GramData[n5GramData$firstWord==inputText[1] & 
    n5GramData$secondWord==inputText[2] & 
    n5GramData$thirdWord==inputText[3] &
      n5GramData$fourthWord==inputText[4],][1,]$fifthWord)
  

  if(is.na(predictedWord)) {  
    predictedWord <- as.character(
      n4GramData[n4GramData$firstWord==inputText[2] & 
      n4GramData$secondWord==inputText[3] & 
      n4GramData$thirdWord==inputText[4],][1,]$fourthWord)
    
    if(is.na(predictedWord)) {
      predictedWord <- as.character(
        n3GramData[n3GramData$firstWord==inputText[3] & 
        n3GramData$secondWord==inputText[4],][1,]$thirdWord)
                
      if(is.na(predictedWord)) {
        predictedWord <- as.character(
          n2GramData[n2GramData$firstWord==inputText[4],][1,]$secondWord)
      }
    }
  }
  print(predictedWord)        
}