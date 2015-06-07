######################GETTING DATA
data<-read.table("household_power_consumption.txt", sep=";",header=TRUE)
## read the data from the right directory with "read.table". Make sure to include that the data has headers and that they are separated by ";"
View(data)
newdata <- data[ which(data$Date=="2/2/2007"),] #subset  date 2
newdata0 <- data[ which(data$Date=="1/2/2007"),] #subset date 1
datanew<-rbind(newdata0,newdata) #bind the data rows of date1 and date2 together
#######################PLOT2
##as I read my data as a table str() showed that my $Global_active_power column was a factor type of data so I converted it to numeric and saved it as ylab
y<-as.numeric(levels(datanew$Global_active_power))[datanew$Global_active_power]
##Converted the given dates to days and added it as a new column
datanew$Day<-format(as.Date(datanew$Date,"%d/%m/%Y"),format="%a")
##Initialize a plot that will be written directly to a file using  png
png(filename = "plot2.png",
     width = 480, height = 480, units = "px", pointsize = 12,
     bg = "white",  res = NA, 
     type = c("cairo"))
plot( y,type="l", main=' ',ylab='Global Active Power (kilowatts)',xaxt  ="n", xlab="") #plotting a line graph xaxt="n" allows you to hide the tick marks and xlab
v1<-c(0,1440,2880) #positions where you want the tick marks
v2<-c("Thu","Fri","Sat") #labels for the tick marks length(v1)=length(v2)
axis(side=1,at=v1,labels=v2) #side=1 represents x axis
dev.off() #close the file
