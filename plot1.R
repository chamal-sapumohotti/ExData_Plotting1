pd <- read.csv("household_power_consumption.txt", sep=";")
pd$Date <- as.Date(pd$Date, format="%d/%m/%Y")

startDate <- as.Date("2007-02-01")
endDate <- as.Date("2007-02-02")

pd <- pd[pd$Date >= startDate & pd$Date <= endDate,  ]
pd$Global_active_power <- as.numeric(pd$Global_active_power) /1000 #convert into kw.

png("plot1.png", width=480, height=480)
hist(pd$Global_active_power, col="red", xlab="Global Active Power(kilowatts)", ylab="Frequency", main="Global Active Power")
dev.off()