# Simple R Project

# Load necessary libraries
library(ggplot2)
library(dplyr)

# Generate some sample data
set.seed(123)
data <- data.frame(
    x = rnorm(100),
    y = rnorm(100),
    category = sample(c("A", "B", "C"), 100, replace = TRUE)
)

# Perform some basic data manipulation
summary_stats <- data %>%
    group_by(category) %>%
    summarize(
        mean_x = mean(x),
        mean_y = mean(y),
        count = n()
    )

# Print summary statistics
print(summary_stats)

# Create a scatter plot
ggplot(data, aes(x = x, y = y, color = category)) +
    geom_point() +
    labs(
        title = "Scatter Plot of X vs Y",
        x = "X values",
        y = "Y values"
    ) +
    theme_minimal()

# Save the plot
ggsave("scatter_plot.png", width = 8, height = 6)

# Perform a simple linear regression
model <- lm(y ~ x, data = data)
summary(model)

# Print model coefficients
cat("\nModel Coefficients:\n")
print(coef(model))

cat("\nProject completed successfully!\n")
