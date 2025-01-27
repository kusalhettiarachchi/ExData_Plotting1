# read file into variable `df`
source('helper.R')

# uncomment this line if you don't have `df` variable in your environment
df <- getData('household_power_consumption.txt', ';')

# cast `Global_active_power` to double
df$Global_active_power<- with(df, as.double(Global_active_power))

# create `DateTime` field
df$DateTime <- with(df, as.POSIXct(paste(Date, Time)))

# start the plotting
png('plot2.png', width = 504, height = 504)
# set background as original image
par(bg=NA)
plot(df$DateTime, df$Global_active_power, type='l', ylab='Global Active Power (kilowatts)', xlab='')
dev.off()

