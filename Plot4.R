#Data has been download into working directory first
#Load the household data into R
household_data <- read.csv("household_power_consumption.txt", header =TRUE, sep = ";")

#subset of the data required for the graphs
graph_data <- subset(household_data, household_data$Date=="1/2/2007" | household_data$Date =="2/2/2007")

#convert date time field in date and time format
graph_data$Date <- as.Date(graph_data$Date, format ="%d/%m/%Y")
graph_data$Time <- strptime(graph_data$Time, format ="%H:%M:%S")


#create the frame and 4 plots
png("plot4.png", width=480, height=480)

graph_data[1:1440,"Time"] <- format(graph_data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
graph_data[1441:2880,"Time"] <- format(graph_data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
par(mfrow=c(2,2))

plot(graph_data$Time, as.numeric(as.character(graph_data$Global_active_power)), type = "l", xlab = "", ylab = "Global active Power")

plot(graph_data$Time, as.character(graph_data$Voltage), type = "l", xlab = "datetime", ylab = "Voltage")

plot(graph_data$Time, graph_data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(graph_data$Time, graph_data$Sub_metering_2, col="red")
lines(graph_data$Time, graph_data$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(graph_data$Time, as.character(graph_data$Global_reactive_power), type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
