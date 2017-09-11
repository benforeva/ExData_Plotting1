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

## Plot figures
par(mfcol = c(2, 2), bg = "transparent")

## Figure [1,1]
with(h_2days, 
     plot(
         Time, 
         Global_active_power, 
         type = "l",
         xlab = "",
         ylab = "Global Active Power"))

## Figure [2,1]
with(h_2days, 
     plot(
         Time, 
         Sub_metering_1, 
         type = "l",
         xlab = "",
         ylab = "Energy sub metering"))
with(h_2days, 
     lines(
         Time, 
         Sub_metering_2, 
         col = "red"))
with(h_2days, 
     lines(
         Time, 
         Sub_metering_3, 
         col = "blue"))
legend(
    "topright", 
    col = c("black", "red", "blue"), 
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
    lty = "solid", 
    bty = "n",
    lwd = 1)

## Figure [1,2]
with(h_2days, 
     plot(
         Time, 
         Voltage, 
         type = "l",
         xlab = "datetime",
         ylab = "Voltage"))

## Figure [2,2]
with(h_2days, 
     plot(
         Time, 
         Global_reactive_power, 
         type = "l",
         xlab = "datetime"))

## Copy figure to png file
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()