##----------------------------------------------------------------------------------
## Object: Figure 4 plotting for Exploratory data with R, week 1
## Author: Gilles Daquin
## Date: 3rd of July 2016
## remark: use same starting code as plot1.R, plot2.R and plot3.R + additions to concacentate date
##----------------------------------------------------------------------------------
##Part 1: Loading and preparation of data
##----------------------------------------------------------------------------------
##load file into memory
df <- read.table("household_power_consumption.txt", sep = ";", 
                 header = TRUE, na.strings = '?' )

##quick check of data (optional)
#head(df)  

#format date
df$Date <- as.Date(df$Date,format='%d/%m/%Y')

##select a subset and clear big file
studyData<-subset(df, (Date == "2007/02/01" | Date == "2007/02/02" ))

##free memory
rm(df)

##convert date to day (optional)
##studyData$Day<-weekdays(studyData$Date)

##group time and date to "useful" time
studyData$longDate<-as.POSIXct(paste(studyData$Date, studyData$Time), 
                               format="%Y-%m-%d %H:%M:%S")


#---------------------------------------------------------------------------------
#part 2: plotting the graphs
#---------------------------------------------------------------------------------

#A) Prepare the plotting area
par (mfrow= c(2,2))

#B) Plot figure 1
hist(studyData$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", main = NA)

#B) Plot new element
with(studyData, plot(longDate,Voltage,type = "l",
                     ylab = "Voltage", xlab = "datetime"))


#C) Plot figure 3
#prepare the plot n option makes it invisible
with(studyData, plot(longDate,Sub_metering_1,type = "n",
                     ylab = "Energy sub metering", xlab = NA))


#plot Sub_metering_1
with(studyData, lines(longDate,Sub_metering_1,type = "l",
                      ylab = "Energy sub metering"))

#plot Sub_metering_2
with(studyData, lines(longDate,Sub_metering_2,type = "l",
                      ylab = "Energy sub metering",
                      col = "red"))

#plot Sub_metering_3
with(studyData, lines(longDate,Sub_metering_3,type = "l",
                      ylab = "Energy sub metering",
                      col = "blue"))

#draw legend
legend("topright", lty = 1, col =c("black","red","blue"),
       legend = c("Sub metering1","Sub metering2","Sub metering3"),
       bty= "n")

#C) Plot figure 2
with(studyData, plot(longDate,Global_active_power,type = "l",
                     ylab = "Global Active Power (kilowatts)", xlab = "datetime"))


#---------------------------------------------------------------------------------
#part 3: saving the graphs into PNG file
#---------------------------------------------------------------------------------

#save graph to PNG device
dev.copy(png,file="plot4.png", width = 480, height = 480)
dev.off()