pcons <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE)
pcons$DTIME <- with(pcons, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))
pset <- subset(pcons, Date %in% c('1/2/2007', '2/2/2007'))
gap <- as.numeric(as.character(pset$Global_active_power))
png(filename="Plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
plot(pset$DTIME, as.numeric(as.character(pset$Global_active_power)), xlab="", ylab="Global Active Power (kilowatts)", pch = 26)
lines(pset$DTIME, as.numeric(as.character(pset$Global_active_power)))

plot(pset$DTIME, as.numeric(as.character(pset$Voltage)), xlab="datetime", ylab="Voltage", pch = 26)
lines(pset$DTIME, as.numeric(as.character(pset$Voltage)))

plot(pset$DTIME, as.numeric(as.character(pset$Sub_metering_1)), xlab="", ylab="Energy sub metering", pch = 26)
lines(pset$DTIME, as.numeric(as.character(pset$Sub_metering_1)))
points(pset$DTIME, as.numeric(as.character(pset$Sub_metering_2)), col = "red", pch=26) 
lines(pset$DTIME, as.numeric(as.character(pset$Sub_metering_2)), col="red")
points(pset$DTIME, as.numeric(as.character(pset$Sub_metering_3)), col = "blue", pch=26) 
lines(pset$DTIME, as.numeric(as.character(pset$Sub_metering_3)), col="blue")
legend("topright", pch = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(pset$DTIME, as.numeric(as.character(pset$Global_reactive_power)), xlab="datetime", ylab="Global reactive Power (kilowatts)", pch = 26)
lines(pset$DTIME, as.numeric(as.character(pset$Global_reactive_power)))

dev.off()
