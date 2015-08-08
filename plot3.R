install.packages("readr")
library(readr)

install.packages("dplyr")
library(dplyr)

hpc <- read_csv2("household_power_consumption.txt", col_names=TRUE, col_types="ccnnnnnnn")

hpc_sub <- filter(hpc, as.Date(hpc$Date, "%d/%m/%Y") == "2007-02-01" | as.Date(hpc$Date, "%d/%m/%Y") == "2007-02-02")
hpc_sub <- mutate(hpc_sub, Day = format(strptime(paste(hpc_sub$Date, hpc_sub$Time), "%d/%m/%Y %H:%M:%S"), '%a'))


par(mar = c(5,5,4,2))

plot(hpc_sub$Sub_metering_3,ylab = "Energy Sub Metering", ann = FALSE)
lines(hpc_sub$Sub_metering_1, col = "black")
lines(hpc_sub$Sub_metering_2, col = "red")
lines(hpc_sub$Sub_metering_3, col = "blue")
