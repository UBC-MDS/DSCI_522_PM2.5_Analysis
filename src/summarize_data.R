#! /usr/bin/env Rscript 
# summarize_data.R
# Ting Pan and Wilson Deng, Nov 22 2018
#
# This script imports the tidy version of the data
# and calculate the mean, standard error of mean, and 95% CI for each city
# then saves the table as a csv file in results folder
#
# This script inputs tidy data and outputs summarized data
# Usage: Rscript src/summarize_data.R data/tidy_data.csv results/summarized_data.csv


# load package
suppressPackageStartupMessages(library(tidyverse))


# define main function
main <- function(){
  
  args <- commandArgs(trailingOnly = TRUE)
  input <- args[1]
  csv_path <- args[2]
  
  # import data
  data <- read.csv(input)
  
  # create summarized table
  table <- data %>% 
    group_by(city) %>% 
    summarise(n= sum(!is.na(PM_Average)),
              mean_PM = mean(PM_Average, na.rm = TRUE),
              se_PM = sd(PM_Average, na.rm = TRUE)/sqrt(n)) %>% 
    mutate(lower_ci = mean_PM - qnorm(0.975) * se_PM) %>% 
    mutate(upper_ci = mean_PM + qnorm(0.975) * se_PM)
  
  # output to a csv file
  write.csv(table, csv_path, row.names = FALSE)
}

# call main function
main()