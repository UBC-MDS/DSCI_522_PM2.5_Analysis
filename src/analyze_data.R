#! /usr/bin/env Rscript 
# analyze_data.R
# Wilson Deng and Ting Pan, Nov 22 2018
#
# This script imports the tidy version of the data
# and perform a welch two sample t test
# then stored the result as a csv file in results folder
#
# This script inputs tidy data and outputs results and testplot
# Usage: Rscript src/analyze_data.R data/tidy_data.csv results/results.csv results/testplot.png

# load package
suppressPackageStartupMessages(library(broom))
suppressPackageStartupMessages(library(tidyverse))

# define main function
main <- function(){
  
  args <- commandArgs(trailingOnly = TRUE)
  input <- args[1]
  csv_path <- args[2]
  png_path <- args[3]
  
  # import data
  data <- read.csv(input)
  
  # perform two-sample t test
  results <- tidy(t.test(PM_Average ~ city, data = data))
  
  # Assign parameters
  v = results[["parameter"]]
  threshold = qt(0.975, v)
  delta = results[["statistic"]]
  
  # Create a plot  
  test_plot <- ggplot(data = data.frame(x = c(-5, 25)), aes(x)) + 
    stat_function(fun = dt, n = 101, args = list(df = v)) +
    theme_bw()  +
    geom_vline(xintercept = c(-threshold, threshold),
               color = "blue",
               lty = 2) +
    geom_vline(xintercept = delta,
               color = "red") + 
    annotate("text", x = 16, y = 0.25,size = 5, label = paste("Test statistic:",
                                                              round(delta,2),
                                                              "\n df:",
                                                              round(v,2))) +
    ylab("Density") +
    xlab("t-value")
  
  # Output csv
  write.csv(results, csv_path, row.names = FALSE)
  
  # Output png
  png(png_path)
  plot(test_plot)
  dev.off()
}

# call main function
main()