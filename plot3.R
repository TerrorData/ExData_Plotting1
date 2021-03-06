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
SM1 <- DT$Sub_metering_1
SM2 <- DT$Sub_metering_2
SM3 <- DT$Sub_metering_3

#  Caluculate max y range
#
y_1 <- max(SM1)
y_2 <- max(SM2)
y_3 <- max(SM3)
y_lim <- max(c(y_1,y_2,y_3))

# Initialize plot colors
#
plot_colors <- c("black","red","blue")

# Start PNG device driver
#
png(filename="plot3.png",height=480,width=480,bg="white")

# plot sub metering
#
plot(DateTime, SM1, type="l", col=plot_colors[1],
     ylim=c(0,y_lim), xlab="",ylab="Energy sub metering")
lines(DateTime, SM2, type="l", col=plot_colors[2])
lines(DateTime, SM3, type="l", col=plot_colors[3])

# Plot legend
#
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.8,
       col=plot_colors,lty=1)

# Close graphic driver
dev.off()