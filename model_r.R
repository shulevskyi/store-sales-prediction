print("Hello")

url_train <- "https://raw.githubusercontent.com/shulevskyi/store-sales-prediction/main/train.csv"
url_stores <- "https://raw.githubusercontent.com/shulevskyi/store-sales-prediction/main/stores.csv"
url_oil <- "https://raw.githubusercontent.com/shulevskyi/store-sales-prediction/main/oil.csv"
url_holidays_events <- "https://raw.githubusercontent.com/shulevskyi/store-sales-prediction/main/holidays_events.csv"

train_data <- read.csv(url_train)
stores_data <- read.csv(url_stores)
oil_data <- read.csv(url_oil)
holidays_events_data <- read.csv(url_holidays_events)

# Changing the order for $id
train_data$id <- seq_len(nrow(train_data)) - 1


# Filtering
holidays_events_data <- holidays_events_data[holidays_events_data$date >= "2014-01-07", ]
oil_data <- oil_data[oil_data$date >= "2014-01-07", ]

head(train_data)
head(stores_data)
head(oil_data)
head(holidays_events_data)
