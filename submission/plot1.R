## Assumes sqldf is installed 
## install.packages("sqldf")
## Load sqldf library
library(sqldf)
## Filter data file to only records for Feb. 1, 2007 and Feb. 2, 2007
hpc <- read.csv.sql(file = "household_power_consumption.txt", sep = ";", sql = "select * from file where Date in ('1/2/2007', '2/2/2007')")
##hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
## Open PNG device so we can plot to it
png("plot1.png", width = 480, height = 480)
## Make background transparent
par(bg = NA)
## Plot required histogram
hist(x = hpc$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
## Flush device buffer so PNG file gets saved
dev.off()