Sys.setlocale("LC_TIME","English")

x<-read.csv("household_power_consumption.txt", skip=66637, nrows=2880, sep=";", header=FALSE, 
               col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                           "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))


png(filename="plot2.png", width = 480, height = 480)

x$DateTime<-mapply(paste, x$Date, x$Time, USE.NAMES=FALSE)


x$DateTime<-strptime(x$DateTime,"%d/%m/%Y %H:%M:%S")

with(x, plot(DateTime, Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="n"))
lines(x$DateTime, x$Global_active_power)

dev.off()