---
title: "HW04"
author: "Hannah Farrell"
date: "July 27, 2020"
output: html_document
---

For this assignment, I have played around a bit with the COVID-19 datasets from the NYTimes GitHub page (I don't have my own data yet that would fit this assignment).
I was curious to compare the total cases and total deaths seen across the counties in Illinois. First I had to separate out the appropriate subsets of data from the "master" data sheet, and then I grouped case/death counts by county to get an overall count spanning January 24th 2020 to July 26th 2020.

The next steps here to getting to more meaningful data would be to add in a population count for each county (this would need to be found elsewhere as it is not a part of the original dataset) and adjust the counts so they are weighted by overall population totals. At the moment, I assume that the 5 counties with the highest death count and COVID-19 cases count are likely the 5 most populated counties. 