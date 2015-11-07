# Load dplyr library for dataframe manipulation
library(dplyr)

# Read "household_power_consumption.txt" data file into dataframe df, honoring header in file
# and using semicolon character as field separator and question mark character as NA.  Also
# allow strings to remain as character data type to facilitate conversion of dates and times.
df <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = c("?"), stringsAsFactors = FALSE)

# Convert Date field to Date data type and create new DateTime field for plotting time series.
df <- mutate(df, Date = as.Date(Date, format = "%d/%m/%Y"),DateTime = as.POSIXct(paste(df$Date,df$Time), format="%d/%m/%Y %H:%M:%S"))

# Filter on time range given in assignment
df <- filter(df, Date == "2007-02-01" | Date == "2007-02-02")

# Produce plot
png("plot1.png",width = 480, height = 480)
hist(df$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
