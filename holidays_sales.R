library(ggplot2)

# Convert date columns to appropriate format
oil_data$date <- as.Date(oil_data$date)
train_data$date <- as.Date(train_data$date)
holidays_events_data$date <- as.Date(holidays_events_data$date)

train_datas <- merge(train_data, oil_data[, c("date", "dcoilwtico")], by = "date", all.x = TRUE)




# Value used to transform the data
coeff <- 0.001

graph <- ggplot(train_datas, aes(x = date)) +
  geom_line(aes(y = sales)) + 
  geom_line(aes(y = dcoilwtico / coeff)) + # Divide by 10 to get the same range as the temperature
  scale_y_continuous(
    # Features of the first axis
    name = "Sales",
    # Add a second axis and specify its features
    sec.axis = sec_axis(~.*coeff, name = "Oil Price")
  )

# Add red lines for holidays
graph <- graph + geom_vline(data = holidays_events_data, aes(xintercept = as.numeric(date)), color = "red", alpha = 0.2)

print(graph)


  
  