# Does the type of stores affect the store sales?

# Calculate the total sales for each family
total_sales <- aggregate(sales ~ family, data = train_datas, FUN = sum)

# Sort the families by sales in descending order and select the top 10
top_10_families <- head(total_sales[order(-total_sales$sales), ], 10)

# Create a bar chart for the top 10 families
chart <- ggplot(top_10_families, aes(x = family, y = sales)) +
  geom_bar(stat = "identity", fill = "blue") +
  xlab("Family") +
  ylab("Sales") +
  ggtitle("Top 10 Families by Sales")

# Convert the chart to a character representation
chart_text <- capture.output(print(chart))

# Print the chart as text
cat(chart_text, sep = "\n")

print(top_10_families)

# Conclusion: Grocery I - 283910037, BEVERAGES - 194170976 


