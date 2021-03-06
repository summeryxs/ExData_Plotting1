unzip("exdata%2Fdata%2Fhousehold_power_consumption.zip")
house_hold_power <- read.table("./household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")
house_hold_power_2007 <-subset(house_hold_power, Date == "1/2/2007"|Date =="2/2/2007")
t <- strptime(paste(house_hold_power_2007$Date, house_hold_power_2007$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
house_hold_power_2007$Date <- t
png(filename = "Plot 4.png",width = 480, height = 480,bg = "white")
par(mfrow=c(2,2),mar =c(4,4,2,1),oma = c(0,0,2,0))
with(house_hold_power_2007,{plot(Date,Global_active_power,type = "l",xlab = "",ylab = "Global Active Power")
  plot(Date,Voltage,type = "l",xlab = "datetime",ylab = "Voltage")
  {plot(Date,Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering")
with(house_hold_power_2007,points(Date,Sub_metering_2,type = "l",col = "red"),xlab = "",ylab = "")
with(house_hold_power_2007,points(Date,Sub_metering_3,type = "l",col = "blue"),xlab = "",ylab = "")
legend("topright",pch = 1, col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n")}
  plot(Date,Global_reactive_power,type = "l",xlab = "datetime")})
dev.off()