library(testthat)
library(dplyr)
context("Dimensions of data")

# candidates

test_that("number of columns in candidates df is correct", {
  expect_equal(ncol(candidates), 15)
})


# committees

test_that("number of rows in committees df is correct", {
  expect_equal(nrow(committees), 17654)
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
})

# #individuals

test_that("number of rows in individuals df is correct", {
  expect_gt(nrow(individuals), 0)
})
