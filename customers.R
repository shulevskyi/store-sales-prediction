# Merge train_datas and stores_data by store_nbr
merged_data <- merge(train_datas, stores_data, by = "store_nbr")
# Merge transactions_data by store_nbr
merged_data <- merge(merged_data, transactions_data, by = "store_nbr")

# View the merged data
head(merged_data)
