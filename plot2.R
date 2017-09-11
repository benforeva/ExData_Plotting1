## Read data
house <- read.table(
    "household_power_consumption.txt", 
    header = TRUE, 
    sep = ";", 
    na.strings = c("?"))

## Convert Date and Time
house$Time <- strptime(
                paste(house$Date, house$Time), 
                "%d/%m/%Y %H:%M:%S")
house$Date <- as.Date(house$Date, "%d/%m/%Y") 


## Get required dates in February
h_2days <- rbind(
    subset(house, Date == "2007-02-1"), 
    subset(house, Date == "2007-02-2"))

## Plot figure
par(mfrow = c(1, 1), bg = "transparent")
with(h_2days, 
     plot(
         Time, 
         Global_active_power, 
         type = "l",
         xlab = "",
         ylab = "Global Active Power (kilowatts)"))

## Copy figure to png file
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()