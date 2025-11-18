report.html: raw_data/covid_sub.csv
	Rscript code/render_report.R
	
output/pneumonia_table.rds output/pneumonia_plot.png: raw_data/covid_sub.csv
	Rscript code/pneumonia.R

.PHONY: clean
clean:
	rm -f report.html