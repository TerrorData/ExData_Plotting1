# Readlines 66638 - 69517
#
DT <- fread(input="data/household_power_consumption.txt", header=TRUE, skip=66636, nrows=2880)

# Add column names stripped from fread
#
setnames(DT, 1:9, c("Date","Time","Global_active_power",
                    "Global_reactive_power","Voltage","Global_intensity",
                    "Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Convert Date and Time
#
DateTime <-strptime(paste(DT$Date, DT$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

# Start PNG device driver
#
png(filename="plot2.png",height=480,width=480,bg="white")

#  Plot the Global Active Power
#
plot(DateTime,DT$Global_active_power,type="l",
     xlab="",ylab="Global Active Power (kilowatts)")

#  Close Graphic Device
#
dev.off()
