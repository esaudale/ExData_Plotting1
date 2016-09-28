pcons <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE)
pcons$DTIME <- with(pcons, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))
pset <- subset(pcons, Date %in% c('1/2/2007', '2/2/2007'))
gap <- as.numeric(as.character(pset$Global_active_power))
png(filename="Plot2.png", width = 480, height = 480, units = "px")
plot(pset$DTIME, as.numeric(as.character(pset$Global_active_power)), xlab="", ylab="Global Active Power (kilowatts)", pch = 26)
lines(pset$DTIME, as.numeric(as.character(pset$Global_active_power)))
dev.off()
	
