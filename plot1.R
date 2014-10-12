
classes <- c("factor", "factor", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
pd <- read.table("household_power_consumption.txt",header=T,  sep=";", na.strings="?", colClasses=classes)
pd$Date <- as.Date(pd$Date, format="%d/%m/%Y")

startDate <- as.Date("2007-02-01")
endDate <- as.Date("2007-02-02")

pd <- pd[pd$Date >= startDate & pd$Date <= endDate,  ]

png("plot1.png", width=480, height=480)
hist(pd$Global_active_power, col="red", xlab="Global Active Power(kilowatts)", ylab="Frequency", main="Global Active Power")
dev.off()
