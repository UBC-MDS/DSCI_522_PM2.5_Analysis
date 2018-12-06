# run_all.sh
# Wilson, Nov 23 2018

# This script runs all the codes in src folder
# and render all plots and tables from the codes
# then render the final report in the doc folder

# example usage:
# bash run_all.sh

# run tidy_data.R and output tidy data
Rscript src/tidy_data.R data/Beijing_PM.csv data/Shanghai_PM.csv data/tidy_data.csv

# run viz_data.R and output two figures
Rscript src/viz_data.R data/tidy_data.csv results/histogram.png results/boxplot.png

# run summarize_data.R and output summarized data
Rscript src/summarize_data.R data/tidy_data.csv results/summarized_data.csv

# run analyze_data.R and output results and testplot
Rscript src/analyze_data.R data/tidy_data.csv results/results.csv results/testplot.png

# render three types of the report
Rscript -e "rmarkdown::render('doc/Report.Rmd', output_format = 'github_document')"
Rscript -e "rmarkdown::render('doc/Report.Rmd', output_format = 'pdf_document')"
Rscript -e "rmarkdown::render('doc/Report.Rmd', output_format = 'html_document')"
