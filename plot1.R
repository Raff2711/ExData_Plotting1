data <-  read.csv2("household_power_consumption.txt")
sub_data <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
sub_data$Global_active_power <- as.numeric(sub_data$Global_active_power) 

hist(sub_data$Global_active_power, xlab = "Global Active Power (kilowatts)", 
     col = "red", main = "Global Active Power")

