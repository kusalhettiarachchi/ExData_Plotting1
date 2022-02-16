# read file into variable `df`
source('helper.R')

# uncomment this line if you don't have `df` variable in your environment
df <- getData('household_power_consumption.txt', ';')

# cast `Global_active_power` to double
df$Global_active_power<- with(df, as.double(Global_active_power))

#start the plotting
png('plot1.png', width = 504, height = 504)
#set background to transparent as original image
par(bg=NA)
with(df, hist(Global_active_power, xlab='Global Active Power (kilowatts)', col='red', main='Global Active Power'))
dev.off()

