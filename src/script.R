library(rmarkdown)
library(knitr)
library(scales)

rmarkdown::render("src/project.rmd", output_format = "html_document",
                  output_file = "project.html")