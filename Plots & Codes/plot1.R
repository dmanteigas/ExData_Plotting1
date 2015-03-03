data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE) #reads the file
        data$datetime <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
        data$dateonly <- as.Date(data$datetime)
        subdata1 <- subset(data,dateonly=="2007-02-01")
        subdata2 <- subset(data,dateonly=="2007-02-02")
        subdata <- rbind(subdata1,subdata2)
        subdata$Global_active_power <- as.numeric(subdata$Global_active_power) #after reading the file, this code transforms the date into a usable forma (yyyy-mm-dd) to subset the 2 days requested
hist(subdata$Global_active_power,col="red",ylab="Frequency",xlab="Global Active Power (kilowatts)",main="Global Active Power") #creates the histogram
dev.copy(png,"plot1.png")
dev.off() #copies the file to the device "png" and than close it so you can open it in your working directory