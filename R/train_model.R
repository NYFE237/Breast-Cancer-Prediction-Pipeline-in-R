library(caret)
library(randomForest)
library(shapviz)
library(lime)

df <- read_csv("data/cleaned_data.csv")
set.seed(42)
trainIndex <- createDataPartition(df$diagnosis, p = 0.8, list = FALSE)
train_data <- df[trainIndex, ]
test_data  <- df[-trainIndex, ]

rf_model <- randomForest(diagnosis ~ ., data = train_data, ntree = 100)
saveRDS(rf_model, "rf_model.rds")

shap_values <- shapviz(rf_model, X = select(test_data, -diagnosis))
plot(shap_values)

explainer <- lime(train_data[-1], rf_model)
explanation <- explain(test_data[-1], explainer, n_features = 5)
plot_features(explanation)
