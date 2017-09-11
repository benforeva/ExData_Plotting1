## Read data
house <- read.table(
            "household_power_consumption.txt", 
            header = TRUE, 
            sep = ";", 
            na.strings = c("?"))

## Convert Date and Time
house$Date <- as.Date(house$Date, "%d/%m/%Y") 
house$Time <- strptime(house$Time, "%H:%M:%S")

## Get required dates in February
h_2days <- rbind(
            subset(house, Date == "2007-02-1"), 
            subset(house, Date == "2007-02-2")
            )

## Plot figure
par(mfrow = c(1, 1), bg = "transparent")
with(h_2days, 
     hist(
        Global_active_power, 
        col = "red",
        xlab = "Global Active Power (kilowatts)", 
        main = "Global Active Power"))

## Copy figure to png file
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()