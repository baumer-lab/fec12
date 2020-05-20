library(tidyverse)

pac_dir <- usethis::use_zip(
  "https://www.fec.gov/files/bulk-downloads/2012/webk12.zip",
  destdir = tempdir(), cleanup = TRUE
)

pac_path <- fs::path(pac_dir, "webk12.txt")

pac_names <- c("CMTE_ID", "CMTE_NM", "CMTE_TP", "CMTE_DSGN", "CMTE_FILING_FREQ", "TTL_RECEIPTS",
               "TRANS_FROM_AFF", "INDV_CONTRIB", "OTHER_POL_CMTE_CONTRIB", "CAND_CONTRIB",
               "CAND_LOANS", "TTL_LOANS_RECEIVED", "TTL_DISB", "TRANF_TO_AFF", "INDV_REFUNDS",
               "OTHER_POL_CMTE_REFUNDS", "CAND_LOAN_REPAY", "LOAN_REPAY", "COH_BOP", "COH_COP",
               "DEBTS_OWED_BY", "NONFED_TRANS_RECEIVED", "CONTRIB_TO_OTHER_CMTE", "IND_EXP",
               "PTY_COORD_EXP", "NONFED_SHARE_EXP", "CVG_END_DT") %>%
  tolower()

pac <- read_delim(
  pac_path,
  col_names = pac_names,
  delim = "|"
) %>% mutate(
  cvg_end_dt = lubridate::mdy(cvg_end_dt))

usethis::use_data(pac, overwrite = TRUE)
