library(caret)
library(readr)

# Load trained model
rf_model <- readRDS("rf_model.rds")

# Load new test data
test_data <- read_csv("data/new_cancer_data.csv")

# Make predictions
predictions <- predict(rf_model, test_data)

# Save predictions
write_csv(data.frame(Predictions = predictions), "data/predictions.csv")
