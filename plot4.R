library(dplyr)
setwd("data")
power <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE,
                    na.strings = "?")
power$Date <- as.Date(power$Date, "%d/%m/%Y")
power <- filter(power, Date == "2007-02-01" | Date == "2007-02-02")
power$DateTime <- strptime(paste(power$Date, power$Time, sep = " "), "%Y-%m-%d %H:%M:%S")
setwd("../")
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
## plot top left
plot(power$DateTime, power$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
## plot top right
plot(power$DateTime, power$Voltage, type = "l",
     ylab = "Voltage", xlab = "datetime")
## plot bottom left
plot(power$DateTime, power$Sub_metering_1, type = "n",
     ylab = "Energy Sub Metering", xlab = "")
points(power$DateTime, power$Sub_metering_1, col = "grey", type = "l")
points(power$DateTime, power$Sub_metering_2, col = "red", type = "l")
points(power$DateTime, power$Sub_metering_3, col = "blue", type = "l")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("grey", "red", "blue"), lwd = 5)
## plot bottom right
plot(power$DateTime, power$Global_reactive_power, type = "l",
     ylab = "Global_reactive_power", xlab = "datetime")
dev.off()