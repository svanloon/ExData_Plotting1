# Load the filtered data
fileName = "household_power_consumption.txt"
names <- read.table(file = fileName,
                    sep = ";",
                    header = TRUE,
                    nrows = 1)
householdPowerConsumption <- read.table(file = fileName,
                                        na.strings = "?",
                                        sep = ";", 
                                        col.names = colnames(names),
                                        skip = 66637,
                                        nrows = 2880)

# extract data for plot
# By concatenating date and time, the labels will be displayed properly on the chart
dateTimeCat <- paste(householdPowerConsumption$Date, householdPowerConsumption$Time)
dateTime <- strptime(dateTimeCat, format="%d/%m/%Y %H:%M:%S")
#Note: the divide by 500 is to get the right scale!!
globalActivePower <- as.numeric(householdPowerConsumption$Global_active_power)

# create png, create plot, close device
# bg = "transparent" would make the graph transparent like the original
png("plot2.png", width=480, height=480, units="px")
plot(dateTime, globalActivePower, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
?plot
