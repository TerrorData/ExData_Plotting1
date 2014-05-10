# Readlines 66638 - 69517 for (Feb 1 2007 - Feb 2 2007)
#
DT <- fread(input="data/household_power_consumption.txt", header=TRUE, skip=66636, nrows=2880)

# Add column names stripped from fread skip option
#
setnames(DT, 1:9, c("Date","Time","Global_active_power",
                    "Global_reactive_power","Voltage","Global_intensity",
                    "Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Start PNG device driver
#
png(filename="plot1.png",height=480,width=480,bg="white")

#  Plot histogram
#
hist(DT$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     xaxp=c(0,6,3),
     xlim=c(0,6),
     ylim=c(0,1200) )

#  Close Graphic Device
#
dev.off()