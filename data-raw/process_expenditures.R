library(tidyverse)

dir <- usethis::use_zip(
  "https://www.fec.gov/files/bulk-downloads/2012/oppexp12.zip",
  destdir = tempdir(), cleanup = TRUE
)

oppexp_path <- fs::path(dir, "oppexp.txt")

oppexp_names <- read_csv("https://www.fec.gov/files/bulk-downloads/data_dictionaries/oppexp_header_file.csv") %>%
  names() %>%
  tolower()

oppexp_all <- read_delim(
  oppexp_path,
  col_names = oppexp_names,
  col_types = cols(
    zip_code = col_character(),
    other_id = col_character(),
    memo_cd = col_character(),
    memo_text = col_character(),
    sub_id = col_character()
  ),
  delim = "|"
)

expenditures <- oppexp_all %>%
  select(-image_num, -sub_id, -memo_text, -memo_cd, -file_num) %>%
  sample_n(1000) %>%
  mutate(
    transaction_dt = lubridate::mdy(transaction_dt)
  )

usethis::use_data(expenditures, overwrite = TRUE)
