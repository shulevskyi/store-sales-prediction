library(ggplot2)
library(dplyr)

# Get a sample of 300 observations from train_datas
sample_data <- train_datas %>% sample_n(10000)

# Create a scatter plot with regression line
chart <- ggplot(train_datas, aes(x = onpromotion, y = sales)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  xlab("Promotion") +
  ylab("Sales") +
  ggtitle("Average Sales with and without Promotions")

print(chart)

# Perform correlation test
cor_test <- cor.test(sample_data$onpromotion, sample_data$sales)

# Print the correlation test results
print(cor_test)
