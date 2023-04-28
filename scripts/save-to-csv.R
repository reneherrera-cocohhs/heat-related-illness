source("scripts/setup.R")

essence_data %>%
  mutate(date = as.Date(date)) %>%
  filter(date <= as.Date(Sys.Date() + 6)) %>%
  mutate(month = months(date)) %>%
  select(month, count) %>%
  write_csv("data/totals-by-month.csv")

essence_data_details %>%
  count(sex) %>%
  write_csv("data/totals-by-sex.csv")

essence_data_details %>%
  count(c_race) %>%
  write_csv("data/totals-by-race.csv")

essence_data_details %>%
  count(c_ethnicity) %>%
  write_csv("data/totals-by-ethnicity.csv")

essence_data_details %>%
  count(age_group) %>%
  write_csv("data/totals-by-age-group.csv")

essence_data_details %>%
  mutate(
    coconino_resident = case_when(
      str_detect(region, "AZ_Coconino") ~ "Coconino resident",
      TRUE ~ "non resident"
    )
  ) %>%
  count(coconino_resident) %>%
  write_csv("data/totals-by-county-residence.csv")

