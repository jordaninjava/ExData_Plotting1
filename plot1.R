

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

# Creates plot in graphical device
png("plot1.png", width=480, height=480)
# Generates graph

hist(data$Global_active_power, col = 'red', main= "Global Active Power", xlab= "Global Active Power")

#Closes graphical device and produces graph 
dev.off()




