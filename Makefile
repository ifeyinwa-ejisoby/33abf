report.html: raw_data/covid_sub.csv
	Rscript code/render_report.R

.PHONY: clean
clean:
	rm -f report.html