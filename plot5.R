nei<-readRDS("./summarySCC_PM25.rds")
scc<-readRDS("./Source_Classification_Code.rds")

nei_baltimore<-subset(nei, nei$fips == "24510")

vehicle<-grepl("Vehicles",scc$EI.Sector) 

vehicle_scc<-subset(scc,vehicle)

vehicle_emissions<-subset(nei_baltimore, nei_baltimore$SCC %in% vehicle_scc$SCC)

vehicle_emissions_by_year<-tapply(vehicle_emissions$Emissions,vehicle_emissions$year,sum)

png(file="./plot5.png")
barplot(vehicle_emissions_by_year, main = expression("Total Coal Combustion Emissions of PM"[2.5]*" by Year in Baltimore City"), 
        ylab = expression("PM"[2.5]*" emissions (tons)"), xlab = "Year", col = "beige")
dev.off()