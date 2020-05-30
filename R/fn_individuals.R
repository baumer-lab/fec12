#' Individual Contributions Master metadata
#'
#' \code{read_all_individuals} returns a dataframe about transactions from individuals to candidates/committees
#'
#' @param n_max Integer specifying the max amount of entries in the dataset. Defaults to the possible maximum.
#' @param verbose A progress bar is shown if R is running interactively. Defaults to `interactive()`.
#' @return The entire dataframe. More information about variables is at `?individuals`.
#' @examples
#' \dontrun{read_all_individuals()}
#' \dontrun{read_all_individuals(n_max = 250)}
#' @import dplyr
#' @import readr
#' @export

read_all_individuals <- function(n_max = Inf, verbose = interactive()){
  if (!verbose) {
    invisible(utils::capture.output(
      dir <- usethis::use_zip(
        "https://www.fec.gov/files/bulk-downloads/2012/indiv12.zip",
        destdir = tempdir(), cleanup = TRUE
      )
    )
    )
  } else {
    dir <- usethis::use_zip(
      "https://www.fec.gov/files/bulk-downloads/2012/indiv12.zip",
      destdir = tempdir(), cleanup = TRUE
    )
  }

  indiv_path <- fs::path(dir, "itcont.txt")

  indiv_names <- read_csv("https://www.fec.gov/files/bulk-downloads/data_dictionaries/indiv_header_file.csv") %>%
    names() %>%
    tolower()

  individuals_all <- vroom::vroom(
    indiv_path,
    n_max = n_max,
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
  ) %>%
    select(-image_num, -sub_id, -memo_text, -memo_cd, -file_num) %>%
    mutate(
      transaction_dt = lubridate::mdy(transaction_dt)
    )
  return(individuals_all)
}
