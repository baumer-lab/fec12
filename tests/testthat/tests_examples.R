library(testthat)
library(dplyr)
context("Dimensions of data")

# candidates

test_that("number of columns in candidates df is correct", {
  expect_equal(ncol(candidates), 15)
  expect_equal(nrow(candidates), 5628)
})

# committees

test_that("number of rows in committees df is correct", {
  expect_equal(nrow(committees), 14455)
  expect_equal(ncol(committees), 15)
})

# results
test_that("house results are accurate", {
  expect_equal(
    results_house %>%
      pull(cand_id) %>%
      unique() %>%
      length(),
    1972
  )
  expect_gt(
    results_house %>%
        group_by(state, district_id) %>%
        count() %>%
        nrow(),
     438
  )
  # territories
  expect_equal(
    results_house %>%
        filter(!state %in% state.abb) %>%
        pull(state) %>%
        unique() %>%
        length(),
     6
  )
})


# committee_contributions
test_that("contributions is the right size", {
  expect_equal(nrow(contributions), 1000)
  expect_equal(ncol(contributions), 15)
  skip("internal test")
  x <- read_all_contributions()
  expect_equal(nrow(x), 394291)
})

# #individuals

test_that("number of rows in individuals df is correct", {
  expect_gt(nrow(individuals), 0)
})

