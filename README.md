# Portfolio
You can find several of my reports, articles and coding script for big and small projects.
# Customer satisfaction, customer loyalty, employee satisfaction, Choice Models and Kano analysis
Kort speech on World Credit Union Conference in Gdańsk (2012) https://github.com/milosz1957/portfolio/files/11534529/analiza.Kano.en.pdf

Short report for Credit Union Stefczyk (Gdańsk 2012) https://github.com/milosz1957/portfolio/files/11534559/Klasyfikacja.produktow.SKOK.pptx

Full marketing report for Credit Union Stefczyk (Gdańsk 2012) https://github.com/milosz1957/portfolio/files/11534673/Raport-Stefczyk-2-2012.pdf

My lectures from Marketing Communication Academy. https://github.com/milosz1957/portfolio/files/11534720/Satisfaction_MCA.pdf

# Coding and visualisation
Easy map in R:
##### Loading the packages
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
##### Ładuje dane
load("C:/Users/Admin/Downloads/Projekty R/hungary.RData")
##### Tworzenie zbioru Spatial Data Frame, Miasta jako punkty
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
![image](https://github.com/milosz1957/portfolio/assets/70690504/c010b202-3a3d-4613-9540-0822b2e07580)
 
