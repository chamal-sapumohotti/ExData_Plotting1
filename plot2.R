pd <- read.csv("household_power_consumption.txt", sep=";")
pd$Date <- as.Date(pd$Date, format="%d/%m/%Y")

startDate <- as.Date("2007-02-01")
endDate <- as.Date("2007-02-02")

pd <- pd[pd$Date >= startDate & pd$Date <= endDate,  ]
pd$FullTimeStr <- paste(as.character(pd$Date), pd$Time, " ")
pd$FullTime <- strptime(pd$FullTimeStr, format="%Y-%m-%d %H:%M:%S")

pd$Global_active_power <- as.numeric(pd$Global_active_power) /1000 #convert into kw.

png("plot2.png", width=480, height=480)
plot(pd$FullTime, pd$Global_active_power, type="l", xlab="", ylab="Global Active Power(kilowatts)")
dev.off()
