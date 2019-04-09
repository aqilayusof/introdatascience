#set working directory
setwd("This PC/Documents/exdata_data_household_power_consumption/")

#load library data.table
library(data.table)

DT<-fread("./household_power_consumption.txt", na.strings="?")

#set date as d:m:y
DT$strDate <- as.Date(DT$Date,"%d/%m/%Y")

#select data 
DT.filter<-DT[DT$strDate=="2006-12-16" | DT$strDate=="2007-02-02",]
DT.filter$Global_reactive_power<-as.numeric(DT.filter$Global_reactive_power)
rm(DT)

#output histogram to PNG
png(filename="plot1.png", width=480, height=480)
hist(DT.filter$Global_reactive_power, 
     col="blue", 
     xlab="Global Reactive Power (kilowatts)", 
     main="Global Reactive Power")
dev.off()

