unzip("exdata%2Fdata%2Fhousehold_power_consumption.zip")
house_hold_power <- read.table("./household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")
house_hold_power_2007 <-subset(house_hold_power, Date == "1/2/2007"|Date =="2/2/2007")
house_hold_power_2007$Date <- as.Date(house_hold_power_2007$Date,"%d/%m/%Y")
house_hold_power_2007$Time <- format(strptime(house_hold_power_2007$Time,"%X"),format = "%H:%M:%S")
png(filename = "Plot 1.png",width = 480, height = 480,bg = "white")
hist(house_hold_power_2007$Global_active_power,col = "red",main = "Global Active Power",xlab = "Global Active Power(kilowatts)")
dev.off()
