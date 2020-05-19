library(rvest)
library(dplyr)

get_title_tag <- function(url) {
  
  if (is.na(url)) {
    return(NA)
  }

  page <- read_html(url)

  path_to_title <- "/html/head/title"

  conf_nodes <- html_nodes(page, xpath = path_to_title)

  title <- html_text(conf_nodes)

  return(title)
}

raw_output <- read.csv(here::here("data", "output-2020-01-21.csv"), stringsAsFactors = FALSE)

urls_only_vector <- raw_output %>%
                          mutate(urls= strsplit(as.character(urls), " ")) %>%
                          unnest(urls)



raw_output$urls <- with(raw_output, ifelse(urls == "", NA, urls))

title_vector <- c()

for (i in 1:nrow(raw_output)) {
  
 # title_vector <- c(title_vector[i],get_title_tag(raw_output$urls[i]))
  print(get_title_tag(t[i]))
  print(i)
}

