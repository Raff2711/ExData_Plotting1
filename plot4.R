data <-  read.csv2("household_power_consumption.txt", stringsAsFactors = F)
sub_data <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
sub_data$Date <- as.Date(sub_data$Date, format="%d/%m/%Y")
datatime <- paste(as.Date(sub_data$Date), sub_data$Time)
sub_data$datatime <- as.POSIXct(datatime)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(sub_data, {
    plot(Global_active_power~datatime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    plot(Voltage~datatime, type="l", 
         ylab="Voltage (volt)", xlab="")
    plot(Sub_metering_1~datatime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~datatime,col='Red')
    lines(Sub_metering_3~datatime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~datatime, type="l", 
         ylab="Global Rective Power (kilowatts)",xlab="")
})

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()