library(data.table)
ex.proj1 <- fread("household_power_consumption.txt", sep=";", header=TRUE)
ex.proj1$Date <- as.Date(ex.proj1$Date, "%d/%m/%Y")
ex.proj1 <- ex.proj1[ex.proj1$Date>="2007-02-01" & ex.proj1$Date<="2007-02-02",]
ex.proj1 <- as.data.frame(ex.proj1)
ex.proj1$Time.1 <- strptime(paste(ex.proj1$Date, ex.proj1$Time), "%Y-%m-%d %H:%M:%S")
ex.proj1$Global_active_power.1 <- as.numeric(ex.proj1$Global_active_power)
ex.proj1$Global_reactive_power.1 <- as.numeric(ex.proj1$Global_reactive_power)
ex.proj1$Voltage.1 <- as.numeric(ex.proj1$Voltage)
ex.proj1$Global_intensity.1 <- as.numeric(ex.proj1$Global_intensity)
ex.proj1$Sub_metering_1.1 <- as.numeric(ex.proj1$Sub_metering_1)
ex.proj1$Sub_metering_2.1 <- as.numeric(ex.proj1$Sub_metering_2)

par(mfcol=c(2,2), mar=c(5,5,2,1))
plot(ex.proj1$Time.1, ex.proj1$Global_active_power.1, type="l", ylab="Global Active Power", xlab="")
plot(ex.proj1$Time.1, ex.proj1$Sub_metering_1.1, type="l", col="black", ylab="Energy sub metering", xlab="")
lines(ex.proj1$Time.1, ex.proj1$Sub_metering_2.1, type="l", col="red")
lines(ex.proj1$Time.1, ex.proj1$Sub_metering_3, type="l", col="blue")
legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n", cex=0.6)
plot(ex.proj1$Time.1, ex.proj1$Voltage, type="l", col="black", xlab="datetime", ylab="Voltage")
plot(ex.proj1$Time.1, ex.proj1$Global_reactive_power, type="l", col="black", xlab="datetime", ylab="Global_reactive_power")
dev.copy(png, file="plot4.png", width=480, height=480, units="px")
dev.off()
