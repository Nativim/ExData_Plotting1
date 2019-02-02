#Data has been download into working directory first
#Load the household data into R
household_data <- read.csv("household_power_consumption.txt", header =TRUE, sep = ";")

#subset of the data required for the graphs
graph_data <- subset(household_data, household_data$Date=="1/2/2007" | household_data$Date =="2/2/2007")

#convert date time field in date and time format
graph_data$Date <- as.Date(graph_data$Date, format ="%d/%m/%Y")
graph_data$Time <- strptime(graph_data$Time, format ="%H:%M:%S")


#create third plot
png("plot3.png", width=480, height=480)

graph_data[1:1440,"Time"] <- format(graph_data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
graph_data[1441:2880,"Time"] <- format(graph_data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
plot(graph_data$Time, graph_data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(graph_data$Time, graph_data$Sub_metering_2, col="red")
lines(graph_data$Time, graph_data$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


dev.off()



