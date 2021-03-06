#' Any Transaction From One Committee To Another
#'
#' \code{read_all_transactions} returns a dataframe about transaction data
#'
#' @param n_max Integer specifying the max amount of entries in the dataset. Defaults to the possible maximum.
#' @param verbose A progress bar is shown if R is running interactively. Defaults to `interactive()`.#' @return The entire dataframe. More information about variables is at `?transactions`.
#' @examples
#' \dontrun{read_all_transactions()}
#' \dontrun{read_all_transactions(n_max = 250)}
#' @import dplyr
#' @import readr
#' @export

read_all_transactions <- function(n_max = Inf, verbose = interactive()) {
  if (!verbose) {
    invisible(utils::capture.output(
      dir <- usethis::use_zip(
        "https://www.fec.gov/files/bulk-downloads/2012/oth12.zip",
        destdir = tempdir(), cleanup = TRUE
      )
    )
    )
  } else {
    dir <- usethis::use_zip(
      "https://www.fec.gov/files/bulk-downloads/2012/oth12.zip",
      destdir = tempdir(), cleanup = TRUE
    )
  }

  transactions_path <- fs::path(dir, "itoth.txt")

  transactions_names <- read_csv("https://www.fec.gov/files/bulk-downloads/data_dictionaries/oth_header_file.csv") %>%
    names() %>%
    tolower()

  transactions_all <- vroom::vroom(
    transactions_path,
    n_max = n_max,
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
    mutate(
      transaction_dt = lubridate::mdy(transaction_dt)
    )
  return(transactions)
}
