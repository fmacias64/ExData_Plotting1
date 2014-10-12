# obtaining data, pipe of grep command was used to restrict data loading to just a subset of the file
filename <- "/Users/felipe/Downloads/household_power_consumption.txt"
datos <- read.table(pipe('grep "^[1-2]/2/2007" "/Users/felipe/Downloads/household_power_consumption.txt"'),header=FALSE,sep=";",colClasses=c("character", "character", rep("numeric",7)),na="?")
# Names are restaured
names(datos) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#date time is dully typed and formatted
datos$Time <- strptime(paste(datos$Date, datos$Time), "%d/%m/%Y %H:%M:%S")
datos$Date <- as.Date(datos$Date, "%d/%m/%Y")
#the plot
png("/Users/felipe/Downloads/plot4.png", width=480, height=480)
par(mfrow=c(2,2),mar = c(4, 4, 1, 2))

# plotting Global Active Power & Voltage
plot(datos$Time, datos$Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(datos$Time, datos$Voltage, type="l",xlab="datetime", ylab="Voltage")

# plotting Submetering
plot(datos$Time, datos$Sub_metering_1, type="l", col="black",xlab="", ylab="Energy sub metering")
lines(datos$Time, datos$Sub_metering_2, col="red")
lines(datos$Time, datos$Sub_metering_3, col="blue")
legend("topright",col=c("black", "red", "blue"),c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.9,lty=1,box.lwd=0)
plot(datos$Time, datos$Global_reactive_power, type="l",xlab="datetime", ylim=c(0,0.5),ylab="Global_reactive_power")
lines(datos$Time, datos$Global_reactive_power)
dev.off()