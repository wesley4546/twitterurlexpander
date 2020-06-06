# The libraries used are
# library(rvest)
# library(tidyverse)
# library(stringr)
library(purrr)

# These are the functions made to replace the URL
source(here::here("R", "get_title_tag.R"))
source(here::here("R", "replace_url_with_title.R"))



# Read's in the CSV
raw_output <- read.csv(here::here("data", "output-2020-01-21.csv"), 
                       stringsAsFactors = FALSE)

# Tests random tweets


raw_output$text <-  gsub("(â|€|¦)", "", raw_output$text)
 
# raw_output$text %>% 
# str_replace_all(pattern = "[^[:alnum:][:blank:]?&/\\-]",replacement = "")


#In progress...
raw_output_tweet_dfc <- 
  raw_output$text %>% 
  map_dfc(~ replace_url_with_title(.x)) 

raw_output_tweet_dfr <- 
  raw_output$text %>% 
  map_dfr(~ replace_url_with_title(.x)) 






# stringi::stri_trans_general(raw_output$text, "latin-ascii")
