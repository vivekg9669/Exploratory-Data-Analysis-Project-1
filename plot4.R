filename <- "GCdataset.zip"

##Downloading and unzipping the dataset:
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL, filename, mode = "wb")
}  
if (!file.exists("household_power_consumption")) { 
  unzip(filename) 
}

data <- read.table('household_power_consumption.txt', sep=";", header=TRUE, stringsAsFactors=FALSE) 

requiredData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

requiredData$date_time <- strptime(paste(requiredData$Date, requiredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2, 2)) 

with(requiredData, plot(date_time, as.numeric(Global_active_power), type="l", xlab="", ylab="Global Active Power"))

with(requiredData, plot(date_time, as.numeric(Voltage), type="l", xlab="datetime", ylab="Voltage"))

with(requiredData, plot(date_time, as.numeric(Sub_metering_1), type="l", ylab="Energy Submetering", xlab=""))
with(requiredData, lines(date_time, as.numeric(Sub_metering_2), type="l", col="red"))
with(requiredData, lines(date_time, as.numeric(Sub_metering_3), type="l", col="blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

with(requiredData, plot(date_time, as.numeric(Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power"))

dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()