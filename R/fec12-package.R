#' fec12: A Data Package for the 2012 Elections
#'
#' The fec12 package provides the following 9 datasets from the Federal Election Commission's 2011-2012 election cycle:
#'
#' @section Datasets:
#' \if{html}{\figure{hex_fec12.png}{options: align = "right" width="45\%" alt="Figure: hex_fec12.png"}}
#' \itemize{
#'   \item Candidates: [candidates]
#'   \item Committees: [committees]
#'   \item House Results: [results_house]
#'   \item Senate Results: [results_senate]
#'   \item Presidential Results: [results_president]
#'   \item Individual Contributions: [individuals]
#'   \item Committee Contributions: [contributions]
#'   \item House/Senate Current Campaigns: [campaigns]
#'   \item Operating Expenditures: [expenditures]
#'   \item Transactions From One Committee To Another: [transactions]
#'   \item Political Action Committee (PAC) and Party Summary Financial Information: [pac]}
#'
#' The entire [candidates], [committees], [campaigns], [results_house], [results_senate], [results_president], and [pac] datasets and samples containing 1000 entries of the other datasets are available directly in the package.
#' For the datasets comtaining samples, full versions can be retrieved via the following functions:
#' \itemize{
#'   \item Individual Contributions: [read_all_individuals]
#'   \item Committee Contributions: [read_all_contributions]
#'   \item Operating Expenditures: [read_all_expenditures]
#'   \item Transactions From One Committee To Another: [read_all_transactions]
#' }
#'
#' @section Authors:
#' \itemize{
#'   \item Marium Tapal: \url{https://github.com/mariumtapal}
#'   \item Irene Ryan: \url{https://github.com/ireneryan}
#'   \item Rana Gahwagy: \url{https://github.com/ranawg}
#'   \item Benjamin S. Baumer: \url{https://github.com/beanumber}
#' }
#'
#' @docType package
#' @name fec12
NULL
