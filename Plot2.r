# Set Working Directory
setwd("C:/Users/61310358/Documents/ExploratoryData/Week1")

# Create directory if it doesn't exist
if(!file.exists('data')) dir.create('data')
fname <- "./data/household_power_consumption.zip"

# Download file if it doesn'texist
if (!file.exists(fname)){
  fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
  download.file(fileUrl, destfile = './data/household_power_consumption.zip')
  unzip('./data/household_power_consumption.zip', exdir = './data')
}

# Read data
files <- file('./data/household_power_consumption.txt')
data <- read.table(text = grep("^[1,2]/2/2007",readLines(files),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')

# Create plot

# Open device and create png file
# convert data and time to specific format
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))
# open device
if(!file.exists('plots')) dir.create('plots')
png(filename = './plots/plot2.png', width = 480, height = 480, units='px')
# plot figure
Sys.setlocale(category = "LC_ALL", locale = "english")
plot(data$DateTime, data$Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatts)', type = 'l')
# close device
dev.off()

