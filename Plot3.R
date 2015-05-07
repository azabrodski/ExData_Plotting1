library(sqldf)
library(lubridate)

data <- "household_power_consumption.txt"
fi <- file(data)
df <- sqldf("SELECT * FROM fi WHERE Date in ('1/2/2007','2/2/2007')", 
            file.format = list(header = TRUE, sep = ";"))
close(fi)
dates <- paste(df$Date, df$Time, sep = " ")
dates <- dmy_hms(dates)
df$Date_Time <- dates
x <- df$Date_Time
png(filename = "Plot3.png", width = 480, height = 480)

plot(x, df$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(x, df$Sub_metering_1, col = "black")
lines(x,df$Sub_metering_2, col = "red")
lines(x, df$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lwd = 1, col = c("black", "red", "blue"))

dev.off()


