# get data if not already downloaded and loaded into R
if (!exists("EPCdata", mode="list")) {
    #setwd("C:/Users/Core-i5/Desktop/dataSci/4 Explr data/W1")
    source("getEPCdata.R")
}

# make plot4
par(mfrow=c(2,2), mar = c(4, 5, 2, 1), oma = c(0, 0, 1, 0), cex.lab=1)
with(EPCdata, plot(Datetime, Global_active_power, type="l", ylab = "Global Active Power", xlab = ""))
with(EPCdata, plot(Datetime, Voltage, type="l", ylab = "Voltage", xlab = "datetime"))
with(EPCdata, plot(Datetime, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type="n"))
with(EPCdata, points(Datetime, Sub_metering_1, type="l", col="darkgrey"))
with(EPCdata, points(Datetime, Sub_metering_2, type="l", col="red"))
with(EPCdata, points(Datetime, Sub_metering_3, type="l", col="blue"))
legend("topright", lwd=2, col = c("darkgrey", "red", "blue"), legend = c("Sub_metering_1                ", "Sub_metering_2                ", "Sub_metering_3                "), bty = "n", cex=0.6)
with(EPCdata, plot(Datetime, Global_reactive_power, type="l", xlab = "datetime"))

# save to file, overwrite if exist
dev.copy(png, filename="plot4.png", width = 480, height = 480);
dev.off()