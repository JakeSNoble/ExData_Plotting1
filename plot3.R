#Plot 3
colNames <- read.csv("C:/Coursera/Exploratory Data Analysis/Project 1/household_power_consumption.txt",nrows=1,sep=";",head=TRUE)
hpc_data <- read.csv("C:/Coursera/Exploratory Data Analysis/Project 1/household_power_consumption.txt", 
                     dec=".",sep=";",colClasses="character",na.strings="?",
                     skip=66636,nrows=2880,col.names=names(colNames))
hpc_data$date_time <- strptime(paste(hpc_data$Date, hpc_data$Time, sep=","), format="%d/%m/%Y,%H:%M:%S")
for (i in 3:length(names(hpc_data))-1){
        hpc_data[,names(hpc_data)[i]] <- as.numeric(hpc_data[,names(hpc_data)[i]])
}
#png(filename = "plot3.png")
with(hpc_data,plot(date_time,Sub_metering_1, type="l",xlab="",ylab="Energy sub metering"))
with(hpc_data,lines(date_time,Sub_metering_2, type="l",col="red"))
with(hpc_data,lines(date_time,Sub_metering_3, type="l",col="blue"))
legend("topright",lty=1, border=NULL,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#dev.off()
