report.html: raw_data/covid_sub.csv
	Rscript Code/render_report.R
	
output/logistic_reg_table: raw_data/covid_sub.csv
	Rscript Code/make_model.R
	
.PHONY: clean
clean:
	rm -f report.html && rm -f output/*.rds