library(sqldf)
library(lubridate)

data <- "household_power_consumption.txt"
fi <- file(data)
df <- sqldf("SELECT * FROM fi WHERE Date in ('1/2/2007','2/2/2007')", file.format = list(header = TRUE, sep = ";"))
close(fi)
dates <- paste(df$Date, df$Time, sep = " ")
dates <- dmy_hms(dates)
df$Date_Time <- dates

png(filename = "Plot1.png", width = 480, height = 480)
hist(df$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylim = c(0,1200), bg = "white")
dev.off()

