# package libraries 
library(here) # project oriented workflow
library(tidyverse) # data tidy
library(Rnssp) # R NSSP CDC BioSense API access
library(janitor) # data tables 
library(knitr) # markdown tables 
library(lubridate) # nice dates

# including this for testing and troubleshooting
myProfile <- Credentials$new(
  username = askme("Enter your username: "),
  password = askme()
)

## JSON URL from ESSENCE API
url <- "https://essence.syndromicsurveillance.org/nssp_essence/api/timeSeries?endDate=30Jun2022&geography=15919&geography=33622&percentParam=noPercent&datasource=va_hosp&startDate=1Jan2022&medicalGroupingSystem=essencesyndromes&userId=4887&aqtTarget=TimeSeries&ccddCategory=heat%20related%20illness%20v2&geographySystem=hospital&detector=nodetectordetector&timeResolution=monthly"

## Get Data from ESSENCE
api_data <- get_api_data(url) # or api_data <- myProfile$get_api_data(url)

## Inspect data object structure
# names(api_data)

## Get a glimpse of the pulled dataset
# glimpse(api_data$timeSeriesData) 
# glimpse(api_data$dataDetails)

# tidy 
essence_data <- api_data$timeSeriesData %>%
  clean_names() %>%
  as_tibble()

## JSON URL from ESSENCE API
url2 <- "https://essence.syndromicsurveillance.org/nssp_essence/api/dataDetails?endDate=30Jun22&geography=15919&geography=33622&percentParam=noPercent&datasource=va_hosp&startDate=01Jan22&medicalGroupingSystem=essencesyndromes&userId=4887&aqtTarget=TimeSeries&ccddCategory=heat%20related%20illness%20v2&geographySystem=hospital&detector=nodetectordetector&timeResolution=monthly"

## Get Data from ESSENCE
api_data2 <- get_api_data(url2) # or api_data <- myProfile$get_api_data(url)

## Inspect data object structure
# names(api_data2)

## Get a glimpse of the pulled dataset
# glimpse(api_data2$timeSeriesData) 
# glimpse(api_data2$dataDetails)

# tidy 
essence_data_details <- api_data2$dataDetails %>%
  clean_names() %>%
  as_tibble()
