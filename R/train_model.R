# train_model.R

library(randomForest)
library(caret)

# Load preprocessed data
train_data <- readRDS("data/processed/train_data.rds")
test_data <- readRDS("data/processed/test_data.rds")

# Ensure the 'models' directory exists
dir.create("models", showWarnings = FALSE)

# Train the model
set.seed(42)  # for reproducibility
rf_model <- randomForest(diagnosis ~ ., data = train_data, ntree = 100)

# Save the model
saveRDS(rf_model, "models/rf_model.rds")

# Make predictions on test set
predictions <- predict(rf_model, test_data)

# Ensure the 'results' directory exists
dir.create("results", showWarnings = FALSE)

# Evaluate the model
conf_matrix <- confusionMatrix(predictions, test_data$diagnosis)
saveRDS(conf_matrix, "results/confusion_matrix.rds")

# Ensure the 'results' directory exists
dir.create("results", showWarnings = FALSE)

# Plot feature importance
png("figures/feature_importance_plot.png")
varImpPlot(rf_model)
dev.off()

cat("Model training completed. Results saved in 'models', 'results', and 'figures' directories.\n")
