

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

hist(as.numeric(requiredData$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()