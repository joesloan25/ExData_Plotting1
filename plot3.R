#Assume datafile is in working directory and all plots are saved to working directory
#Only 1/2/2007 and 2/2/2007 are read, and then column names are retrieved with a 2nd read
#Datetime is added as a 10th column for graphing via transform
data <-read.table("./household_power_consumption.txt",
                  sep = ";", na.strings = "?", nrows = 2880, skip = 66637)
colnames(data) <- as.character(read.table("./household_power_consumption.txt", sep = ";",
                                         nrow = 1, as.is = 1:9))
data <-transform(data, datetime =as.POSIXlt(paste(Date,Time), format ="%d/%m/%Y %H:%M:%S"))

png(filename = "plot3.png")

plot(data$datetime,data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$datetime, data$Sub_metering_2, col = "red")
lines(data$datetime, data$Sub_metering_3, col = "blue")
legend("topright",lty = 1, col= c("black", "red", "blue"), legend = colnames(data)[7:9])

dev.off()