library(stringr)

extract_urls <- function(tweet){

  regex_expression = "(http|https)://([^\\s]+)"
  
  extracted_url <- str_extract_all(string = tweet, regex(regex_expression))
  
  return(extracted_url[[1]])
  
}