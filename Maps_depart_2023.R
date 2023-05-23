# Loading the packages
library(tidyr)
library(dplyr)
library(maptools)
library(leaflet)
library(igraph)
library(spatstat)
library(sp)
library(xtable)
library(DT)
library(data.table)

# Ładuje dane
load("C:/Users/Admin/Downloads/Projekty R/hungary.RData")

# Tworzenie zbioru Spatial Data Frame; Miasta jako punkty
class(fw_trasy_ok)<-'data.frame' # coby mieć punkt wyjścia jednolity

fw_trasy<-fw_trasy %>% ungroup()
tr<-fw_trasy[,c(1,2,5,6,7)]
tr<-tr %>% 
  group_by(lat_r,lon_r,Zleceniodawca,Przewoznik) %>% 
  summarise(sp=n())

m <- leaflet()%>% 
  addTiles(urlTemplate = "http://{s}.basemaps.cartocdn.com/light_nolabels/{z}/{x}/{y}.png") %>% 
  addCircles(lng = fw_trasy$lon_r, lat = fw_trasy$lat_r,radius =1,color='#663300') %>%
  addMarkers(lng = fw_trasy$lon_r,
             lat = fw_trasy$lat_r,
             popup = tr$Zleceniodawca,
             clusterOptions = markerClusterOptions())#, popup = ~htmlEscape(tr$Zleceniodawca))

m
