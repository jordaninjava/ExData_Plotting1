
# Read data into R
dataComplete <- read.table("./household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors= FALSE)

# Convert dates to date class
dataComplete$Date <- as.Date(dataComplete$Date, format= "%d/%m/%Y")

# Subsets to focussed dates for analysis
data <- subset(dataComplete, Date >= "2007-02-01" & Date <= "2007-02-02")

# Removes complete data table
rm(dataComplete)

# Combines date and time
dateTime <- as.POSIXct(paste(data$Date, data$Time), format= "%Y- %m-%d %H:%M:%S")

# Converts to numeric
subMetering1 <- as.numeric(data$Sub_metering_1)
subMetering2 <- as.numeric(data$Sub_metering_2)
subMetering3 <- as.numeric(data$Sub_metering_3)
globalActivePower <- as.numeric(data$Global_active_power)
globalReactivePower <- as.numeric(data$Global_reactive_power)

voltage <- as.numeric(data$Voltage)

# Creates plot in graphical device
png("plot4.png", width=480, height=480)

# Creates grid for graphs
par(mfrow = c(2,2))

#Generate Graphs
plot(dateTime, globalActivePower, type="l", ylab="Global Active Power (kilowatts)")

plot(dateTime, voltage, type="l", ylab="Voltage")

plot(dateTime, subMetering1, type = "l", ylab = "Energy Sub metering" )
lines(dateTime, subMetering2, col ="red", type = "l")
lines(dateTime, subMetering3, col="blue", type = "l")
legend("topright", legend= c("Sub Metering 1", "Sub Metering 2", "Submetering 3"), bty="o", lty = c(1,1), col = c("black", "red", "blue"), cex=0.3)


plot(dateTime, globalReactivePower, type="l", ylab="Global Rective Power")


#Closes graphical device and produces graph 
dev.off()