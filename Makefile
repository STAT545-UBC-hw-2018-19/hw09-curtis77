all: letterCount.html

clean:
	rm -f words.txt letterCount.csv histogram.tsv histogram.png report.md report.html letterCount.md letterCount.html letterCount.png

report.html: report.rmd histogram.tsv histogram.png
	Rscript -e 'rmarkdown::render("$<")'

histogram.png: histogram.tsv
	Rscript -e 'library(ggplot2); qplot(Length, Freq, data=read.delim("$<")); ggsave("$@")'
	rm Rplots.pdf

histogram.tsv: histogram.r words.txt
	Rscript $<
	
letterCount.html: letterCount.rmd letterCount.csv 
	Rscript -e 'rmarkdown::render("$<")'

letterCount.csv: letterCount.r words.txt
	Rscript $<

words.txt: /usr/share/dict/words
	cp $< $@
