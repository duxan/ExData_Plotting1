# get data if not already downloaded and loaded into R
if (!exists("EPCdata", mode="list")) {
    #setwd("C:/Users/Core-i5/Desktop/dataSci/4 Explr data/W1")
    source("getEPCdata.R")
}

# make plot1
hist(EPCdata$Global_active_power, col = "red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")

# save to file, overwrite if exist
dev.copy(png, filename="plot1.png", width = 480, height = 480);
dev.off()