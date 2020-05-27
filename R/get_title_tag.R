library(rvest)
library(tidyverse)
library(stringr)

get_title_tag <- function(url) {
  
  # Checks for NA values
  if (is.na(url)) {
    return("NA")
  }
  
  if (str_detect(url, "â")){
    return("...")
  }
  
  if (class(try(read_html(url))) == "try-error") {
    return("URL TITLE NOT FOUND")
  }
  
  
  
  # Reads in the HTML
  page <- read_html(url)
  
  # This is the XPATH to the title tag in HTML
  path_to_title <- "/html/head/title"
  
  # Extracts the html code
  conf_nodes <- html_nodes(page, xpath = path_to_title)

  if (length(conf_nodes) == 0){
    return("URL TITLE NOT FOUND")
  }
  
  # Cleans up the HTML to text
  title <- html_text(conf_nodes)
  
  return(title)
}