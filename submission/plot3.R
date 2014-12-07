## Assumes sqldf is installed 
## install.packages("sqldf")
## Load sqldf library
library(sqldf)
## Filter data file to only records for Feb. 1, 2007 and Feb. 2, 2007
hpc <- read.csv.sql(file = "household_power_consumption.txt", sep = ";", sql = "select * from file where Date in ('1/2/2007', '2/2/2007')")
## Concatenate Date and Time columns together and transform to POSIXct, assuming GMT
DateTime <- as.POSIXct(paste(hpc$Date, hpc$Time, sep = " "), format="%d/%m/%Y %H:%M:%S", tz = "GMT")
## Open PNG device so we can plot to it
png("plot3.png", width = 480, height = 480)
## Make background transparent
par(bg = NA)
## Plot graph
## Plot sub metering 1 in black
plot(x = DateTime, y = hpc$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
## Plot sub metering 2 in red
lines(x = DateTime, y = hpc$Sub_metering_2, col = "red")
## Plot sub metering 3 in blue
lines(x = DateTime, y = hpc$Sub_metering_3, col = "blue")
## Add legend at top right
legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col=c("black","red","blue"))
## Flush device buffer so PNG file gets saved
dev.off()