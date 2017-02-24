# Coursera-EDA-Week-4
Exploratory Data Analysis Week 4 Assignment

ReadMe File

temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"))
unlink(temp)
