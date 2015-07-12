library(dplyr)
setwd("data")
power <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE,
                    na.strings = "?")
power$Date <- as.Date(power$Date, "%d/%m/%Y")
power <- filter(power, Date == "2007-02-01" | Date == "2007-02-02")
setwd("../")
png(filename = "plot1.png", width = 480, height = 480)
hist(power$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)",
     main =  "Global Active Power")
dev.off()
