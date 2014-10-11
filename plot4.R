#Plot 4
colNames <- read.csv("C:/Coursera/Exploratory Data Analysis/Project 1/household_power_consumption.txt",nrows=1,sep=";",head=TRUE)
hpc_data <- read.csv("C:/Coursera/Exploratory Data Analysis/Project 1/household_power_consumption.txt", 
                     dec=".",sep=";",colClasses="character",na.strings="?",
                     skip=66636,nrows=2880,col.names=names(colNames))
hpc_data$datetime <- strptime(paste(hpc_data$Date, hpc_data$Time, sep=","), format="%d/%m/%Y,%H:%M:%S")
for (i in 3:length(names(hpc_data))-1){
        hpc_data[,names(hpc_data)[i]] <- as.numeric(hpc_data[,names(hpc_data)[i]])
}
png(filename = "plot4.png")
par(mfrow=c(2,2),mar=c(4,4,5,3),lwd=0.1)
with(hpc_data,plot(datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power"))
with(hpc_data,plot(datetime,Voltage,type="l",xlab="datetime",ylab="Voltage"))
with(hpc_data,plot(datetime,Sub_metering_1, type="l",xlab="",ylab="Energy sub metering"))
with(hpc_data,lines(datetime,Sub_metering_2, type="l",col="red"))
with(hpc_data,lines(datetime,Sub_metering_3, type="l",col="blue"))
legend("topright",lty=1, col=c("black","red","blue"),bty="n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
with(hpc_data,plot(datetime,Global_reactive_power,type="l",xlab="datetime"))
dev.off()