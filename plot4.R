# read file into variable `df`
source('helper.R')

# uncomment this line if you don't have `df` variable in your environment
df <- getData('household_power_consumption.txt', ';')

# create `DateTime` field
df$DateTime <- with(df, as.POSIXct(paste(Date, Time)))

# cast data types
df$Global_active_power <- with(df, as.double(Global_active_power))
df$Global_reactive_power <- with(df, as.double(Global_reactive_power))
df$Voltage <- with(df, as.double(Voltage))
df$Sub_metering_1 <- with(df, as.double(Sub_metering_1))
df$Sub_metering_2 <- with(df, as.double(Sub_metering_2))
df$Sub_metering_3 <- with(df, as.double(Sub_metering_3))

# start the plotting
png('plot4.png', width = 504, height = 504)

# set grid
par(mfcol=c(2,2), bg=NA)

# plot(1,1)
plot(df$DateTime, df$Global_active_power, type='l', ylab='Global Active Power (kilowatts)', xlab='')

# plot(2,1)
with(df, plot(DateTime, Sub_metering_1, ylab='Energy sub metering', xlab='', type = "n"))
lines(df$DateTime, df$Sub_metering_1, col='black')
lines(df$DateTime, df$Sub_metering_2, col='red')
lines(df$DateTime, df$Sub_metering_3, col='blue')
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_1', 'Sub_metering_1'), col=c("black", "red", "blue"), lty=1)

# plot(1,2)
plot(df$DateTime, df$Voltage, type='l', ylab='Voltage', xlab='datetime')

# plot(2,2)
plot(df$DateTime, df$Global_reactive_power, type='l', xlab='datetime', ylab='Global_reactive_power')

dev.off()