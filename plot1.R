##----------------------------------------------------------------------------------
## Object: Figure 1 plotting for Exporatory data with R, week 1
## Author: Gilles Daquin
## Date: 3rd of July 2016
## remark:
##----------------------------------------------------------------------------------
##Part 1: Loading and preparation of data
##----------------------------------------------------------------------------------
##load file into memory
df <- read.table("household_power_consumption.txt", sep = ";", 
                 header = TRUE, na.strings = '?' )

##quick check of data
head(df)

#format date
df$Date <- as.Date(df$Date,format='%d/%m/%Y')

##select a subset and clear big file
studyData<-subset(df, (Date == "2007/02/01" | Date == "2007/02/02" ))

##free memory
rm(df)

##convert date to day
studyData$Day<-weekdays(studyData$Date)

#---------------------------------------------------------------------------------
#part 2: plotting the graphs
#---------------------------------------------------------------------------------

#plot histogram
hist(studyData$Global_active_power, col = "red", 
                                  xlab = "Global Active Power (kilowatts)",
                                  main = "Global Active Power")


#---------------------------------------------------------------------------------
#part 3: saving the graphs into PNG file
#---------------------------------------------------------------------------------

#save graph to PNG device
dev.copy(png,file="plot1.png", width = 480, height = 480)
dev.off()