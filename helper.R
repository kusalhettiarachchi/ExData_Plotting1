# function for reading the CSV file and returning the filtered dataframe
getData <- function(path, sep) {
    data <- read.csv(path, sep=sep)
    data$Date <- with(data, strptime(Date, format='%d/%m/%Y'))
    data <- subset(data, Date > '2007/01/31' & Date < '2007/02/03')
    data
}