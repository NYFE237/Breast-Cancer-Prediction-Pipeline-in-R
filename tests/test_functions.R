library(testthat)
library(readr)
library(randomForest)

# Test data processing
test_that("Data processing creates train and test datasets", {
  expect_true(file.exists("data/processed/train_data.rds"))
  expect_true(file.exists("data/processed/test_data.rds"))

  train_data <- readRDS("data/processed/train_data.rds")
  test_data <- readRDS("data/processed/test_data.rds")

  expect_true(is.data.frame(train_data))
  expect_true(is.data.frame(test_data))
  expect_true(nrow(train_data) > 0)
  expect_true(nrow(test_data) > 0)
  expect_true(sum(is.na(train_data)) == 0)
  expect_true(sum(is.na(test_data)) == 0)
})

# Test model training
test_that("Model training generates an output file", {
  expect_true(file.exists("models/rf_model.rds"))

  rf_model <- readRDS("models/rf_model.rds")
  expect_true(class(rf_model) == "randomForest")
})

# Test predictions
test_that("Prediction script generates predictions", {
  expect_true(file.exists("results/predictions.rds"))

  predictions <- readRDS("results/predictions.rds")
  expect_true(is.factor(predictions) || is.numeric(predictions))
  expect_true(length(predictions) > 0)
})

# Test visualizations
test_that("Visualization script generates plot files", {
  expect_true(file.exists("figures/correlation_heatmap.png"))
  expect_true(file.exists("figures/feature_distributions.png"))
  expect_true(file.exists("figures/feature_importance.png"))
})
