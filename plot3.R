install.packages("readr")
library(readr)

install.packages("dplyr")
library(dplyr)

hpc <- read_csv2("household_power_consumption.txt", col_names=TRUE, col_types="ccnnnnnnn")

hpc_sub <- filter(hpc, as.Date(hpc$Date, "%d/%m/%Y") == "2007-02-01" | as.Date(hpc$Date, "%d/%m/%Y") == "2007-02-02")

datetime <- strptime(paste(hpc_sub$Date, hpc_sub$Time), "%d/%m/%Y %H:%M:%S")


par(mar = c(5,5,4,2))
png("plot3.png", width = 480, height = 480)

plot(datetime, hpc_sub$Sub_metering_1, type="s", xlab = "", ylab = "Energy sub metering")
lines(datetime, hpc_sub$Sub_metering_2, col = "red")
lines(datetime, hpc_sub$Sub_metering_3, col = "blue")

legend("topright", lty = "solid", col = c("black", "red", "blue"), legend = names(hpc_sub)[7:9], cex = 1)

dev.off()