# The libraries used are
# library(rvest)
# library(tidyverse)
# library(stringr)

# These are the functions made to replace the URL
source(here::here("R", "get_title_tag.R"))
source(here::here("R", "replace_url_with_title.R"))



# Read's in the CSV
raw_output <- read.csv(here::here("data", "output-2020-01-21.csv"), stringsAsFactors = FALSE)

# Tests random tweets



#In progress...
raw_output_tweet <- 
  raw_output$text %>% 
  map_dfc(~ replace_url_with_title(.x))
