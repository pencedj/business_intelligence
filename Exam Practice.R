hibp <- fromJSON("../data/hibp_data(1).json")
dplyr::glimpse(hibp)

library(jsonlite)
hibp <- jsonlite::fromJSON("data/hibp_data (1).json")
hibp[500,]

glimpse(hibp)
library(dplyr)

library(dplyr)
library(stringr)

# Count total matching rows directly:
sum(str_detect(hibp$Email, "miamioh\\.edu$"))

library(robotstxt)

# Pass the page URL you want to scrape:
paths_allowed("https://en.wikipedia.org/wiki/Miami_University")

robotstxt::paths_allowed("https://en.wikipedia.org/wiki/Miami_University")

# 1. Load required libraries
library(rvest)
library(stringr)

# 2. Define the target URL
url <- "https://miamioh.edu/policy-library/students/undergraduate/academic-regulations/index.html"

# 3. Read the HTML code from the webpage
mu_policies = 'https://miamioh.edu/policy-library/students/undergraduate/academic-regulations/index.html' |> 
  rvest::read_html() |> 
  rvest::html_elements('.news-lockup__body-link') |> 
  rvest::html_attr(name = 'href')

#card--20-body , .news-lockup__body-link

library(rvest)
library(dplyr)

'https://miamiredhawks.com/sports/swimming-and-diving/roster' |> 
  rvest::read_html() -> page

page |> 
  rvest::html_elements('div > a > h3') |> 
  rvest::html_text2() -> name

page |> 
  rvest::html_elements('span.s-person-card__content__person__location-item.flex.items-center') |> 
  rvest::html_text() -> location

swim_df = data.frame(name[1:52], location) # last four names are the coaches

toxic_ips = readr::read_csv("data/toxic_ips_oct2025.csv")

ip_addresses = toxic_ips$IP

x = ip_addresses[1]

ip_api = function(x){
  paste0(
    "http://ip-api.com/json/", x,
    "?fields=status,message,continent,country,countryCode,region,regionName,city,district,zip,lat,lon,timezone,currency,isp,org,as,query") |> 
    jsonlite::fromJSON() -> response
  
  response |> as.data.frame() -> df
  
  return(df)
}

ip_df = df
ip_df = purrr::map_df(.x = ip_addresses, .f = ip_api)

ip_df |> tibble::tibble() # so it prints better

endowment_df <- readr::read_csv("data/ntse_endowment_us_and_canada_2020.csv")
glimpse(endowment_df)
