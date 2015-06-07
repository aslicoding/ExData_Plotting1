######################GETTING DATA
data<-read.table("household_power_consumption.txt", sep=";",header=TRUE)
## read the data from the right directory with "read.table". Make sure to include that the data has headers and that they are separated by ";"
View(data)
newdata <- data[ which(data$Date=="2/2/2007"),] #subset  date 2
newdata0 <- data[ which(data$Date=="1/2/2007"),] #subset date 1
datanew<-rbind(newdata0,newdata) #bind the data rows of date1 and date2 together

######################PLOT1
##Initialize a plot that will be written directly to a file using  png
png(filename = "plot1.png",
     width = 480, height = 480, units = "px", pointsize = 12,
     bg = "white",  res = NA, 
     type = c("cairo"))
plot1<-hist(as.numeric(as.character(datanew$Global_active_power),na.rm=TRUE), main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency",border="black",col="red") 
#plot the data
dev.off() #close the file
