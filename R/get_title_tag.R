library(rvest)
library(dplyr)
library(stringr)

get_title_tag <- function(url) {
  
  # Checks for NA values
  if (is.na(url)) {
    return("NA")
  }
  
  test <- tryCatch({
    page <- read_html(url)
  }, error = function(e){
    page <- "URL TITLE NOT FOUND"
    return(page)
  })
  
  suppressMessages(if(test == "URL TITLE NOT FOUND"){
    return("URL TITLE NOT FOUND")
  })
  
  # This is the XPATH to the title tag in HTML
  path_to_title <- "/html/head/title"
  
  # Extracts the html code
  page_nodes <- html_nodes(page, xpath = path_to_title)
  
  if (length(page_nodes) == 0){
    return("URL TITLE NOT FOUND")
  }
  
  # Cleans up the HTML to text
  title <- html_text(page_nodes)
  
  return(title)
}