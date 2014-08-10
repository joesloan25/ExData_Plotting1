#Assume datafile is in working directory and all plots are saved to working directory
#Only 1/2/2007 and 2/2/2007 are read, and then column names are retrieved with a 2nd read
data <-read.table("./household_power_consumption.txt",
                  sep = ";", na.strings = "?", nrows = 2880, skip = 66637)
colnames(data) <- as.character(read.table("./household_power_consumption.txt", sep = ";",
                                         nrow = 1, as.is = 1:9))
png(filename = "plot1.png")
hist(data$Global_active_power, col = "red", main = paste("Global Active Power"),
     xlab = "Global Active Power (kilowatts)")
dev.off()