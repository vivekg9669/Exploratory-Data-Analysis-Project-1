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

with(requiredData, plot(date_time, as.numeric(Global_active_power), type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()