library(testthat)
context("Simplify")

test_that("simplifying is correct", {
  expect_identical(
    simplify_event(event_data = readRDS("test_format_season_events.rds")),
    readRDS(file = "test_simplify_season_events.rds")
  )
  expect_identical(
    simplify_match(match_data = readRDS("test_format_event_matches.rds")),
    readRDS(file = "test_simplify_event_matches.rds")
  )
  expect_identical(
    simplify_player(player_data =
                      readRDS("test_format_season_ama_players.rds") %>%
                      add_player_status(status = "ama")),
    readRDS(file = "test_simplify_season_ama_players.rds")
  )
})
