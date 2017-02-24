# Plot 4

setwd("~/Desktop")

library(dplyr)
library(ggplot2)
library(stringr)

# Download and unzip

temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", temp)
unzip(temp, c("summarySCC_PM25.rds", "Source_Classification_Code.rds"))
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Plot 4 - Emissions from Coal Combustion Related Sources

# Find SCC observations where EI Sector contains "Coal"

SCC$EI.Sector <- as.character(SCC$EI.Sector)
SCC$SCC <- as.character(SCC$SCC)

coal_comb_df <- filter(SCC, str_detect(SCC$EI.Sector, "Coal"))

coal_comb_vector <- coal_comb_df$SCC

# Plot 4

coal_emiss <- NEI %>% filter(SCC %in% coal_comb_vector) %>% group_by(year) %>% summarise(total = sum(Emissions))
barplot(coal_emiss$total, names.arg = c("1999", "2002", "2005", "2008"), ylab = "Emissions PM2.5 (tons)", xlab = "Year", col = "blue", main = "USA Total Emissions (PM 2.5) Coal-Combustion Related Sources")

png("Plot4.png")
dev.set(2)
dev.copy(png, "Plot4.png")
dev.off()
