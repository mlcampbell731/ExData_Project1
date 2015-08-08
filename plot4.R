install.packages("readr")
library(readr)

install.packages("dplyr")
library(dplyr)

hpc <- read_csv2("household_power_consumption.txt", col_names=TRUE, col_types="ccnnnnnnn")

hpc_sub <- filter(hpc, as.Date(hpc$Date, "%d/%m/%Y") == "2007-02-01" | as.Date(hpc$Date, "%d/%m/%Y") == "2007-02-02")

datetime <- strptime(paste(hpc_sub$Date, hpc_sub$Time), "%d/%m/%Y %H:%M:%S")


png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

#plot upper left
plot(datetime, hpc_sub$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")

#plot upper right
plot(datetime, hpc_sub$Voltage, type="l", ylab = "Voltage")

#plot lower left
plot(datetime, hpc_sub$Sub_metering_1, type="s", xlab = "", ylab = "Energy sub metering")
lines(datetime, hpc_sub$Sub_metering_2, col = "red")
lines(datetime, hpc_sub$Sub_metering_3, col = "blue")

legend("topright", lty = "solid", col = c("black", "red", "blue"), bty = "n", legend = names(hpc_sub)[7:9])

#plot lower right
plot(datetime, hpc_sub$Global_reactive_power, ylab = "Global_reactive_power",type="l")

dev.off()
