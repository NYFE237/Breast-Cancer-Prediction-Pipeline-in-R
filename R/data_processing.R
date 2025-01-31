# Libraries

library(readr)
library(dplyr)
library(missForest)

# Load the data
df <- read_csv("data/cancer_data.csv")

# Data cleaning and preprocessing
process_data <- function(data) {
  data %>%
    # Remove unnecessary columns (if any)
    select(-id) %>%
    # Convert diagnosis to factor
    mutate(diagnosis = factor(diagnosis, levels = c("B", "M"), labels = c(0, 1))) %>%
    # Rename columns to ensure they're R-friendly
    rename_with(~make.names(., unique = TRUE)) %>%
    # Remove any duplicate rows
    distinct() %>%
    # Handle missing values using missForest
    {missForest(.)$ximp} %>%
    # Scale numeric features
    mutate(across(where(is.numeric), scale))
}

# Process the entire dataset
processed_df <- process_data(df)

# Split the data
set.seed(42)
train_index <- createDataPartition(processed_df$diagnosis, p = 0.8, list = FALSE)
train_data <- processed_df[train_index, ]
test_data <- processed_df[-train_index, ]

# Save processed datasets
dir.create("data/processed", recursive = TRUE)

saveRDS(train_data, "data/processed/train_data.csv")
saveRDS(test_data, "data/processed/test_data.csv")

cat("Data processing completed. Processed data saved in 'data/processed/' directory.\n")

