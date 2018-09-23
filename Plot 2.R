unzip("exdata%2Fdata%2Fhousehold_power_consumption.zip")
house_hold_power <- read.table("./household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")
house_hold_power_2007 <-subset(house_hold_power, Date == "1/2/2007"|Date =="2/2/2007")
t <- strptime(paste(house_hold_power_2007$Date, house_hold_power_2007$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
house_hold_power_2007$Date <- t
png(filename = "Plot 2.png",width = 480, height = 480,bg = "white")
plot(house_hold_power_2007$Date,house_hold_power_2007$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power(kilowatts)")
dev.off()