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

with(requiredData, plot(date_time, as.numeric(Sub_metering_1), type="l", ylab="Energy Submetering", xlab=""))
with(requiredData, lines(date_time, as.numeric(Sub_metering_2), type="l", col="red"))
with(requiredData, lines(date_time, as.numeric(Sub_metering_3), type="l", col="blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()