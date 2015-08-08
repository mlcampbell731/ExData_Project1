install.packages("readr")
library(readr)

install.packages("dplyr")
library(dplyr)

hpc <- read_csv2("household_power_consumption.txt", col_names=TRUE, col_types="ccnnnnnnn")

hpc_sub <- filter(hpc, as.Date(hpc$Date, "%d/%m/%Y") == "2007-02-01" | as.Date(hpc$Date, "%d/%m/%Y") == "2007-02-02")

datetime <- strptime(paste(hpc_sub$Date, hpc_sub$Time), "%d/%m/%Y %H:%M:%S")


par(mar = c(5,5,4,2))
plot(datetime, hpc_sub$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")



dev.copy(png, file = "plot2.png")
dev.off()
