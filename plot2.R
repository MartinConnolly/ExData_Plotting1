library(dplyr)
setwd("data")
power <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE,
                    na.strings = "?")
power$Date <- as.Date(power$Date, "%d/%m/%Y")
power <- filter(power, Date == "2007-02-01" | Date == "2007-02-02")
power$DateTime <- strptime(paste(power$Date, power$Time, sep = " "), "%Y-%m-%d %H:%M:%S")
setwd("../")
png(filename = "plot2.png", width = 480, height = 480)
plot(power$DateTime, power$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()