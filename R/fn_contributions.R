#' Committee contributions metadata
#'
#' \code{read_all_contributions} returns a dataframe about the committees master data
#'
#' @param n_max integer specifying the max amount of entries in the dataset, defaults to the possible maximum
#' @return The entire dataframe. More information about variables is at `?contributions`.
#' @examples
#' \dontrun{read_all_contributions()}
#' \dontrun{read_all_contributions(n_max = 250)}
#' @import dplyr
#' @import readr
#' @export

read_all_contributions <- function(n_max = Inf, verbose = interactive()) {
  if (!verbose) {
    invisible(
      msg <- utils::capture.output(
        dir <- usethis::use_zip(
          "https://www.fec.gov/files/bulk-downloads/2012/pas12.zip",
          destdir = tempdir(), cleanup = TRUE
        )
      )
    )
    cat(msg[-2], sep = "\n")
  } else {
    dir <- usethis::use_zip(
      "https://www.fec.gov/files/bulk-downloads/2012/pas212.zip",
      destdir = tempdir(), cleanup = TRUE
    )
  }

  file_path <- fs::path(dir, "itpas2.txt")

  exp_names <- read_csv("https://www.fec.gov/files/bulk-downloads/data_dictionaries/pas2_header_file.csv") %>%
    names() %>%
    tolower()

  contributions_all <- vroom::vroom(
    file_path,
    col_names = exp_names,
    col_types = cols(
      employer = col_character(),
      occupation = col_character()),
    n_max = n_max, delim = "|") %>%
    select(-employer, -occupation, -image_num, -memo_cd, -memo_text, -sub_id, -file_num) %>%
    mutate(
      transaction_dt = lubridate::mdy(transaction_dt)
    )
  return(contributions_all)
}
