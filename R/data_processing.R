library(dplyr)

# Read the CSV file
df <- read.csv("data/cancer_data.csv")

# Process the data
df <- df %>%
  mutate(diagnosis = factor(diagnosis, levels = c("B", "M"), labels = c(0, 1))) %>%
  select(-id) %>%  # Remove the id column as it's not needed for analysis
  distinct() %>%
  drop_na()

# Scale numeric columns
numeric_cols <- df %>% select(where(is.numeric)) %>% names()
df[numeric_cols] <- scale(df[numeric_cols])
