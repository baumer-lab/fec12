library(tidyverse)

transactions_dir <- usethis::use_zip(
  "https://www.fec.gov/files/bulk-downloads/2012/oth12.zip",
  destdir = tempdir(), cleanup = TRUE
)

transactions_path <- fs::path(transactions_dir, "itoth.txt")

transactions_names <- read_csv("https://www.fec.gov/files/bulk-downloads/data_dictionaries/oth_header_file.csv") %>%
  names() %>%
  tolower()

transactions_all <- read_delim(
  transactions_path,
  col_names = transactions_names,
  col_types = cols(
    zip_code = col_character(),
    other_id = col_character(),
    memo_cd = col_character(),
    memo_text = col_character(),
    sub_id = col_character()
  ),
  delim = "|"
)

transactions <- transactions_all %>%
  select(-image_num, -sub_id, -memo_text, -memo_cd, -file_num) %>%
  sample_n(1000) %>%
  mutate(
    transaction_dt = lubridate::mdy(transaction_dt)
  )

usethis::use_data(transactions, overwrite = TRUE)
