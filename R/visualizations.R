library(ggplot2)
library(reshape2)
library(corrplot)

df <- read_csv("data/cleaned_data.csv")

# Correlation Heatmap
corr_matrix <- cor(select(df, -diagnosis), use = "complete.obs")
corrplot(corr_matrix, method = "color", type = "upper", tl.cex = 0.6, title = "Feature Correlation Heatmap")

# Boxplot of Features by Diagnosis
melted_df <- melt(df, id.vars = "diagnosis")
ggplot(melted_df, aes(x = diagnosis, y = value, fill = diagnosis)) +
  geom_boxplot() +
  facet_wrap(~ variable, scales = "free") +
  theme_minimal() +
  ggtitle("Feature Distributions by Tumor Type")
