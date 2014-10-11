#plot 1

#read and label the data
colNames <- read.csv("C:/Coursera/Exploratory Data Analysis/Project 1/household_power_consumption.txt",nrows=1,sep=";",head=TRUE)
hpc_data <- read.csv("C:/Coursera/Exploratory Data Analysis/Project 1/household_power_consumption.txt", 
                     dec=".",sep=";",colClasses="character",na.strings="?",
                     skip=66636,nrows=2880,col.names=names(colNames))
#cooerce data to appropriate types

hpc_data$Global_active_power <- as.numeric(hpc_data$Global_active_power)

#create plot 1
png(filename = "plot1.png")
with(hpc_data,hist(Global_active_power, main= "Global Active Power",col="red",xlab="Global Active Power (kilowatts)"))
dev.off()