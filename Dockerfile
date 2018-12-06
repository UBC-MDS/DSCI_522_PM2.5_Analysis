# Docker file for DSCI_522_PM2.5_Analysis
# Wilson Deng, Ting Pan, Dec 5 2018

# use rocker/tidyverse as the base image and
FROM rocker/tidyverse

# install the cowsay package
RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  && install2.r --error \
    --deps TRUE \
    cowsay


# Install R packages
RUN Rscript -e "install.packages('rmarkdown')"
RUN Rscript -e "install.packages('knitr')"
RUN Rscript -e "install.packages('broom')"
RUN Rscript -e "install.packages('kableExtra')"
