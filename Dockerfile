# Docker file for DSCI_522_PM2.5_Analysis
# Wilson Deng, Ting Pan, Dec 5 2018

# use rocker/tidyverse as the base image and
FROM rocker/tidyverse

# Install R packages
RUN Rscript -e "install.packages('rmarkdown')"
RUN Rscript -e "install.packages('knitr')"
RUN Rscript -e "install.packages('broom')"
RUN Rscript -e "install.packages('plyr')"
