# Plot 2

setwd("~/Desktop")

library(dplyr)
library(ggplot2)

# Downlaod and unzip

temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", temp)
unzip(temp, c("summarySCC_PM25.rds", "Source_Classification_Code.rds"))
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Plot 2 - Barplot

balt_emiss <- NEI %>% filter(fips == 24510) %>% group_by(year) %>% summarise(total = sum(Emissions))
barplot(balt_emiss$total, names.arg = c("1999", "2002", "2005", "2008"), xlab = "Year", ylab = "Emissions PM2.5 (tons)", main = "Baltimore Annual Emissions (PM 2.5)", col = "green", ylim = c(0, 3800))

png("Plot2.png")
dev.set(2)
dev.copy(png, "Plot2.png")
dev.off()


