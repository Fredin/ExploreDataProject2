nei<-readRDS("./summarySCC_PM25.rds")

emissions_by_year<-tapply(nei$Emissions,nei$year,sum)

png(file="./plot1.png")
barplot(emissions_by_year, main = expression("Total Emissions of PM"[2.5]*" by Year in the USA"), 
        ylab = expression("PM"[2.5]*" emissions (tons)"), xlab = "Year", col = "blue")
dev.off()