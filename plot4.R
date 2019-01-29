table1<-read.table("./household_power_consumption.txt", 
                   sep=";", header=TRUE, 
                   colClasses = c('character', 'character', 'numeric','numeric', 'numeric', 'numeric','numeric', 'numeric', 'numeric'),
                   na.strings='?')
table1$DateTime <- strptime(paste(table1$Date, table1$Time), 
                            "%d/%m/%Y %H:%M:%S")
table1 <- subset(table1, 
                 as.Date(DateTime) >= as.Date("2007-02-01") & 
                     as.Date(DateTime) <= as.Date("2007-02-02"))

png("plot4.png", height=480, width=480)


par(mfrow=c(2,2))

# first plot
plot(table1$DateTime, 
     table1$Global_active_power, 
     pch=NA, 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
lines(table1$DateTime, table1$Global_active_power)

# second plot
plot(table1$DateTime, table1$Voltage, ylab="Voltage", xlab="datetime", pch=NA)
lines(table1$DateTime, table1$Voltage)

# third plot
plot(table1$DateTime, 
     table1$Sub_metering_1, 
     pch=NA, 
     xlab="", 
     ylab="Energy sub metering")
lines(table1$DateTime, table1$Sub_metering_1)
lines(table1$DateTime, table1$Sub_metering_2, col='red')
lines(table1$DateTime, table1$Sub_metering_3, col='blue')
legend('topright', 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1),
       col = c('black', 'red', 'blue'),
       bty = 'n')

# Fourth plot
with(table1, plot(DateTime, Global_reactive_power, xlab='datetime', pch=NA))
with(table1, lines(DateTime, Global_reactive_power))

dev.off()