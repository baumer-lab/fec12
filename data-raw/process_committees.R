library(tidyverse)
library(usethis)

dir <- usethis::use_zip(
  "https://www.fec.gov/files/bulk-downloads/2012/cm12.zip",
  destdir = tempdir(), cleanup = TRUE
)

committee_path <- fs::path(dir, "cm.txt")

committee_names <- read_csv("https://www.fec.gov/files/bulk-downloads/data_dictionaries/cm_header_file.csv") %>%
  names() %>%
  tolower()

committees <- read_delim(
  committee_path,
  col_names = committee_names,
  delim = "|"
)

usethis::use_data(committees, overwrite = TRUE)
