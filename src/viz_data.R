#! /usr/bin/env Rscript 
# viz_data.R
# Wilson Deng, Nov 22 2018
#
# This script imports the tidy version of the data
# and creates a boxplot and a faceted histogram respect to Average_PM and city
# then saves two plots in the results folder
#
# Usage: Rscript scr/viz_data.R


# load package
suppressPackageStartupMessages(library(tidyverse))

# import data
data <- read.csv("data/tidy_data.csv")

# create histogram
histogram <- data %>% 
  ggplot(aes(PM_Average)) +
  geom_histogram() +
  xlim(c(0,400)) +
  facet_wrap(~ city) +
  theme_bw() +
  xlab("Average PM2.5") +
  ggtitle("Histogram of PM2.5 - Beijing vs. Shanghai")

# create boxplot
boxplot <- data %>% 
  ggplot(aes(x = city, y = PM_Average)) +
  geom_boxplot() +
  ylim(c(0,400)) +
  theme_bw() +
  ylab("Average PM2.5") +
  xlab("City") +
  ggtitle("Boxplot of PM2.5 - Beijing vs. Shanghai")

# output to png
png('results/histogram.png')
plot(histogram)
png('results/boxplot.png')
plot(boxplot)
dev.off()
