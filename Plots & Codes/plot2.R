data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE) #reads the file
        data$dateonly <- as.Date(data$datetime)
        subdata1 <- subset(data,dateonly=="2007-02-01")
        subdata2 <- subset(data,dateonly=="2007-02-02")
        subdata <- rbind(subdata1,subdata2)
        subdata$Global_active_power <- as.numeric(subdata$Global_active_power) #after reading the file, this code transforms the date into a usable forma (yyyy-mm-dd) to subset the 2 days requested and turn the GAP into a numeric variable to plot a histogram
plot(subdata$datetime,subdata$Global_active_power,type="l",xlab=" ",ylab="Global Active Power") #plot the graphic
dev.copy(png,"plot2.png") #copies the file to the device "png" and than close it so you can open it in your working directory
dev.off()