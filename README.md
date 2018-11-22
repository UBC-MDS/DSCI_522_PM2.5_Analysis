# DSCI 522 Analysis of PM 2.5 in Beijing and Shanghai
Data analysis project for DSCI 522 - Analyzing PM 2.5 in Beijing and Shanghai 

## Team members

[Wilson Deng](https://github.com/xiaoweideng)

[Ting Pan](https://github.com/panntingg)


## Data
- Source: [PM2.5 Data of Five Chinese Cities from Kaggle.com](https://www.kaggle.com/uciml/pm25-data-for-five-chinese-cities)

- Context
<br> PM2.5 readings are often included in air quality reports from environmental authorities and companies. PM2.5 refers to atmospheric particulate matter (PM) that have a diameter less than 2.5 micrometers. In other words, it's used as a measure of pollution. 

- Content
<br> The time period for this data is between Jan 1st, 2010 to Dec 31st, 2015. Missing data are denoted as NA. 


## Question

- Question: **Is the average PM2.5 in Beijing same as that in Shanghai?**

- Type of Question: Inferential.

## Plan


Null Hypothesis: The average PM2.5 in Beijing is the same as the average PM2.5 in Shanghai.

Alternative Hypothesis: The average PM2.5 in Beijing is NOT the same as the average PM2.5 in Shanghai.

To effectively compare the average PM2.5 in Beijing and Shanghai, we plan to do a **hypothesis test** over the two datasets. Also, two-sample t test will be applied to our question. We have learnt about how to do this in our DSCI 552 class.

First of all, we will select the columns of the time information and the place information, as well as the PM2.5 values, which will be used in our project. Then, for each day, we will calculate the average PM2.5 of all places and all hours as an observation of the specific day. 

## How to Summarize

Create a visualization of the data that shows the estimate, confidence intervals and distribution for each sample. We will also visualize the cut-off for the significance level and our test statistic on the visualization.
