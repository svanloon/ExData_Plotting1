fileName = "household_power_consumption.txt"

# If the data file doesn't exist, then download and unzip data
if(!file.exists(fileName)) {
  zipFileName <- "household_power_consumption.zip"
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                destfile=zipFileName, 
                method="curl", 
                mode="wb")
  unzip(zipFileName, fileName)
}

# Load and filter the data
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

# create data for plot
globalActivePower <- as.numeric(householdPowerConsumption$Global_active_power)

# Open png device, create plot, and close device
# bg = "transparent" would make the background transparent, but left off to avoid confusion
png("plot1.png", width=480, height=480, units="px") 
hist(globalActivePower, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
