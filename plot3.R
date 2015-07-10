# get data if not already downloaded and loaded into R
if (!exists("EPCdata", mode="list")) {
    #setwd("C:/Users/Core-i5/Desktop/dataSci/4 Explr data/W1")
    source("getEPCdata.R")
}

# make plot3
par(mfrow=c(1,1), mar = c(4, 5, 2, 1), oma = c(0, 0, 1, 0), cex.lab=1)
with(EPCdata, plot(Datetime, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type="n"))
with(EPCdata, points(Datetime, Sub_metering_1, type="l", col="darkgrey"))
with(EPCdata, points(Datetime, Sub_metering_2, type="l", col="red"))
with(EPCdata, points(Datetime, Sub_metering_3, type="l", col="blue"))
legend("topright", lwd=2, col = c("darkgrey", "red", "blue"), legend = c("Sub_metering_1                ", "Sub_metering_2                ", "Sub_metering_3                "), bty = "0", cex=0.8)

# save to file, overwrite if exist
dev.copy(png, filename="plot3.png", width = 480, height = 480);
dev.off()