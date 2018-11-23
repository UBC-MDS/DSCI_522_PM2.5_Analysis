#! /usr/bin/env Rscript 
# analyze_data.R
# Wilson Deng, Nov 22 2018
#
# This script imports the tidy version of the data
# and perform a welch two sample t test
# then stored the result as a csv file in results folder
#
# Usage: Rscript scr/analyze_data.R

# load package
suppressPackageStartupMessages(library(broom))

# import data
data <- read.csv("data/tidy_data.csv")

# perform two-sample t test
results <- tidy(t.test(PM_Average ~ city, data = data))

# Output csv
write.csv(results, "results/results.csv", row.names = FALSE)