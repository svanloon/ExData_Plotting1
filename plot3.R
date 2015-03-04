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

# extract data for plot
dateTimePaste <- paste(householdPowerConsumption$Date, householdPowerConsumption$Time)
dateTime <- strptime(dateTimePaste, format="%d/%m/%Y %H:%M:%S")
submetering1 <- as.numeric(householdPowerConsumption$Sub_metering_1)
submetering2 <- as.numeric(householdPowerConsumption$Sub_metering_2)
submetering3 <- as.numeric(householdPowerConsumption$Sub_metering_3)

# create png, create plot, close device
png("plot3.png", width=480, height=480, units="px")
par(mfrow=c(1,1))
plot(dateTime, submetering1, type="l", col="black", ylab="Energy sub metering", xlab="")
lines(dateTime, submetering2, type="l", col="red")
lines(dateTime, submetering3, type="l", col="blue")
legend("topright", 
       lty=1, 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
dev.off()
