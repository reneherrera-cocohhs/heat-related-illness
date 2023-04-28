source("scripts/setup.R")

theme_figures <- theme_classic() +
  theme(
    aspect.ratio = 9/16
  )

essence_data %>%
  mutate(date = as.Date(date)) %>%
  filter(date <= as.Date(Sys.Date() + 6)) %>%
  mutate(month = months(date)) %>%
  ggplot(mapping = aes(
    x = date,
    y = count
  )) +
  geom_col(fill = "#adb5bd") +
  labs(
    title = "Heat Related Illness (2022)",
    subtitle = "Coconino County",
    x = "Month",
    y = "Count"
  ) +
  theme_figures

ggsave(
  path = "figures",
  filename = "heat-related-total.png"
)

essence_data_details %>%
  ggplot(mapping = aes(
    x = sex
  )) +
  geom_bar(fill = "#adb5bd") +
  labs(
    title = "Heat Related Illness by Sex (2022)",
    subtitle = "Coconino County",
    x = "Sex",
    y = "Count"
  ) +
  scale_x_discrete(labels = c("Female", "Male")) +
  theme_figures

ggsave(
  path = "figures",
  filename = "heat-related-total-by-sex.png"
)

essence_data_details %>%
  count(c_race) %>%
  ggplot() +
  geom_col(mapping = aes(
    x = reorder(c_race, n),
    y = n
  ),
  fill = "#adb5bd") +
  labs(
    title = "Heat Related Illness by Race (2022)",
    subtitle = "Coconino County",
    x = "Race",
    y = "Count"
  ) +
  coord_flip() +
  theme_figures

ggsave(
  path = "figures",
  filename = "heat-related-total-by-race.png"
)

essence_data_details %>%
  count(c_ethnicity) %>%
  ggplot() +
  geom_col(mapping = aes(
    x = reorder(c_ethnicity, n),
    y = n
  ),
  fill = "#adb5bd") +
  labs(
    title = "Heat Related Illness by Ethnicity (2022)",
    subtitle = "Coconino County",
    x = "Ethnicity",
    y = "Count"
  ) +
  coord_flip() +
  theme_figures

ggsave(
  path = "figures",
  filename = "heat-related-total-by-ethnicity.png"
)

essence_data_details %>%
  ggplot(mapping = aes(
    x = age_group
  )) +
  geom_bar(fill = "#adb5bd") +
  labs(
    title = "Heat Related Illness by Age Group (2022)",
    subtitle = "Coconino County",
    x = "Age Group",
    y = "Count"
  ) +
  # scale_x_discrete(labels = c("Female", "Male")) +
  theme_figures

ggsave(
  path = "figures",
  filename = "heat-related-total-by-age-group.png"
)

essence_data_details %>%
  mutate(
    coconino_resident = case_when(
      str_detect(region, "AZ_Coconino") ~ "Coconino resident",
      TRUE ~ "non resident"
    )
  ) %>%
  count(coconino_resident) %>%
  ggplot() +
  geom_col(mapping = aes(
    x = reorder(coconino_resident, n),
    y = n
  ),
  fill = "#adb5bd") +
  labs(
    title = "Heat Related Illness by Residence (2022)",
    subtitle = "Coconino County",
    x = "Residence",
    y = "Count"
  ) +
  coord_flip() +
  theme_figures

ggsave(
  path = "figures",
  filename = "heat-related-total-by-residence.png"
)

