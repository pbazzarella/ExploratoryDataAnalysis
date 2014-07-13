
#########################################################################################################################
# Making Plots
# Our overall goal here is simply to examine how household energy usage varies over a 2-day period in February, 2007.
# Your task is to reconstruct the following plots below, all of which were constructed using the base plotting system.
# First you will need to fork and clone the following GitHub repository: https://github.com/rdpeng/ExData_Plotting1
# For each plot you should
# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
# Name each of the plot files as plot1.png, plot2.png, etc.
# Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, i.e. code in plot1.R 
# constructs the plot1.png plot. Your code file should include code for reading the data so that the plot can be fully 
# reproduced. You should also include the code that creates the PNG file.
# Add the PNG file and R code file to your git repository
# When you are finished with the assignment, push your git repository to GitHub so that the GitHub version of your 
# repository is up to date. There should be four PNG files and four R code files.
# The four plots that you will need to construct are shown below.
########################################################################################################################

data <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      , check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data_full$Date, format="%d/%m/%Y")


# Subsetting the data: subdata
subdata <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(subdata)


# Converting dates
datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)


# Creatint the plot: plot2
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")


# Saving the plot to a file: plot2.png
dev.copy(png, file="plot2", height=480, width=480)
dev.off()
