# have to run this
library(tidyverse)

dir <- usethis::use_zip(
  "https://www.fec.gov/files/bulk-downloads/2012/indiv12.zip",
  destdir = tempdir(), cleanup = TRUE
)

indiv_path <- fs::path(dir, "itcont.txt")

indiv_names <- read_csv("https://www.fec.gov/files/bulk-downloads/data_dictionaries/indiv_header_file.csv") %>%
  names() %>%
  tolower()

individuals_all <- read_delim(
  indiv_path,
  col_names = indiv_names,
  col_types = cols(
    zip_code = col_character(),
    other_id = col_character(),
    memo_cd = col_character(),
    memo_text = col_character(),
    sub_id = col_character(),
    transaction_tp = col_character()
  ),
  delim = "|"
)

individuals <- individuals_all %>%
  select(-image_num, -sub_id, -memo_text, -memo_cd, -file_num) %>%
  sample_n(1000) %>%
  mutate(
    transaction_dt = lubridate::mdy(transaction_dt)
  )

usethis::use_data(individuals, overwrite = TRUE)
