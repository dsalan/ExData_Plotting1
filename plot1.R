setwd("C:/Users/Diego/Documents/R")

raw_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

raw_data$Date <- as.Date(raw_data$Date, "%d/%m/%Y")

data <- subset(raw_data,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

data

data <- data[complete.cases(data),]

dateTime <- paste(data$Date, data$Time)

dateTime <- setNames(dateTime, "DateTime")

data <- cbind(dateTime, data)

data$dateTime <- as.POSIXct(dateTime)

data

hist(data$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")

dev.copy(png,"plot1.png", width=480, height=480)

dev.off()
