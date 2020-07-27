# HW04
Due Monday July 27th

### Option 1
Explore a dataset. That's right, like last week find some data online or use your own data and manipulate it and explore it to create some data summaries.  You can look at that homework for a list of datasets. Make use of the major dplyr functions select(), mutate(), arrange(), group_by(), summarize(), count() or baseR equivalents (there isn't a good baseR equivalent for many of these functions though). If you are using a Rmd, think about making your table summaries and printing them nicely with knitr::kable() and still think about plotting some data.  

### Option 2
I'm also providing a more traditional HW assignment, similar to HW02 this week if you are just wanting to have a more traditional assignment. It uses data from FiveThirtyEight to explore gun deaths from 2012-2014. [See the HW04.Rmd file for details.](HW04.Rmd)
## load the pacakages
```{r load packages}
library(ggplot2)
library(dplyr)

```
#the idea is to generate a bar plot with mean values to plot disease symptoms across the genotypes
```{r factorize, give levels to set order on x axis, calculate means, summarize}
filename <- "https://github.com/zeeshanb-github/HW04/commit/71d17c704aa5edc2e6f155ad23b56b4bc9f30a18"
my_data <- read.delim (filename, header=TRUE)
##give levels to the data to organzie the samples to be plotted
my_data$samples<-factor(my_data$samples, levels = c("CM","CA","4OEM", "4OEA", "4M", "4A"))
my_data$genotype<-factor(my_data$genotype, levels = c("WT", "OE", "KO"))
# pipe the data to summarize with pipe code %>% (for this library(dplyr) must have been loaded already)
clean_data <- my_data %>%
  group_by (samples, genotype) %>%
  summarize(mean_disease = mean(disease), sd_disease = sd(disease), count = n(), se_disease = (sd_disease/(sqrt(count))))
ggplot(clean_data, aes(x=genotype, y=mean_disease, fill = samples, group= samples)) + 
  geom_bar(stat="identity", color="black", position = position_dodge(width = 0.7), width = 0.6)+
  theme_bw()+
  ##log10 transformation
  scale_y_log10(breaks = scales::trans_breaks("log10", function(x) 10^x),
                labels = scales::trans_format("log10", scales::math_format(10^.x))) + 
  scale_x_discrete(labels=c("CM \n\n CA","4OEM \n\n 4OEA", "4M \n\n 4A"))+
  ## manually customize colors for the bar graph with different color for each bar-define your own palette
  scale_fill_manual(values=c("white", "grey", "white", "grey", "white", "grey"))+
  # add error bars and change width of error bars
  geom_errorbar(aes(ymin = mean_disease-se_disease, ymax = mean_disease+se_disease),
                position = position_dodge(width = 0.7), width = 0.2)+
  theme(axis.text.x = element_text(angle = 90, size = 10, hjust =1, vjust = 0.5), axis.text.y = element_text(size=10),
        axis.ticks.length.y = unit(.20, "cm"),
        axis.ticks.length.x = unit(.15, "cm"), axis.title.x = element_blank())+ ylab(expression(log[10]~disease/sample~disc))
```

