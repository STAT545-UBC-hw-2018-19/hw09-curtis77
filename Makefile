all: letterCount.html

clean:
	rm -f words.txt letterCount.csv letterCount.md letterCount.html letterCount.png
	
letterCount.html: letterCount.rmd letterCount.csv 
	Rscript -e 'rmarkdown::render("$<")'

letterCount.csv: letterCount.r words.txt
	Rscript $<

words.txt: /usr/share/dict/words
	cp $< $@
