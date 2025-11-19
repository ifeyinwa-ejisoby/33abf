report.html: raw_data/covid_sub.csv output/pneumonia_plot.png output/pneumonia_plot.rds output/pneumonia_table.rds
	Rscript code/render_report.R

output/pneumonia_plot.png: code/pneumonia.R
	Rscript code/pneumonia.R
	
output/pneumonia_plot.rds: code/pneumonia.R
	Rscript code/pneumonia.R
	
output/pneumonia_table.rds: code/pneumonia.R
	Rscript code/pneumonia.R
	
.PHONY: clean
clean:
	rm -f report.html && rm -f output/*