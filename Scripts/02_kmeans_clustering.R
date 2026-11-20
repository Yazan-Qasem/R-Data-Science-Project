data <- read.csv("Data/Heart Prediction Quantum Dataset (1).csv")


numeric_features <- data[, c("Age", "BloodPressure", "Cholesterol", "HeartRate", "QuantumPatternFeature")]
scaled_data <- scale(numeric_features)


set.seed(123)

# 2. Apply K-Means with different cluster counts (k = 2, 3, 4, 5) --------------
if (!require(cluster)) install.packages("cluster")
library(cluster)

par(mfrow = c(2, 2)) # Display 4 cluster plots together

for (k in c(2, 3, 4, 5)) {
  km_model <- kmeans(scaled_data, centers = k, nstart = 25)
  cat("\n--- K-Means Summary for k =", k, "---\n")
  print(km_model$size)
  
  clusplot(scaled_data,
           km_model$cluster,
           main = paste("K-Means Clustering (k =", k, ")"),
           color = TRUE,
           shade = TRUE,
           labels = 2,
           lines = 0)
}

par(mfrow = c(1, 1)) # Reset layout

# 3. Compare Optimal k=2 Clusters with Actual HeartDisease Labels --------------
set.seed(123)
km_best <- kmeans(scaled_data, centers = 2, nstart = 25)
table(Cluster = km_best$cluster, Actual_HeartDisease = data$HeartDisease)
