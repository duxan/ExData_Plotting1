# get data if not already downloaded and loaded into R
if (!exists("EPCdata", mode="list")) {
    #setwd("C:/Users/Core-i5/Desktop/dataSci/4 Explr data/W1")
    source("getEPCdata.R")
}

# make plot2
par(mfrow=c(1,1), mar = c(4, 5, 2, 1), oma = c(0, 0, 1, 0), cex.lab=1)
with(EPCdata, plot(Datetime, Global_active_power, type="l", ylab = "Global Active Power (kilowatts)"))

# save to file, overwrite if exist
dev.copy(png, filename="plot2.png", width = 480, height = 480);
dev.off()