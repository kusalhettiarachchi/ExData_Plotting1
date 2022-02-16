# function for reading the CSV file and returning the filtered dataframe
getData <- function(path, sep) {
    data <- read.csv(path, sep=sep)
    data$Date <- with(data, strptime(Date, format='%d/%m/%Y'))
    data <- subset(data, Date > '2007/01/31' & Date < '2007/02/03')
    data
}

# cast `Global_active_power` to double
df$Global_active_power<- with(df, as.double(Global_active_power))

#start the plotting
png('plot1.png', width = 504, height = 504)
#set background to transparent as original image
par(bg=NA)
with(df, hist(Global_active_power, xlab='Global Active Power (kilowatts)', col='red', main='Global Active Power'))
dev.off()

