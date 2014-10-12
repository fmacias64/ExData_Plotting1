# obtaining data, pipe of grep command was used to restrict data loading to just a subset of the file

datos <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=FALSE,sep=";",colClasses=c("character", "character", rep("numeric",7)),na="?")
# Names are restaured
names(datos) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#date time is dully typed and formatted
datos$Time <- strptime(paste(datos$Date, datos$Time), "%d/%m/%Y %H:%M:%S")
datos$Date <- as.Date(datos$Date, "%d/%m/%Y")
#the plot
png("plot3.png", width=480, height=480)
plot(datos$Time, datos$Sub_metering_1, type="l", col="black",xlab="", ylab="Energy sub metering")
lines(datos$Time, datos$Sub_metering_2, col="red") 
lines(datos$Time, datos$Sub_metering_3, col="blue")
legend("topright",col=c("black", "red", "blue"),c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1)
dev.off()