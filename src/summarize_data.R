#! /usr/bin/env Rscript 
# summarize_data.R
# Ting Pan, Nov 22 2018
#
# This script imports the tidy version of the data
# and calculate the mean, standard error of mean, and 95% CI for each city
# then saves the table as a csv file in results folder
#
# Usage: Rscript scr/summarize_data.R


# load package
suppressPackageStartupMessages(library(tidyverse))

# import data
data <- read.csv("data/tidy_data.csv")

# create summarized table
table <- data %>% 
  group_by(city) %>% 
  summarise(n= sum(!is.na(PM_Average)),
            mean_PM = mean(PM_Average, na.rm = TRUE),
            se_PM = sd(PM_Average, na.rm = TRUE)/sqrt(n)) %>% 
  mutate(lower_ci = mean_PM - qnorm(0.975) * se_PM) %>% 
  mutate(upper_ci = mean_PM + qnorm(0.975) * se_PM) %>% 
  select(-"n")

# output to a csv file
write.csv(table, "results/summarized_data.csv", row.names = FALSE)