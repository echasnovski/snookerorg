library(testthat)
context("Format")

test_that("formatting is correct", {
  expect_identical(
    format_event(
      event_query = readRDS(file = "test_query_season_events.rds")
    ),
    readRDS(file = "test_format_season_events.rds")
  )
  expect_identical(
    format_match(
      match_query = readRDS(file = "test_query_event_matches.rds")
    ),
    readRDS(file = "test_format_event_matches.rds")
  )
  expect_identical(
    format_player(
      player_query = readRDS(file = "test_query_season_ama_players.rds")
    ),
    readRDS(file = "test_format_season_ama_players.rds")
  )
  expect_identical(
    format_ranking(
      ranking_query = readRDS(file = "test_query_season_rankings.rds")
    ),
    readRDS(file = "test_format_season_rankings.rds")
  )
})
