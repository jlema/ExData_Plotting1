## Assumes sqldf is installed 
## install.packages("sqldf")
## Load sqldf library
library(sqldf)
## Filter data file to only records for Feb. 1, 2007 and Feb. 2, 2007
hpc <- read.csv.sql(file = "household_power_consumption.txt", sep = ";", sql = "select * from file where Date in ('1/2/2007', '2/2/2007')")
## Concatenate Date and Time columns together and transform to POSIXct, assuming GMT
DateTime <- as.POSIXct(paste(hpc$Date, hpc$Time, sep = " "), format="%d/%m/%Y %H:%M:%S", tz = "GMT")
## Open PNG device so we can plot to it
png("plot2.png", width = 480, height = 480)
## Make background transparent
par(bg = NA)
## Plot required line graph
plot(x = DateTime, y = hpc$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
## Flush device buffer so PNG file gets saved
dev.off()