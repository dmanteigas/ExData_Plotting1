data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
        data$datetime <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
        data$dateonly <- as.Date(data$datetime)
        subdata1 <- subset(data,dateonly=="2007-02-01")
        subdata2 <- subset(data,dateonly=="2007-02-02")
        subdata <- rbind(subdata1,subdata2)
        subdata$Global_active_power <- as.numeric(subdata$Global_active_power)
        subdata$Voltage <- as.numeric(subdata$Voltage)
        subdata$Global_reactive_power <- as.numeric(subdata$Global_reactive_power) #after reading the file, this code transforms the date into a usable forma (yyyy-mm-dd) to subset the 2 days requested and turn the GAP and GRP variables into a numeric variables to plot the necessary graphs
par(mfrow=c(2,2)) #creates a 2x2 device to plot the necessary graphics
with(subdata,{
        plot(datetime,Global_active_power,type="l",xlab=" ",ylab="Global Active Power")
        plot(datetime,Voltage,type="l",xlab="datetime",ylab="Voltage")
        plot(datetime,Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab="")
                lines(datetime,Sub_metering_2,col="red")
                lines(datetime,Sub_metering_3,col="blue")
                legend("topright",pch="-",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        plot(datetime,Voltage,type="l",xlab="datetime",ylab="Global_reactive_power")
} #plots the 4 graphics according to the specifications 
)
dev.copy(png,"plot4.png")
dev.off() #copies the file to the device "png" and than close it so you can open it in your working directory