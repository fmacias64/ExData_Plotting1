
# obtaining data, pipe of grep command was used to restrict data loading to just a subset of the file


datos <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=FALSE,sep=";",colClasses=c("character", "character", rep("numeric",7)),na="?")

# Names are restaured
names(datos) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

hist(datos$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main = "Global Active Power")

# command for sending the plot to plot1.png

dev.copy(png, file = "plot1.png",width = 480, height = 480) ## Copy my plot to a PNG file 
dev.off()
