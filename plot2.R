data <-  read.csv2("household_power_consumption.txt")
subset_data <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
sub_data$Date <- as.Date(sub_data$Date, format="%d/%m/%Y")
datatime <- paste(as.Date(sub_data$Date), sub_data$Time)
sub_data$datatime <- as.POSIXct(datatime)
sub_data$Global_active_power <- as.numeric(sub_data$Global_active_power) 

with(sub_data, {
    plot(Global_active_power~datatime, type="l",
         ylab = "Global active power (kilowatts)", xlab="")
})

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

