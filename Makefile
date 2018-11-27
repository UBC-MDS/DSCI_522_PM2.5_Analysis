# Makefile
# Wilson, Nov 27 2018

# This Makefile script run scripts separately
# can render plots and tables from the codes
# and render the final report in the doc folder

# example usage:
# make doc/Report.md
# make doc/Report.pdf

data/tidy_data.csv : src/tidy_data.R data/Beijing_PM.csv data/Shanghai_PM.csv
	Rscript src/tidy_data.R data/Beijing_PM.csv data/Shanghai_PM.csv data/tidy_data.csv

results/histogram.png results/boxplot.png : src/viz_data.R data/tidy_data.csv
	Rscript src/viz_data.R data/tidy_data.csv results/histogram.png results/boxplot.png

results/summarized_data.csv : src/summarize_data.R data/tidy_data.csv
	Rscript src/summarize_data.R data/tidy_data.csv results/summarized_data.csv

results/results.csv results/testplot.png : src/analyze_data.R data/tidy_data.csv
	Rscript src/analyze_data.R data/tidy_data.csv results/results.csv results/testplot.png

doc/Report.md : doc/Report.Rmd src/tidy_data.R data/Beijing_PM.csv data/Shanghai_PM.csv data/tidy_data.csv results/histogram.png results/boxplot.png results/summarized_data.csv results/results.csv results/testplot.png
	Rscript -e "rmarkdown::render('doc/Report.Rmd', output_format = 'github_document')"

doc/Report.pdf : doc/Report.Rmd src/tidy_data.R data/Beijing_PM.csv data/Shanghai_PM.csv data/tidy_data.csv results/histogram.png results/boxplot.png results/summarized_data.csv results/results.csv results/testplot.png
	Rscript -e "rmarkdown::render('doc/Report.Rmd', output_format = 'pdf_document')"

doc/Report.html : doc/Report.Rmd src/tidy_data.R data/Beijing_PM.csv data/Shanghai_PM.csv data/tidy_data.csv results/histogram.png results/boxplot.png results/summarized_data.csv results/results.csv results/testplot.png
	Rscript -e "rmarkdown::render('doc/Report.Rmd', output_format = 'html_document')"

clean :
	rm -f data/tidy_data.csv
	rm -f results/histogram.png results/boxplot.png
	rm -f results/summarized_data.csv
	rm -f results/results.csv results/testplot.png
	rm -f doc/Report.md doc/Report.pdf doc/Report.html doc/Report.tex
