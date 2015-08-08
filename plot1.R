install.packages("readr")
library(readr)

hpc <- read_csv2("household_power_consumption.txt", col_names=TRUE, col_types="ccnnnnnnn")


par(mfrow = c(1,1), mar = c(4,4,4,2))
hist(hpc$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")



