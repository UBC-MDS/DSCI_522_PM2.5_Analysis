#! /usr/bin/env Rscript 
# tidy_data.R
# Wilson Deng, Nov 15 2018
#
# This script imports the data from Beijing_PM.csv and Shanghai_PM.csv.
# and calculates the average PM of each hour of each place and stored as an observation of that day
# add city column to each dataset and combine them
# then stored the tidy version of the data in data folder
#
# Usage: Rscript scr/tidy_data.R

# load package
suppressPackageStartupMessages(library(tidyverse))

# import data
BJ_data <- read.csv("data/Beijing_PM.csv")
SH_data <- read.csv("data/Shanghai_PM.csv")

# data wrangling
BJ_tidy <- BJ_data %>%
  group_by(year,month,day) %>% 
  summarise(PM_Average = mean(c(PM_Dongsi,PM_Dongsihuan,PM_Nongzhanguan,PM_US.Post), na.rm = TRUE)) %>%
  mutate(city = "Beijing")

SH_tidy <- SH_data %>%
  group_by(year,month,day) %>% 
  summarise(PM_Average = mean(c(PM_Jingan,PM_Xuhui,PM_US.Post), na.rm = TRUE)) %>%
  mutate(city = "Shanghai")

tidy_data <- bind_rows(BJ_tidy, SH_tidy)

# output two csv files
write.csv(tidy_data, "data/tidy_data.csv", row.names = FALSE)