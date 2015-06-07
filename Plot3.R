#####################GETTING DATA
data<-read.table("household_power_consumption.txt", sep=";",header=TRUE)
## read the data from the right directory with "read.table". Make sure to include that the data has headers and that they are separated by ";"
View(data)
newdata <- data[ which(data$Date=="2/2/2007"),] #subset  date 2
newdata0 <- data[ which(data$Date=="1/2/2007"),] #subset date 1
datanew<-rbind(newdata0,newdata) #bind the data rows of date1 and date2 together
########################PLOT3

a<-as.numeric(levels(datanew$Sub_metering_1))[datanew$Sub_metering_1] ## converting factor data into numeric data
b<-as.numeric(levels(datanew$Sub_metering_2))[datanew$Sub_metering_2] ## converting factor data into numeric data
c<-datanew$Sub_metering_3
data<-cbind(a,b,c) #creating the data object that will be plotted
##Initialize a plot that will be written directly to a file using  png
png(filename = "plot3.png",
     width = 480, height = 480, units = "px", pointsize = 12,
     bg = "white",  res = NA, 
     type = c("cairo"))
matplot(data,type="l",pch=1,col=1:3,xaxt="n",ylab="Energy sub metering") #matrix plotting
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=1:3, pch=1) #adding the legend
v1<-c(0,1440,2880) #positions where you want the tick marks
v2<-c("Thu","Fri","Sat") #labels for the tick marks length(v1)=length(v2)
axis(side=1,at=v1,labels=v2) #side=1 represents x axis
dev.off() #close the file
