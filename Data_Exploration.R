#let's load some packages we may need
library(dplyr)
library(ggplot2)

#let's load our dataset
data(midwest)

#let's find the metro areas with the greatest population density of american indians in the midwest
midwest %>%
  select(PID, county, state, area, poptotal, popdensity, popamerindian, percamerindan, inmetro) %>%
  filter(inmetro == 1) %>%
  mutate("amerindian_pd" = popamerindian / area) %>%
  arrange(desc(amerindian_pd))
  
#let's find the non-metro areas with the greatest population density of american indians in the midwest
midwest %>%
  select(PID, county, state, area, poptotal, popdensity, popamerindian, percamerindan, inmetro) %>%
  filter(inmetro == 0) %>%
  mutate("amerindian_pd" = popamerindian / area) %>%
  arrange(desc(amerindian_pd))

#let's find the state with the most non-metro counties with a population density
#of american indians over 4000.
midwest %>%
  select(PID, county, state, area, poptotal, popdensity, popamerindian, percamerindan, inmetro) %>%
  group_by(state) %>%
  filter(inmetro == 0) %>%
  mutate("amerindian_pd" = popamerindian / area) %>%
  filter(amerindian_pd > 4000) %>%
  arrange(desc(amerindian_pd)) %>%
  count(state)

#MI and WI are the significantly higher than the rest of the states, perhaps because there are
#reservations in MI and WI, but not IL, IN, or OH.