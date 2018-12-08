#! /usr/bin/env Rscript 
# analyze_data.R
# Wilson Deng and Ting Pan, Nov 22 2018
#
# This script imports the tidy version of the data
# and perform a welch two sample t test
# then stored the result as a csv file in results folder
#
# This script inputs tidy data and outputs results and testplot
# Usage: Rscript src/analyze_data.R data/tidy_data.csv results/results.csv

# load package
suppressPackageStartupMessages(library(broom))
suppressPackageStartupMessages(library(tidyverse))

# define main function
main <- function(){
  
  args <- commandArgs(trailingOnly = TRUE)
  input <- args[1]
  csv_path <- args[2]
  
  # import data
  data <- read.csv(input)
  
  # perform two-sample t test
  results <- tidy(t.test(PM_Average ~ city, data = data))
  
  # Assign parameters
  v = results[["parameter"]]
  threshold = qt(0.975, v)
  delta = results[["statistic"]]
  
  # Output csv
  write.csv(results, csv_path, row.names = FALSE)

}

# call main function
main()