# function for reading the CSV file and returning the filtered dataframe
getData <- function(path, sep) {
    data <- read.csv(path, sep=sep)
    data$Date <- with(data, strptime(Date, format='%d/%m/%Y'))
    data <- subset(data, Date > '2007/01/31' & Date < '2007/02/03')
    data
}


# uncomment this line if you don't have `df` variable in your environment
#df <- getData('household_power_consumption.txt', ';')

# cast `Sub_metering_n` to double
df$Sub_metering_1<- with(df, as.double(Sub_metering_1))
df$Sub_metering_2<- with(df, as.double(Sub_metering_2))
df$Sub_metering_3<- with(df, as.double(Sub_metering_3))

# create `DateTime` field
df$DateTime <- with(df, as.POSIXct(paste(Date, Time)))

# start the plotting
png('plot3.png', width = 504, height = 504)
# set background as original image
par(bg=NA)
with(df, plot(DateTime, Sub_metering_1, ylab='Energy sub metering', xlab='', type = "n"))
lines(df$DateTime, df$Sub_metering_1, col='black')
lines(df$DateTime, df$Sub_metering_2, col='red')
lines(df$DateTime, df$Sub_metering_3, col='blue')
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_1', 'Sub_metering_1'), col=c("black", "red", "blue"), lty=1)
dev.off()

