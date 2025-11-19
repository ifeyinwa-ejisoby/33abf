report.html: raw_data/covid_sub.csv output/pneumonia_plot.png output/pneumonia_plot.rds output/pneumonia_table.rds output/table_one.RDS output/logistic_reg_table
	Rscript code/render_report.R


output/pneumonia_plot.png: code/pneumonia.R
	Rscript code/pneumonia.R
	
output/pneumonia_plot.rds: code/pneumonia.R
	Rscript code/pneumonia.R
	
output/pneumonia_table.rds: code/pneumonia.R
	Rscript code/pneumonia.R

output/table_one.RDS: code/make_table.R raw_data/covid_sub.csv
	Rscript code/make_table.R
	
output/logistic_reg_table: raw_data/covid_sub.csv
	Rscript Code/make_model.R

.PHONY: clean
clean:
	rm -f report.html && rm -f output/*
	
