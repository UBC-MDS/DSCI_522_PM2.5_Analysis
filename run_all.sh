# run_all.sh
# Wilson, Nov 23 2018

# This script runs all the codes in src folder
# and render all plots and tables from the codes
# then render the final report in the doc folder

# example usage:
# bash run_all.sh

Rscript src/tidy_data.R data/Beijing_PM.csv data/Shanghai_PM.csv data/tidy_data.csv
Rscript src/viz_data.R data/tidy_data.csv results/histogram.png results/boxplot.png
Rscript src/summarize_data.R data/tidy_data.csv results/summarized_data.csv
Rscript src/analyze_data.R data/tidy_data.csv results/results.csv results/testplot.png
Rscript -e "rmarkdown::render('doc/Report.Rmd', output_format = 'github_document')"
Rscript -e "rmarkdown::render('doc/Report.Rmd', output_format = 'pdf_document')"
Rscript -e "rmarkdown::render('doc/Report.Rmd', output_format = 'html_document')"
