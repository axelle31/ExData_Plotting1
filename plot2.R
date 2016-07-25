### EXPLORATORY DATA ANALYSIS
### COURSE PROJECT 1

### LOAD DATA

# Include only 2/1/2007 and 2/2/2007
data_file = 'household_power_consumption.txt'

object.size(read.table(text = grep('^[1,2]/2/2007', readLines(data_file), value = TRUE)))

data <- read.table(text = grep('^[1,2]/2/2007', readLines(data_file), value = TRUE),
                   col.names = c('Date', 'Time', 'Global_active_power', 'Global_reactive_power', 'Voltage', 'Global_intensity', 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
                   sep = ';', header = TRUE)

# View dataset
summary(data)
str(data)

# Convert date and time variables to date / time classes
data$DateTime <- strptime(paste(data$Date, data$Time), format = '%d/%m/%Y %H:%M:%S')
data$Date <- as.POSIXct(data$DateTime)

### PLOT DATA

# Generating plot 2
png('plot2.png', width = 480, height = 480, units = 'px')

plot(data$Global_active_power ~ data$Date, type = 'l', xlab = '', ylab = 'Global Active Power (kilowatts)')

dev.off()
