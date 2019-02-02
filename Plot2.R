
#Data has been download into working directory first
#Load the household data into R
household_data <- read.csv("household_power_consumption.txt", header =TRUE, sep = ";")

#subset of the data required for the graphs
graph_data <- subset(household_data, household_data$Date=="1/2/2007" | household_data$Date =="2/2/2007")

#convert date time field in date and time format
graph_data$Date <- as.Date(graph_data$Date, format ="%d/%m/%Y")
graph_data$Time <- strptime(graph_data$Time, format ="%H:%M:%S")

#create second plot
png("plot2.png", width=480, height=480)

plot(graph_data$Time, as.numeric(graph_data$Global_active_power), type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)" )

dev.off()
