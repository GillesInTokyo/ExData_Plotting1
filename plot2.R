##----------------------------------------------------------------------------------
## Object: Figure 2 plotting for Exploratory data with R, week 1
## Author: Gilles Daquin
## Date: 3rd of July 2016
## remark: use same starting code as plot1.R + additions to concacentate date
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

#plot lines
with(studyData, plot(longDate,Global_active_power,type = "l",
                     ylab = "Global Active Power (kilowatts)", xlab = NA))


#---------------------------------------------------------------------------------
#part 3: saving the graphs into PNG file
#---------------------------------------------------------------------------------

#save graph to PNG device
dev.copy(png,file="plot2.png", width = 480, height = 480)
dev.off()