# Load and filter the data
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

# Open png and set parameters
png("plot4.png", width=480, height=480, units="px")

par(mfrow=c(2,2))

# extract dates for all plots
dateTimePaste <- paste(householdPowerConsumption$Date, householdPowerConsumption$Time)
dateTime <- strptime(dateTimePaste, format="%d/%m/%Y %H:%M:%S")

# Plot #1 - Global Active Power
globalActivePower <- as.numeric(householdPowerConsumption$Global_active_power)
plot(dateTime, globalActivePower, type="l", xlab = "", ylab = "Global Active Power")

# Plot #2 - Voltage
voltage <- as.numeric(householdPowerConsumption$Voltage)
plot(dateTime, voltage,type="l", ylab="Voltage", xlab="datetime")

# Plot #3 - Submetering
# create data
submetering1 <- as.numeric(householdPowerConsumption$Sub_metering_1)
submetering2 <- as.numeric(householdPowerConsumption$Sub_metering_2)
submetering3 <- as.numeric(householdPowerConsumption$Sub_metering_3)

# create plot
plot(dateTime, submetering1, type="l", col="black", ylab="Energy sub metering", xlab="")
lines(dateTime, submetering2, type="l", col="red")
lines(dateTime, submetering3, type="l", col="blue")
legend("topright", 
       lty=1, 
       col = c("black", "red", "blue"),
       bty="n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 

# Plot #4 - Global Reactive Power
globalReactivePower <- as.numeric(householdPowerConsumption$Global_reactive_power)
plot(dateTime, globalReactivePower, type="l", col="black", ylab="Global_reactive_power", xlab="datetime")

dev.off()
