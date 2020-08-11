library(tidyverse)
library(readxl)
Conv_data_for_HW04 <- read_excel("Conv_data_for_HW04.xlsx")

names(Conv_data_for_HW04)[names(Conv_data_for_HW04) == 'transit-rate'] <- 'Transit_rate'
names(Conv_data_for_HW04)[names(Conv_data_for_HW04) == 'pellets/hr'] <- 'Pellets_per_hour'
names(Conv_data_for_HW04)[names(Conv_data_for_HW04) == 'transit-time'] <- 'Transit_time'
names(Conv_data_for_HW04)[names(Conv_data_for_HW04) == 'pellet-capacity'] <- 'Pellet_capacity'
names(Conv_data_for_HW04)[names(Conv_data_for_HW04) == 'total-intestinal-length'] <- 'Total_intestinal_length'

Pellets <- Conv_data_for_HW04 %>%
  select(Category, Transit_rate, Transit_time, Pellets_per_hour, Pellet_capacity, Total_intestinal_length) %>%
  mutate(Pellets_per_cm = Pellet_capacity / Total_intestinal_length) %>%
  arrange(Pellets_per_cm) %>%
  group_by(Category)

Pellets %>%
  summarize(mean = mean(Pellets_per_cm))

Pellets %>%
  count(Category)

Pellets_per_cm_plot <- Pellets %>%
  ggplot(aes(Transit_time, Pellets_per_cm, color = Category)) +
  geom_point()

Pellets_per_cm_hr_plot <- Pellets %>%
  ggplot(aes(Pellets_per_cm, Pellets_per_hour, color = Category)) +
  geom_point()

Pellets_per_hr_plot <- Pellets %>%
  ggplot(aes(Transit_time, Pellets_per_hour, color = Category)) +
  geom_point()

Pellets_per_cm_plot
Pellets_per_cm_hr_plot
Pellets_per_hr_plot





