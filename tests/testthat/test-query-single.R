library(testthat)
context("Query for single unit")

expect_api_identical <- function(...) {
  expect_identical(...)
  Sys.sleep(1)
}

test_that("queries for single unit are correct", {
  skip_on_cran()
  skip_on_travis()

  expect_api_identical(
    query_snookerorg("e=398"),
    readRDS(file = "test_query_event.rds")
  )
  expect_api_identical(
    query_snookerorg("e=404", "r=1", "n=1"),
    readRDS(file = "test_query_match.rds")
  )
  expect_api_identical(
    query_snookerorg("p=154"),
    readRDS(file = "test_query_player.rds")
  )
})
