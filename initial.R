
# Load data

url_train <- "https://raw.githubusercontent.com/shulevskyi/store-sales-prediction/main/train.csv"
url_stores <- "https://raw.githubusercontent.com/shulevskyi/store-sales-prediction/main/stores.csv"
url_oil <- "https://raw.githubusercontent.com/shulevskyi/store-sales-prediction/main/oil.csv"
url_holidays_events <- "https://raw.githubusercontent.com/shulevskyi/store-sales-prediction/main/holidays_events.csv"
url_transactions <- "https://raw.githubusercontent.com/shulevskyi/store-sales-prediction/main/transactions.csv"

# Read data

train_data <- read.csv(url_train)
stores_data <- read.csv(url_stores)
oil_data <- read.csv(url_oil)
holidays_events_data <- read.csv(url_holidays_events)
transactions_data <- read.csv(url_transactions)

# Changing the order for $id
train_data$id <- seq_len(nrow(train_data)) - 1


# Filtering by date
holidays_events_data <- holidays_events_data[holidays_events_data$date >= "2014-01-07", ]
oil_data <- oil_data[oil_data$date >= "2014-01-07", ]
transactions_data <- transactions_data[transactions_data$date >= "2014-01-07", ]

head(train_data)
head(stores_data)
head(oil_data)
head(holidays_events_data)

# Merging  by store_nbr

merged_data <- merge(train_data, stores_data, by = "store_nbr")
merged_data <- merge(train_data, oil_data, by = "date")

# Get a sample of 100 observations from transactions_data

library(dplyr)

merged_data_s <- head(merged_data, 100)
merged_data_f <- merge(merged_data_s, transactions_data, by = "store_nbr")


head(merged_data_f)



