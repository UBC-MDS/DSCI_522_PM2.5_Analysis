#! /usr/bin/env Rscript 
# Import_data.R
# Wilson Deng, Nov 15 2018
#
# This script imports the data from BeijingPM20100101_20151231.csv and ShanghaiPM20100101_20151231.csv.
# And print the average PM of beijing_US.Post
# This script takes no arguments.
#
# Usage: Rscript Import_data.R

library(tidyverse)

beijing_pm <- read.csv("../data/BeijingPM20100101_20151231.csv")
shanghai_pm <- read.csv("../data/ShanghaiPM20100101_20151231.csv")

print(mean(beijing_pm$PM_US.Post, na.rm = TRUE))