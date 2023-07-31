FILE=project

ALL=$(FILE).pdf

$(FILE).md: src/$(FILE).rmd
	Rscript -e "require(knitr); require(markdown); knit('src/$(FILE).rmd', '$(FILE).md');" 
	
$(FILE).pdf: $(FILE).md
	pandoc $(FILE).md --pdf-engine=latexmk -o $(FILE).pdf