library(testthat)
library(readr)

# Test data processing
test_that("Data processing removes missing values", {
  df_cleaned <- read_csv("data/cleaned_data.csv")
  expect_true(sum(is.na(df_cleaned)) == 0)
})

# Test model training
test_that("Model training generates an output file", {
  expect_true(file.exists("rf_model.rds"))
})

# Test predictions
test_that("Prediction script generates predictions", {
  predictions <- read_csv("data/predictions.csv")
  expect_true(nrow(predictions) > 0)
})
