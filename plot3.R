data <-  read.csv2("household_power_consumption.txt", stringsAsFactors = F)
sub_data <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
sub_data$Date <- as.Date(sub_data$Date, format="%d/%m/%Y")
datatime <- paste(as.Date(sub_data$Date), sub_data$Time)
sub_data$datatime <- as.POSIXct(datatime)

with(sub_data, {
    plot(Sub_metering_1~datatime, type="l",
         ylab = "Global active power (kilowatts)", xlab="")
    lines(Sub_metering_2~datatime, col="Red")
    lines(Sub_metering_3~datatime, col="Blue")
})
legend("topright", col=c("black", "red", "blue"), lty = 1, lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()




