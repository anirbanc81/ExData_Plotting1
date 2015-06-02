# Exploratory Data Analysis - Peer Assessment 1: Understanding Daily Electricity Consumption Patterns
Anirban Chatterjee  
Tuesday, June 02, 2015  

## Reading & Transforming the Data
We expect the input file to be already downloaded and present in the working directory.  
We will not attempt to download it on the fly due to the heavy size.  
  
After reading the data, we will apply the following transformations to be able to analyze the data accurately and create the necessary exploratory plots.  
1. Filter the dataset to retain only data points for Feb 1st and 2nd, 2007 (maps to Thursday and Friday in the exploratory plots)  
2. Create a new date time variable (Time.1) to analyze consumption behaviour across days  
3. Convert all power consumption, voltage and metering variables to numeric  
  
The code below accomplishes the above mentioned actions.  


```r
setwd("F:/Coursera/Data Science/Exploratory Data Analysis/exploration_data")
library(data.table)
ex.proj1 <- suppressWarnings(fread("household_power_consumption.txt", sep=";", header=TRUE))
```

```
## 
Read 88.7% of 2075259 rows
Read 2075259 rows and 9 (of 9) columns from 0.124 GB file in 00:00:03
```

```r
ex.proj1$Date <- as.Date(ex.proj1$Date, "%d/%m/%Y")
ex.proj1 <- ex.proj1[ex.proj1$Date>="2007-02-01" & ex.proj1$Date<="2007-02-02",]
ex.proj1 <- as.data.frame(ex.proj1)
ex.proj1$Time.1 <- strptime(paste(ex.proj1$Date, ex.proj1$Time), "%Y-%m-%d %H:%M:%S")
ex.proj1$Global_active_power.1 <- as.numeric(ex.proj1$Global_active_power)
ex.proj1$Global_reactive_power.1 <- as.numeric(ex.proj1$Global_reactive_power)
ex.proj1$Voltage.1 <- as.numeric(ex.proj1$Voltage)
ex.proj1$Global_intensity.1 <- as.numeric(ex.proj1$Global_intensity)
ex.proj1$Sub_metering_1.1 <- as.numeric(ex.proj1$Sub_metering_1)
ex.proj1$Sub_metering_2.1 <- as.numeric(ex.proj1$Sub_metering_2)
```

## Plot 1
The below code generates the required Plot 1 of this assignment.  


```r
hist(ex.proj1$Global_active_power.1, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
```

![](All_Plots_files/figure-html/plot1-1.png) 
  
  
## Plot 2
The below code generates the required Plot 2 of this assignment.  


```r
plot(ex.proj1$Time.1, ex.proj1$Global_active_power.1, type="l", ylab="Global Active Power (kilowatts)", xlab="")
```

![](All_Plots_files/figure-html/plot2-1.png) 
  
  
## Plot 3
The below code generates the required Plot 3 of this assignment.  


```r
plot(ex.proj1$Time.1, ex.proj1$Sub_metering_1.1, type="l", col="black", ylab="Energy sub metering", xlab="")
lines(ex.proj1$Time.1, ex.proj1$Sub_metering_2.1, type="l", col="red")
lines(ex.proj1$Time.1, ex.proj1$Sub_metering_3, type="l", col="blue")
legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.6)
```

![](All_Plots_files/figure-html/plot3-1.png) 
  
  
## Plot 4
The below code generates the required Plot 4 of this assignment.  


```r
par.dflt <- par(no.readonly = TRUE)
par(mfcol=c(2,2), mar=c(5,5,2,1))
plot(ex.proj1$Time.1, ex.proj1$Global_active_power.1, type="l", ylab="Global Active Power", xlab="")
plot(ex.proj1$Time.1, ex.proj1$Sub_metering_1.1, type="l", col="black", ylab="Energy sub metering", xlab="")
lines(ex.proj1$Time.1, ex.proj1$Sub_metering_2.1, type="l", col="red")
lines(ex.proj1$Time.1, ex.proj1$Sub_metering_3, type="l", col="blue")
legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n", cex=0.6)
plot(ex.proj1$Time.1, ex.proj1$Voltage, type="l", col="black", xlab="datetime", ylab="Voltage")
plot(ex.proj1$Time.1, ex.proj1$Global_reactive_power, type="l", col="black", xlab="datetime", ylab="Global_reactive_power")
```

![](All_Plots_files/figure-html/plot4-1.png) 

```r
par(par.dflt)
```
  
  
This concludes Peer Assessment 1 for the Exploratory Data Analysis course. Thank you!  
