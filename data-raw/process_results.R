library(tidyverse)

file <- fs::path(tempdir(), "results12.xls")

downloader::download(
  "https://transition.fec.gov/pubrec/fe2012/federalelections2012.xls",
  destfile = file
)

results_house <- readxl::read_excel(file, sheet = 12) %>%
   janitor::clean_names() %>%
   # delete unneccesary variables
   select(-x1, -state, -total_votes, -candidate_name, -contains("combined"),
          -ends_with("_la"), -candidate_name_last, -candidate_name_first) %>%
   rename(
     state = state_abbreviation,
     cand_id = fec_id_number,
     district_id = d,
     incumbent = i,
     won = ge_winner_indicator,
   ) %>%
  filter(cand_id != 'n/a', !str_detect(cand_id, "FULL TERM", ), str_detect(cand_id, "H")) %>%
  mutate(
    primary_votes = parse_number(primary_votes),
    general_votes = parse_number(general_votes),
    won = won == "W",
    incumbent = incumbent == "(I)"
  ) %>%
  replace_na(list(won = FALSE, incumbent = FALSE))

usethis::use_data(results_house, overwrite = TRUE)

# Senate

results_senate <- readxl::read_excel(file, sheet = 12
  ) %>%
  janitor::clean_names() %>%
  # delete unneccesary variables
  select(-x1, -state, -d, -total_votes, -candidate_name, -contains("combined"),
         -ends_with("_la"), -candidate_name_last, -candidate_name_first, -runoff_votes, -runoff_percent) %>%
  rename(
    state = state_abbreviation,
    cand_id = fec_id_number,
    incumbent = i,
    won = ge_winner_indicator
  ) %>%
  filter(cand_id != 'n/a', str_detect(cand_id, "S")) %>%
  mutate(
    primary_votes = parse_number(primary_votes),
    won = won == "W",
    incumbent = incumbent == "(I)"
  ) %>%
  replace_na(list(won = FALSE, incumbent = FALSE))

usethis::use_data(results_senate, overwrite = TRUE)

# President

results_president <- readxl::read_excel(file, sheet = 9) %>%
  janitor::clean_names() %>%
  # delete unneccesary variables
  select(-x1, -state, -general_election_date, -total_votes, -total_votes_number,
         -last_name_first, -last_name, -first_name) %>%
  rename(
    state = state_abbreviation,
    cand_id = fec_id,
    won = winner_indicator,
    general_votes = general_results
  ) %>%
  filter(cand_id != 'n/a') %>%
  mutate(
    won = won == "W",
  ) %>%
  replace_na(list(won = FALSE))

usethis::use_data(results_president, overwrite = TRUE)
