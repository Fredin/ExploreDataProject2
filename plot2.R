nei<-readRDS("./summarySCC_PM25.rds")

nei_baltimore<-subset(nei, nei$fips == "24510")

emissions_by_year<-tapply(nei_baltimore$Emissions,nei_baltimore$year,sum)

png(file="./plot2.png")
barplot(emissions_by_year, main = expression("Total Emissions of PM"[2.5]*" by Year in Baltimore City"), 
        ylab = expression("PM"[2.5]*" emissions (tons)"), xlab = "Year", col = "green")
dev.off()