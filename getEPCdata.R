# 1. set WD
#setwd("C:/Users/Core-i5/Desktop/dataSci/4 Explr data/W1")

# 2. make folder
if(!file.exists("./data")){
    dir.create("./data")
}

# 3. make handle
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"   

# 4. download data
download.file(fileURL, destfile = "./data/epc.zip", method = "curl")  

# 5. unzip file
unzip("./data/epc.zip", exdir = "./data")   

# 6. calculations 
tmp <- 2100000*9*8 # 8 bits per numeric type value, source> http://www.r-bloggers.com/predicting-the-memory-usage-of-an-r-object-containing-numbers/
class(tmp) = "object_size"
print(paste("Whole dataset would take ~", format(tmp, units="Mb"), "of memory"))
rm(tmp)

# 7. read subset of dataset
library(sqldf)
EPCdata <- read.csv.sql("./data/household_power_consumption.txt", sep=";", sql = "select * from file where Date in ('1/2/2007', '2/2/2007')", colClasses = rep("character", 9))
tmp <- object.size(EPCdata)
print(paste("Loaded subset dataset takes ~", format(tmp, units="Mb"), "of memory"))
rm(tmp)
closeAllConnections()

# 8. Deal with missing values
EPCdata[,3:9] <- lapply(EPCdata[,3:9], as.numeric)

# 9. Tidying
EPCdata$Datetime <- paste(EPCdata$Date, EPCdata$Time)
EPCdata <- EPCdata[,c(10, 3:9)]
EPCdata$Datetime <- strptime(EPCdata$Datetime, format = "%d/%m/%Y %T")
