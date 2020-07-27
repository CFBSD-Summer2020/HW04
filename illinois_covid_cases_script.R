#loading in the data
library(dplyr)
library(ggplot2)
us_counties <- read.csv("us_counties_covid.csv", header = TRUE)

#splitting off a subset of the data
illinois_counties <- us_counties %>% 
  select(date, county, state, cases, deaths) %>%
  filter(state == "Illinois") %>% 
  arrange(desc(cases))

#aggregate the data -> records total cases and death counts by county over the entire dataset
illinois_counties_total <- illinois_counties %>%
  group_by(county) %>%
  summarise(total_cases=sum(cases), total_deaths=sum(deaths)) %>%
  arrange(desc(total_cases)) #organized in descending order by most total COVID-19 cases
illinois_counties_total #here we can see that the counties with the most deaths are Cook and Lake Counties 
#these are also likely the most heavily populated counties in Illinois

#if we rearrange by total deaths, do the top 5 rankings (Cook, Lake, DuPage, Kane, and Will) stay the same?
illinois_counties_total %>%
  arrange(desc(total_deaths))
#it appears as if the top 5 counties are the same, but their orders have slightly shifted (Cook, DuPage, Lake, Will, Kane)


