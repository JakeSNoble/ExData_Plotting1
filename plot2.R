#plot 2

#read and label the data
colNames <- read.csv("C:/Coursera/Exploratory Data Analysis/Project 1/household_power_consumption.txt",nrows=1,sep=";",head=TRUE)
hpc_data <- read.csv("C:/Coursera/Exploratory Data Analysis/Project 1/household_power_consumption.txt", 
                     dec=".",sep=";",colClasses="character",na.strings="?",
                     skip=66636,nrows=2880,col.names=names(colNames))
#cooerce data to appropriate types
hpc_data$date_time <- strptime(paste(hpc_data$Date, hpc_data$Time, sep=","), format="%d/%m/%Y,%H:%M:%S")
hpc_data$Global_active_power <- as.numeric(hpc_data$Global_active_power)

#create plot 2
png(filename = "plot2.png")
with(hpc_data,plot(date_time,Global_active_power, type="l",xlab="",ylab="Global Active Power (kilowatts)"))
dev.off()




                   
