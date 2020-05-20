library(tidyverse)

dir <- usethis::use_zip(
  "https://www.fec.gov/files/bulk-downloads/2012/pas212.zip",
  destdir = tempdir(), cleanup = TRUE
)

file_path <- fs::path(dir, "itpas2.txt")

exp_names <- read_csv("https://www.fec.gov/files/bulk-downloads/data_dictionaries/pas2_header_file.csv") %>%
  names() %>%
  tolower()

contributions <- read_delim(
  file_path,
  col_names = exp_names,
  col_types = cols(
    employer = col_character(),
    occupation = col_character()
  ),
  delim = "|"
) %>%
  select(-employer, -occupation, -image_num, -memo_cd, -memo_text, -sub_id, -file_num) %>%
  mutate(
    transaction_dt = lubridate::mdy(transaction_dt)
  ) %>%
  sample_n(1000)
#  filter(primary_general_indicator == "G2016") %>%
#  group_by(cand_id) %>%
#  summarise(number_of_contributions = n(), total_contributions = sum(transaction_amount[transaction_amount>0]), net_contributions = sum(transaction_amount))

usethis::use_data(contributions, overwrite = TRUE)
