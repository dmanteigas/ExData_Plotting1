data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
        data$datetime <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
        data$dateonly <- as.Date(data$datetime)
        subdata1 <- subset(data,dateonly=="2007-02-01")
        subdata2 <- subset(data,dateonly=="2007-02-02")
        subdata <- rbind(subdata1,subdata2) #after reading the file, this code transforms the date into a usable forma (yyyy-mm-dd) to subset the 2 days requested 
plot(subdata$datetime,subdata$Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab="")
lines(subdata$datetime,subdata$Sub_metering_2,col="red")
lines(subdata$datetime,subdata$Sub_metering_3,col="blue")
legend("topright",pch="-",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) #plots the graphics with the required specifications
dev.copy(png,"plot3.png")
dev.off() #copies the file to the device "png" and than close it so you can open it in your working directory