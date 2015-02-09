data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
data$datetime <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
data$dateonly <- as.Date(data$datetime)
subdata1 <- subset(data,dateonly=="2007-02-01")
subdata2 <- subset(data,dateonly=="2007-02-02")
subdata <- rbind(subdata1,subdata2)
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)
plot(subdata$datetime,subdata$Global_active_power,type="l",xlab=" ",ylab="Global Active Power")
dev.copy(png,"plot2.png")
dev.off()