# plot1.R

# the rows from the two days, 2007-02-01 and 2007-02-02 are 66637 to 69516.
hpc_data_2days <- read.table("data/household_power_consumption.txt", 
                             na.strings = "?", 
                             sep = ";", 
                             header = FALSE, 
                             skip = 66637, 
                             nrows = 2880)

# add the column names back (skip means that the column names are lost)

hpc_col_names <-c("Date", 
                  "Time", 
                  "Global_active_power", 
                  "Global_reactive_power", 
                  "Voltage", 
                  "Global_intensity", 
                  "Sub_metering_1", 
                  "Sub_metering_2", 
                  "Sub_metering_3")

colnames(hpc_data_2days) <- hpc_col_names

# fix date and time, putting them in a new variable 'datetime'
# only needed for questions 2-4
hpc_data_2days$datetime <- strptime(paste(hpc_data_2days$Date,hpc_data_2days$Time),
                                    format = "%d/%m/%Y %H:%M:%S")

# plot1
png("plot1.png", width = 480, height = 480)
hist(hpc_data_2days$Global_active_power, 
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency")
dev.off()
