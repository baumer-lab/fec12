library(tidyverse)

camp_dir <- usethis::use_zip(
  "https://www.fec.gov/files/bulk-downloads/2012/webl12.zip",
  destdir = tempdir(), cleanup = TRUE
)

camp_path <- fs::path(camp_dir, "webl12.txt")

# no header file therefore manually typed in
camp_names <- c("CAND_ID", "CAND_NAME", "CAND_ICI", "PTY_CD", "CAND_PTY_AFFILIATION", "TTL_RECEIPTS",
                "TRANS_FROM_AUTH", "TTL_DISB", "TRANS_TO_AUTH", "COH_BOP", "COH_COP", "CAND_CONTRIB",
                "CAND_LOANS", "OTHER_LOANS", "CAND_LOAN_REPAY", "OTHER_LOAN_REPAY", "DEBTS_OWED_BY",
                "TTL_INDIV_CONTRIB", "CAND_OFFICE_ST", "CAND_OFFICE_DISTRICT", "SPEC_ELECTION",
                "PRIM_ELECTION", "RUN_ELECTION", "GEN_ELECTION", "GEN_ELECTION_PRECENT",
                "OTHER_POL_CMTE_CONTRIB", "POL_PTY_CONTRIB", "CVG_END_DT", "INDIV_REFUNDS", "CMTE_REFUNDS") %>% tolower()

campaigns_all <- read_delim(
  camp_path,
  col_names = camp_names,
  delim = "|"
)

campaigns <- campaigns_all %>%
  select(-spec_election, -prim_election, -run_election, -gen_election, -gen_election_precent) %>%
  mutate(
    cvg_end_dt = lubridate::mdy(cvg_end_dt)
  )

usethis::use_data(campaigns, overwrite = TRUE)
