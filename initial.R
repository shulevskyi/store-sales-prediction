
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

# Merging train_data, stores_data & holidays_events_data

train_df <- merge(train_data, stores_data, by = 'store_nbr')
train_df <- merge(train_df, oil_data, by = 'date', all.x = TRUE)
colnames(holidays_events_data)[colnames(holidays_events_data) == 'type'] <- 'holiday_type'
train_df <- merge(train_df, holidays_events_data, by = 'date', all.x = TRUE)

# Calculate the percentage of missing values in each column

missing_percent <- colMeans(is.na(train_df)) * 100
print(missing_percent)
columns_to_remove <- names(train_df)[missing_percent > 30]
train_df <- train_df[, !names(train_df) %in% columns_to_remove]




