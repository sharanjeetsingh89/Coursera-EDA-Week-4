# Plot 5

setwd("~/Desktop")

library(dplyr)

# Download and unzip

temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", temp)
unzip(temp, c("summarySCC_PM25.rds", "Source_Classification_Code.rds"))
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# "NEI ONROAD sources include emissions from onroad vehicles that use gasoline, diesel, and other fuels. 
# These sources include light duty and heavy duty vehicle emissions from operation on roads, highway ramps, and during idling."  
#(Taken from http://www.epa.gov/ttn/chief/eiinformation.html))

# Plot 5 - Total Motor Vehicle Related Emissions (PM2.5) - Baltimore City

motor_emissions <- NEI %>% filter(type == "ON-ROAD") %>% group_by(year) %>% summarise(total = sum(Emissions))
barplot(motor_emissions$total, names.arg = c("1999", "2002", "2005", "2008"), xlab = "Year", ylab = "Emissions PM2.5 (tons)", main = "Total Motor Vehicle Related Emissions (PM2.5) - Baltimore City", col = "purple")

png("Plot5.png")
dev.set(2)
dev.copy(png, "Plot5.png")
dev.off()
