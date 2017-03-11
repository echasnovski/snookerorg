library(testthat)
context("Query for multiple units")

expect_api_identical <- function(...) {
  expect_identical(...)
  Sys.sleep(1)
}

test_that("queries for multiple units are correct", {
  skip_on_cran()
  skip_on_travis()

  expect_api_identical(
    query_snookerorg("t=5", "s=2015"),
    readRDS(file = "test_query_season_events.rds")
  )
  expect_api_identical(
    query_snookerorg("t=6", "e=416"),
    readRDS(file = "test_query_event_matches.rds")
  )
  expect_api_identical(
    query_snookerorg("t=8", "p=17", "s=2014"),
    readRDS(file = "test_query_season_player_matches.rds")
  )
  expect_api_identical(
    query_snookerorg("t=9", "e=397"),
    readRDS(file = "test_query_event_players.rds")
  )
  expect_api_identical(
    query_snookerorg("t=10", "st=p", "s=2015"),
    readRDS(file = "test_query_season_pro_players.rds")
  )
  expect_api_identical(
    query_snookerorg("t=10", "st=a", "s=2015"),
    readRDS(file = "test_query_season_ama_players.rds")
  )
  expect_api_identical(
    query_snookerorg("rt=MoneyRankings", "s=2015"),
    readRDS(file = "test_query_season_rankings.rds")
  )
})
