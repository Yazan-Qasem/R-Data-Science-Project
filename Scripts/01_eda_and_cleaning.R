data_raw <- read.csv("Data/Heart Prediction Quantum Dataset (1).csv")
data <- data_raw

# Inspect structure and dimensions
dim(data)
str(data)
head(data)

# Check for missing values and duplicates
any(is.na(data))
colSums(is.na(data))
data <- unique(data)

# 2. Check Class & Categorical Distribution ------------------------------------
data$Gender <- factor(data$Gender, levels = c(0, 1), labels = c("Female", "Male"))
data$HeartDisease <- factor(data$HeartDisease, levels = c(0, 1), labels = c("No Disease", "Heart Disease"))

summary(data$HeartDisease)
round(prop.table(table(data$HeartDisease)) * 100, 2)

summary(data$Gender)
round(prop.table(table(data$Gender)) * 100, 2)

# 3. Create Attribute Statistics using apply() ---------------------------------
numeric_cols <- data[, c("Age", "BloodPressure", "Cholesterol", "HeartRate", "QuantumPatternFeature")]

calc_stats <- function(x) {
  c(
    Min     = round(min(x, na.rm = TRUE), 2),
    Max     = round(max(x, na.rm = TRUE), 2),
    Average = round(mean(x, na.rm = TRUE), 2),
    Std.Dev = round(sd(x, na.rm = TRUE), 2),
    Q1      = round(as.numeric(quantile(x, 0.25, na.rm = TRUE)), 2),
    Q3      = round(as.numeric(quantile(x, 0.75, na.rm = TRUE)), 2)
  )
}

stats_df <- as.data.frame(t(sapply(numeric_cols, calc_stats)))
print(stats_df)

# 4. Data Visualizations -------------------------------------------------------
# A. Histograms using a for loop
par(mfrow = c(2, 3))
for (col_name in names(numeric_cols)) {
  hist(numeric_cols[[col_name]],
       main = paste("Distribution of", col_name),
       xlab = col_name,
       col = "steelblue",
       border = "white")
}
par(mfrow = c(1, 1))

# B. Two-Variable Histogram (Age by HeartDisease)
hist(data$Age[data$HeartDisease == "No Disease"],
     col = rgb(0.2, 0.6, 0.8, 0.5),
     main = "Age Distribution by Heart Disease Status",
     xlab = "Age (Years)",
     xlim = range(data$Age))
hist(data$Age[data$HeartDisease == "Heart Disease"],
     col = rgb(0.9, 0.2, 0.2, 0.5),
     add = TRUE)
legend("topright", legend = c("No Disease", "Heart Disease"),
       fill = c(rgb(0.2, 0.6, 0.8, 0.5), rgb(0.9, 0.2, 0.2, 0.5)))

# C. Box plots using a for loop
par(mfrow = c(2, 3))
for (col_name in names(numeric_cols)) {
  boxplot(numeric_cols[[col_name]],
          main = paste("Boxplot of", col_name),
          ylab = col_name,
          col = "lightblue")
}
par(mfrow = c(1, 1))

# D. Pie Charts for Categorical Variables
par(mfrow = c(1, 2))
hd_pct <- round(prop.table(table(data$HeartDisease)) * 100, 1)
pie(table(data$HeartDisease),
    labels = paste(names(hd_pct), "\n", hd_pct, "%"),
    main = "Heart Disease Proportion",
    col = c("lightgreen", "salmon"))

gen_pct <- round(prop.table(table(data$Gender)) * 100, 1)
pie(table(data$Gender),
    labels = paste(names(gen_pct), "\n", gen_pct, "%"),
    main = "Gender Proportion",
    col = c("pink", "skyblue"))
par(mfrow = c(1, 1))

# E. Percentile Plots using for loop
par(mfrow = c(2, 3))
for (col_name in names(numeric_cols)) {
  sorted_vals <- sort(numeric_cols[[col_name]])
  percentiles <- (1:length(sorted_vals)) / length(sorted_vals) * 100
  plot(percentiles, sorted_vals, type = "l", lwd = 2, col = "darkgreen",
       main = paste("Percentile Plot of", col_name),
       xlab = "Percentile (%)",
       ylab = col_name)
}
par(mfrow = c(1, 1))

# 5. Multivariate Statistics & Correlation Matrix ------------------------------
cor_matrix <- cor(numeric_cols)
print(round(cor_matrix, 3))

if (!require(corrplot)) install.packages("corrplot")
library(corrplot)
corrplot(cor_matrix, method = "color", type = "upper", addCoef.col = "black",
         tl.col = "black", tl.srt = 45, title = "Correlation Matrix of Numeric Features",
         mar = c(0, 0, 2, 0))

# 6. Matrix Scatterplot using car package --------------------------------------
if (!require(car)) install.packages("car")
library(car)
scatterplotMatrix(numeric_cols,
                  main = "Matrix Scatterplot of Heart Dataset Features",
                  col = "steelblue")
