# Plot 3

setwd("~/Desktop")

library(dplyr)
library(ggplot2)

# Downlaod and unzip

temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", temp)
unzip(temp, c("summarySCC_PM25.rds", "Source_Classification_Code.rds"))
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# Plot 3 - ggplot2

plot3 <- NEI %>% filter(fips == 24510) %>% group_by(year, type) %>% summarise(total = sum(Emissions))

plot3$year <- as.factor(plot3$year) # enables appropriate x-axis labelling.

ggplot(plot3, aes(x = year, y = total)) + geom_bar(stat = "identity", fill = "blue") + facet_grid(.~type) + ggtitle("Baltimore Emissions (PM2.5)") + labs(x = "Year", y = "Total Emissions (PM2.5) tons") + ggtitle("Emissions (PM2.5) Baltimore City per Type") + theme(plot.title = element_text(hjust=0.5))

png("Plot3.png")
dev.set(2)
dev.copy(png, "Plot3.png")
dev.off()


