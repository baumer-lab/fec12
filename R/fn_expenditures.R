#' Operating Expenditures
#'
#' \code{read_all_expenditures} returns a dataframe about operating expenditure data
#'
#' @param n_max Integer specifying the max amount of entries in the dataset. Defaults to the possible maximum.
#' @param verbose A progress bar is shown if R is running interactively. Defaults to `interactive()`.
#' @return The entire dataframe. More information about variables is at `?expenditures`.
#' @examples
#' \dontrun{read_all_expenditures()}
#' \dontrun{read_all_expenditures(n_max = 250)}
#' @import dplyr
#' @import readr
#' @export

read_all_expenditures <- function(n_max = Inf, verbose = interactive()) {
  if (!verbose) {
    invisible(utils::capture.output(
      dir <- usethis::use_zip(
        "https://www.fec.gov/files/bulk-downloads/2012/oppexp12.zip",
        destdir = tempdir(), cleanup = TRUE
      )
    )
    )
  } else {
    dir <- usethis::use_zip(
      "https://www.fec.gov/files/bulk-downloads/2012/oppexp12.zip",
      destdir = tempdir(), cleanup = TRUE
    )
  }

  oppexp_path <- fs::path(dir, "oppexp.txt")

  oppexp_names <- read_csv("https://www.fec.gov/files/bulk-downloads/data_dictionaries/oppexp_header_file.csv") %>%
    names() %>%
    tolower()

  oppexp_all <- vroom::vroom(
    oppexp_path,
    n_max = n_max,
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

  expenditures_all <- oppexp_all %>%
    select(-image_num, -sub_id, -memo_text, -memo_cd, -file_num) %>%
    sample_n(n) %>%
    mutate(
      transaction_dt = lubridate::mdy(transaction_dt)
    )

  return(expenditures_all)
}
