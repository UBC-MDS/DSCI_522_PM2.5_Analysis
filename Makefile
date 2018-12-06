# Makefile
# Wilson Deng, Ting Pan, Nov 27 2018

# This Makefile script run scripts separately
# can render plots and tables from the codes
# and render the final report in the doc folder
# use `make clean` to clean output

# example usage:
# make all

# render the report and all other outputs
all : doc/Report.md doc/Report.html

# run tidy_data.R and output tidy data
data/tidy_data.csv : src/tidy_data.R data/Beijing_PM.csv data/Shanghai_PM.csv
	Rscript src/tidy_data.R data/Beijing_PM.csv data/Shanghai_PM.csv data/tidy_data.csv

# run viz_data.R and output two figures
results/histogram.png results/boxplot.png : src/viz_data.R data/tidy_data.csv
	Rscript src/viz_data.R data/tidy_data.csv results/histogram.png results/boxplot.png

# run summarize_data.R and output summarized data
results/summarized_data.csv : src/summarize_data.R data/tidy_data.csv
	Rscript src/summarize_data.R data/tidy_data.csv results/summarized_data.csv

# run analyze_data.R and output results and testplot
results/results.csv results/testplot.png : src/analyze_data.R data/tidy_data.csv
	Rscript src/analyze_data.R data/tidy_data.csv results/results.csv results/testplot.png

# render md type of the report
doc/Report.md : doc/Report.Rmd src/tidy_data.R data/Beijing_PM.csv data/Shanghai_PM.csv data/tidy_data.csv results/histogram.png results/boxplot.png results/summarized_data.csv results/results.csv results/testplot.png
	Rscript -e "rmarkdown::render('doc/Report.Rmd', output_format = 'github_document')"


# render html type of the report
doc/Report.html : doc/Report.Rmd src/tidy_data.R data/Beijing_PM.csv data/Shanghai_PM.csv data/tidy_data.csv results/histogram.png results/boxplot.png results/summarized_data.csv results/results.csv results/testplot.png
	Rscript -e "rmarkdown::render('doc/Report.Rmd', output_format = 'html_document')"

# clean all the outputs
clean :
	rm -f data/tidy_data.csv
	rm -f results/histogram.png results/boxplot.png
	rm -f results/summarized_data.csv
	rm -f results/results.csv results/testplot.png
	rm -f doc/Report.md doc/Report.html doc/Report.tex doc/Report.log
