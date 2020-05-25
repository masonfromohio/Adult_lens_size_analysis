#qPCR data for alpha crystallin expression
#clear R's brain
rm(list=ls())

#install libraries
library(dplyr)
library(ggplot2)
library(ggfortify)

#import data
library(readxl)
Lens_data <- read_excel("Dropbox/AU/Research/CRISPR/Null lens aging data/Null lens aging tidy data.xlsx")

Lens_data <- mutate(Lens_data, lens_avg =(lens1diam+lens2diam)/2)
Lens_data <- mutate(Lens_data, lens_SL = lens_avg/SL)
Lens_data <- mutate(Lens_data, age_time = Date - Fert_Date)

View(Lens_data)

ggplot(data=Lens_data)+
  geom_point(mapping = aes(x=Age, y=lens_avg, color = Genotype))