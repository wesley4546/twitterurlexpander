library(rvest)
library(tidyverse)
library(stringr)

replace_url_with_title <- function(tweet){
  
  #Takes all the URLS out of the tweet
  extracted_url <- str_extract_all(string = tweet, regex("(http|https)://([^\\s]+)"))
  
  #Initializes a blank list 
  titles_from_url <- c()
  
  #sends a GET request to get the title tags from the URLS
  for (i in extracted_url[[1]]) {
    print(paste("Trying URL:", i))
    titles_from_url[i] <- get_title_tag(i)
  }
  
  #Reformats the tweet into a list
  list_tweet <- strsplit(tweet, split = " ")
  #Reformats THAT list into a dataframe
  list_tweet <-
    as.data.frame(list_tweet)
  
  #Changes column name for clarity/useability
  colnames(list_tweet) <- "words"
  
  #Creates a dataframe of the urls and titles
  replacements <- data.frame(
    words = extracted_url[[1]],
    title = titles_from_url
  )
  
  #Joins them together
  list_tweet <- full_join(list_tweet, replacements) #the id key is words
  
  #Creates a column with the tweet and the titles pasted side by side
  list_tweet$t <- paste(list_tweet$words, list_tweet$title, sep = " ")
  
  # Gets the tweet into a single string
  completed_tweet <- toString(unlist(as.list(list_tweet$t)))
  
  #Replaces all the string NA's from the comabination process 
  completed_tweet <- str_replace_all(completed_tweet, "NA", "") %>%
    str_replace_all(",", "") %>% #Removes any , 
    str_replace_all(regex("(http|https)://([^\\s]+)"), "") #takes out the urls
  
  return(completed_tweet)
}