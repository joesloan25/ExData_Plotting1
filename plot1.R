#Assume datafile is in working directory and all plots are saved to working directory
data <-read.table("./household_power_consumption.txt",
                  sep = ";", na.strings = "?", nrows = 2880, skip = 66637)
png(filename = "plot1.png")
hist(data$V3, col = "red", main = paste("Global Active Power"),
     xlab = "Global Active Power (kilowatts)")
dev.off()