# Docker file for DSCI_522_PM2.5_Analysis
# Wilson Deng, Ting Pan, Dec 5 2018

# use rocker/tidyverse as the base image and
FROM rocker/tidyverse

# install the rmarkdown, knitr, broom, kableExtra package
RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  && install2.r --error \
    --deps TRUE \
    rmarkdown \
    knitr \
    broom \
    kableExtra
