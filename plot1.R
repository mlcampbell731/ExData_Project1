install.packages("readr")
library(readr)

install.packages("dplyr")
library(dplyr)

hpc <- read_csv2("household_power_consumption.txt", col_names=TRUE, col_types="ccnnnnnnn")

hpc_sub <- filter(hpc, as.Date(hpc$Date, "%d/%m/%Y") == "2007-02-01" | as.Date(hpc$Date, "%d/%m/%Y") == "2007-02-02")

par(mfrow = c(1,1), mar = c(4,4,4,2))
hist(hpc$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")



