Plot3.R
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

#plot the graph with legends
with(DT.filter, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Blue')
  lines(Sub_metering_3~Datetime,col='Red')
})
legend("topright", col=c("black", "blue", "red"), lty=1, lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.75)

## output histogram to PNG
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
