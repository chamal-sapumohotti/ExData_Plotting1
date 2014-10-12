classes <- c("factor", "factor", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
pd <- read.table("household_power_consumption.txt",header=T,  sep=";", na.strings="?", colClasses=classes)
pd$Date <- as.Date(pd$Date, format="%d/%m/%Y")

startDate <- as.Date("2007-02-01")
endDate <- as.Date("2007-02-02")

pd <- pd[pd$Date >= startDate & pd$Date <= endDate,  ]
pd$FullTimeStr <- paste(as.character(pd$Date), pd$Time, " ")
pd$FullTime <- strptime(pd$FullTimeStr, format="%Y-%m-%d %H:%M:%S")


png("plot3.png", width=480, height=480)
plot(pd$FullTime, pd$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
lines(pd$FullTime, pd$Sub_metering_2, col="red")
lines(pd$FullTime, pd$Sub_metering_3, col="blue")

legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
