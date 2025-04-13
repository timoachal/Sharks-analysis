# loading libraries
library(readr)
library(tidyverse)
library(gtExtras)
library(naniar)
library(mice)

# importing the dataset
Sharks <- read.csv("E:/data sets/Sharks.csv")
str(Sharks)
summary(Sharks)
class(Sharks)



# removing unnecessary columns





Newsharks <-Sharks %>% 
  select(Case.Number, Date, Year, Type, Country, Area,Location,Activity, Name, Sex, Age,Injury, Fatal..Y.N., Time, Species, original.order,Investigator.or.Source,href, href.formula,Case.Number.1,Case.Number.2) %>% 
  select(-Investigator.or.Source:-Case.Number.2) %>% 
  mutate(Type= case_when(Type == "Unprovoked" ~ "1",
                         Type ==  " Provoked" ~ "2",
                         Type == "Invalid" ~ "3",
                         Type == "Boat" ~ "4",
                         Type == "Sea Disaster"~ "5",
                         Type == "Boating" ~ "6",
                         TRUE ~ "7")) %>% 
  mutate(Sex = case_when(Sex == "M" ~ "0",
                         TRUE ~ "1")) %>%
  mutate(Fatal..Y.N. = case_when(Fatal..Y.N. == "N"~ "0",
                                 TRUE ~ "1")) %>%
  rename(region = Country) %>%
  drop_na(region) %>% 
  
                       
  view()

Newsharks %>% 
  head(15) %>% 
  gt() %>% 
  gt_theme_guardian() %>% 
  tab_header(title = "Sharks characters")
unique(Newsharks$Type)
str(Newsharks)
                        
mapdata<- map_data("world")
view(mapdata)

new<-Newsharks %>% 
  select(region,Age) %>% 
  view()

mapdata<- left_join(mapdata, new, by = "region")
view(mapdata)


