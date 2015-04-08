Sys.setlocale("LC_TIME","English")

x<-read.csv("household_power_consumption.txt", skip=66637, nrows=2880, sep=";", header=FALSE, 
               col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                           "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))


png(filename="plot3.png", width = 480, height = 480)

x$DateTime<-mapply(paste, x$Date, x$Time, USE.NAMES=FALSE)


x$DateTime<-strptime(x$DateTime,"%d/%m/%Y %H:%M:%S")

with(x, plot(DateTime, Sub_metering_1, xlab="", ylab="Energy sub metering", type="n"))


lines(x$DateTime, x$Sub_metering_1)
lines(x$DateTime, x$Sub_metering_2, col="red")
lines(x$DateTime, x$Sub_metering_3, col="blue")

legend("topright", lty=c(1,1,1), col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()