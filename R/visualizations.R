library(ggplot2)
library(reshape2)
library(tidyr)


# Ensure the 'figures' directory exists
dir.create("figures", showWarnings = FALSE)

# Load the processed data
df <- readRDS("data/processed/train_data.rds")

# Correlation Heatmap
corr_matrix <- cor(select(df, where(is.numeric)), use = "complete.obs")
png("figures/correlation_heatmap.png", width = 800, height = 600)
corrplot(corr_matrix, method = "color", type = "upper", tl.cex = 0.6,
         title = "Feature Correlation Heatmap")
dev.off()

# Boxplot of Features by Diagnosis
melted_df <- melt(df, id.vars = "diagnosis")
p <- ggplot(melted_df, aes(x = diagnosis, y = value, fill = diagnosis)) +
  geom_boxplot() +
  facet_wrap(~ variable, scales = "free") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ggtitle("Feature Distributions by Tumor Type")
ggsave("figures/feature_distributions.png", p, width = 12, height = 8)

# Feature Importance Plot (if available)
if(file.exists("results/feature_importance.rds")) {
  importance <- readRDS("results/feature_importance.rds")
  importance_df <- data.frame(feature = rownames(importance),
                              importance = importance[,1])
  p <- ggplot(importance_df, aes(x = reorder(feature, importance), y = importance)) +
    geom_bar(stat = "identity") +
    coord_flip() +
    theme_minimal() +
    labs(x = "Features", y = "Importance", title = "Feature Importance")
  ggsave("figures/feature_importance.png", p, width = 10, height = 8)
}

cat("Visualizations completed. Plots saved in 'figures' directory.\n")

