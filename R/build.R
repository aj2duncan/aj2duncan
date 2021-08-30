#blogdown::build_dir("static")
if (!dir.exists("public/msmbstyle")) dir.create("public/msmbstyle")
setwd("static/msmbstyle")
bookdown::render_book("index.Rmd", clean = FALSE, 
                      output_dir = "../../public/msmbstyle")
setwd("../../")