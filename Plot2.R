library(sqldf)
library(lubridate)

data <- "household_power_consumption.txt"
fi <- file(data)
df <- sqldf("SELECT * FROM fi WHERE Date in ('1/2/2007','2/2/2007')", file.format = list(header = TRUE, sep = ";"))
close(fi)
dates <- paste(df$Date, df$Time, sep = " ")
dates <- dmy_hms(dates)
df$Date_Time <- dates
x <- df$Date_Time
y <- df$Global_active_power
png(filename = "Plot2.png", width = 480, height = 480)
plot(x,y, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(x,y)
dev.off()


