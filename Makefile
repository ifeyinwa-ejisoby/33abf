report.html: raw_data/covid_sub.csv
	Rscript code/render_report.R

output/table_one.RDS: code/make_table.R raw_data/covid_sub.csv
	Rscript code/make_table.R
	
.PHONY: clean
clean:
	rm -f report.html