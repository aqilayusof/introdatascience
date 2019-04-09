#set working directory
setwd("This PC/Documents/exdata_data_household_power_consumption/")

library(data.table)

## Getting full dataset
DT<-fread("./household_power_consumption.txt", na.strings="?")

DT$Date <- as.Date(DT$Date, format="%d/%m/%Y")

## Subsetting the data
DT.filter <- subset(DT, subset=(Date >= "2006-12-16" & Date <= "2006-12-17"))
rm(DT)

## Converting dates
datetime <- paste(as.Date(DT.filter$Date), DT.filter$Time)
DT.filter$Datetime <- as.POSIXct(datetime)

#output histogram to PNG
plot(DT.filter$Global_reactive_power~DT.filter$Datetime, type="l",
     ylab="Global Reactive Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)

dev.off()
