# DSCI 522 Analysis of PM 2.5 in Beijing and Shanghai
Data analysis project for DSCI 522 - Analyzing PM 2.5 in Beijing and Shanghai 

## Team members

[Wilson Deng](https://github.com/xiaoweideng)

[Ting Pan](https://github.com/panntingg)

## Summary

***What is PM2.5?***


Particulate matter(PM) - also known as Atmospheric aerosol particles - are microscopic solid or liquid matter suspended in the atmosphere of Earth. PM2.5 are fine particles with a diameter of 2.5 μm or less. They have impacts on climate and precipitation that adversely affect human health. In other words, it's used as a measure of pollution. 

PM2.5 readings are often included in air quality reports from environmental authorities and companies. We collect our data from [PM2.5 Data of Five Chinese Cities from Kaggle.com](https://www.kaggle.com/uciml/pm25-data-for-five-chinese-cities). The time period for this data is between Jan 1st, 2010 to Dec 31st, 2015. PM2.5 data are collected each hour each day from several locations of each city. The missing data are denoted as NA.

This data analysis project deals one inferential question: **Is the average PM2.5 in Beijing same as that in Shanghai?**

We would perform hypothesis testing for the difference between two population means of PM2.5 in Beijing and Shanghai, and conduct a two-sample t-test of the null hypothesis. Also, necessary visualization and interpretation are included.

## Plan


First of all, we will select the columns of the time information and the place information, as well as the PM2.5 values, which will be used in our project. Then, for each day, we will calculate the average PM2.5 of all places and all hours as an observation of the specific day. Furthermore, we would use the wrangled data to show comparison between PM2.5 of Beijing and Shanghai by visualiztion and hypothesis testing.

The Null/Alternative Hypothesises are as follows:

- Null Hypothesis: The average PM2.5 in Beijing is the same as the average PM2.5 in Shanghai.

- Alternative Hypothesis: The average PM2.5 in Beijing is NOT the same as the average PM2.5 in Shanghai.

And we would show the test results and necessary visualization.

## Usage
<br> 
1. Clone this repo, and using the command line, navigate to the root of this project.

2. Run the following commands:

```
make all
```
This would run all the scripts, create summarized table and graphs and render the final report.

<br> OR you could run scrapts respectively.

```
# run tidy_data.R, input two raw datasets and output tidy data
# dependency: tidyverse
make data/tidy_data.csv
# run viz_data.R, input tidy data and output two figures
# dependency: tidyverse
make results/histogram.png
# run summarize_data.R, input tidy data and output summarized data
# dependency: tidyverse
make results/summarized_data.csv
# run analyze_data.R, input tidy data and output results and testplot
# dependency: tidyverse, broom
make results/results.csv results/testplot.png
# input all above results and render md version of the report
# dependency: rmarkdownm, knitr, tidyverse and kableExtra
make doc/Report.md
# render html version of the report
# dependency: rmarkdownm, knitr, tidyverse and kableExtra
doc/Report.html
```

You could find our final report in the `doc` folder after running the script. OR you could click [Final Report](https://github.com/UBC-MDS/DSCI_522_PM2.5_Analysis/blob/master/doc/Report.md).


The following command cleans outputs.
```
make clean
```

## Dependencies
- R & R libraries:
    - `rmarkdown` Version 1.10
    - `knitr` Version 1.20
    - `tidyverse` Version 1.2.1
    - `broom` Version 0.5.0
    - `kableExtra` Version 0.9.0