setwd("~/GitHub/ExData_Plotting1")

source("load_data.R")

plot4 <- paste(getwd(), "/graphs/plot4.png", sep = "")
if(!file.exists(plot4)){
        png("graphs/plot4.png", width = 480, height = 480)
        par(mfrow=c(2,2))	
        plot(convdata$Time, convdata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
        plot(convdata$Time, convdata$Voltage, type = "l", xlab = "datetime", ylab = "Global Active Power")
        plot(convdata$Time, convdata$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
        lines(convdata$Time, convdata$Sub_metering_2, type="l", col="red")
        lines(convdata$Time, convdata$Sub_metering_3, type="l", col="blue")
        legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, col=c("black", "red", "blue"))
        plot(convdata$Time, convdata$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global Active Power")
        dev.off()
} else {
        par(mfrow=c(2,2))	
        plot(convdata$Time, convdata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
        plot(convdata$Time, convdata$Voltage, type = "l", xlab = "datetime", ylab = "Global Active Power")
        plot(convdata$Time, convdata$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
        lines(convdata$Time, convdata$Sub_metering_2, type="l", col="red")
        lines(convdata$Time, convdata$Sub_metering_3, type="l", col="blue")
        legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, col=c("black", "red", "blue"))
        plot(convdata$Time, convdata$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global Active Power")
}
