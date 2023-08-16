library(rmarkdown)
library(knitr)
library(scales)

rmarkdown::render("src/danya_script.rmd", output_format = "html_document",
                  output_file = "danya.html")