nei<-readRDS("./summarySCC_PM25.rds")
scc<-readRDS("./Source_Classification_Code.rds")

coal<-grepl("Fuel Comb",scc$EI.Sector) & grepl("Coal",scc$EI.Sector)

coal_scc<-subset(scc,coal)

coal_emissions<-subset(nei, nei$SCC %in% coal_scc$SCC)

coal_emissions_by_year<-tapply(coal_emissions$Emissions,coal_emissions$year,sum)

png(file="./plot4.png")
barplot(coal_emissions_by_year, main = expression("Total Coal Combustion Emissions of PM"[2.5]*" by Year in the USA"), 
        ylab = expression("PM"[2.5]*" emissions (tons)"), xlab = "Year", col = "red")
dev.off()