#! /usr/bin/env Rscript 
# tidy_data.R
# Wilson Deng and Ting Pan, Nov 15 2018
#
# This script imports the data from Beijing_PM.csv and Shanghai_PM.csv.
# and calculates the average PM of each hour of each place and stored as an observation of that day
# add city column to each dataset and combine them
# then stored the tidy version of the data in data folder
# 
# This script inputs two raw datasets and outputs tidy data
# Usage: Rscript src/tidy_data.R data/Beijing_PM.csv data/Shanghai_PM.csv data/tidy_data.csv

# load package
suppressPackageStartupMessages(library(tidyverse))

# define main function
main <- function(){
  
  args <- commandArgs(trailingOnly = TRUE)
  BJ <- args[1]
  SH <- args[2]
  output <- args[3]
  
  # read data
  BJ_data <- read.csv(BJ)
  SH_data <- read.csv(SH)

  # data wrangling
  BJ_tidy <- BJ_data %>%
    group_by(year,month,day) %>% 
    summarise(PM_Average = mean(c(PM_Dongsi,PM_Dongsihuan,PM_Nongzhanguan,PM_US.Post), na.rm = TRUE)) %>%
    mutate(city = "Beijing")
  
  SH_tidy <- SH_data %>%
    group_by(year,month,day) %>% 
    summarise(PM_Average = mean(c(PM_Jingan,PM_Xuhui,PM_US.Post), na.rm = TRUE)) %>%
    mutate(city = "Shanghai")
  
  tidy_data <- bind_rows(BJ_tidy, SH_tidy) %>% arrange(year, month, day)
  
  # output two csv files
  write.csv(tidy_data, output, row.names = FALSE)
}

# call main function
main()
