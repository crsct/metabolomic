library(rmarkdown)
library(knitr)
library(scales)

rmarkdown::render("project.rmd", output_format = "html_document",
                  output_file = "test_results_data_417.html")