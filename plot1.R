table1<-read.table("./household_power_consumption.txt", 
                   sep=";", header=TRUE, 
                   colClasses = c('character', 'character', 'numeric','numeric', 'numeric', 'numeric','numeric', 'numeric', 'numeric'),
                   na.strings='?')
table1$DateTime <- strptime(paste(table1$Date, table1$Time), 
                          "%d/%m/%Y %H:%M:%S")
table1 <- subset(table1, 
               as.Date(DateTime) >= as.Date("2007-02-01") & 
                   as.Date(DateTime) <= as.Date("2007-02-02"))

png("plot1.png", height=480, width=480)

hist(table1$Global_active_power, col='red', 
     xlab = 'Global Active Power (kilowatts)',
     main = 'Global Active Power')

dev.off()
