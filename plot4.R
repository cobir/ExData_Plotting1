Sys.setlocale("LC_TIME","English")

x<-read.csv("household_power_consumption.txt", skip=66637, nrows=2880, sep=";", header=FALSE, 
               col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                           "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))


png(filename="plot4.png", width = 480, height = 480)

x$DateTime<-mapply(paste, x$Date, x$Time, USE.NAMES=FALSE)


x$DateTime<-strptime(x$DateTime,"%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))

with(x, {
  plot(DateTime, Global_active_power, xlab="", ylab="Global Active Power", type="n")
  lines(x$DateTime, x$Global_active_power)
  
  plot(DateTime, Voltage, xlab="datetime", type="n")
  lines(x$DateTime, x$Voltage)
  
  plot(DateTime, Sub_metering_1, xlab="", ylab="Energy sub metering", type="n")
  lines(x$DateTime, x$Sub_metering_1)
  lines(x$DateTime, x$Sub_metering_2, col="red")
  lines(x$DateTime, x$Sub_metering_3, col="blue")
  legend("topright", lty=c(1,1,1), col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  plot(DateTime, Global_reactive_power, xlab="datetime", type="n")
  lines(x$DateTime, x$Global_reactive_power)
  
})


dev.off()