library(tidyverse)
library(lubridate)

df <- read_csv("data/cancer_data.csv")

df <- df %>%
  select(-`Unnamed: 32`) %>%  # Drop empty column
  mutate(diagnosis = factor(diagnosis, levels = c("B", "M"), labels = c(0, 1))) %>%
  distinct() %>%
  drop_na()

numeric_cols <- df %>% select(where(is.numeric)) %>% names()
df[numeric_cols] <- scale(df[numeric_cols])

write_csv(df, "data/cleaned_data.csv")
