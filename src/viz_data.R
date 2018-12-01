#! /usr/bin/env Rscript 
# viz_data.R
# Wilson Deng and Ting Pan, Nov 22 2018
#
# This script imports the tidy version of the data
# and creates a boxplot and a faceted histogram respect to Average_PM and city
# then saves two plots in the results folder
#
# This script inputs tidy data and outputs two figures
# Usage: Rscript src/viz_data.R data/tidy_data.csv results/histogram.png results/boxplot.png


# load package
suppressPackageStartupMessages(library(tidyverse))

# define main function
main <- function(){
  
  args <- commandArgs(trailingOnly = TRUE)
  input <- args[1]
  hist_path <- args[2]
  box_path <- args[3]
  
  # import data
  data <- read.csv(input)
  
  # create histogram
  histogram <- data %>% 
    ggplot(aes(PM_Average)) +
    geom_histogram() +
    xlim(c(0,400)) +
    facet_wrap(~ city) +
    theme_bw() +
    xlab("Average PM2.5 (μg/m3)") +
    ggtitle("Histogram of PM2.5 - Beijing vs. Shanghai")
  
  # create boxplot
  boxplot <- data %>% 
    ggplot(aes(x = city, y = PM_Average)) +
    geom_boxplot() +
    ylim(c(0,400)) +
    theme_bw() +
    ylab("Average PM2.5 (μg/m3)") +
    xlab("City") +
    ggtitle("Boxplot of PM2.5 - Beijing vs. Shanghai")

  # output to png
  png(hist_path)
  plot(histogram)
  png(box_path)
  plot(boxplot)
  dev.off()
}

# call main function
main()