
# obtaining data, pipe of grep command was used to restrict data loading to just a subset of the file

filename <- "/Users/felipe/Downloads/household_power_consumption.txt"
datos <- read.table(pipe('grep "^[1-2]/2/2007" "/Users/felipe/Downloads/household_power_consumption.txt"'),header=FALSE,sep=";",colClasses=c("character", "character", rep("numeric",7)),na="?")

# Since there is no header in the data loaded the xlab label was given
hist(datos[,3],col="red",xlab="Global Active Power (kilowatts)",main = "Global Active Power")

# command for sending the plot to plot1.png

dev.copy(png, file = "/Users/felipe/Downloads/plot1.png",width = 480, height = 480) ## Copy my plot to a PNG file 
dev.off()
