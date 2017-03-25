context("Get multiple data")

test_that("default arguments return data templates", {
  expect_identical(get_season_events(), event_template)
  expect_identical(get_event_matches(), match_template)
  expect_identical(get_season_player_matches(), match_template)
  expect_identical(get_event_players(), player_template)
  expect_identical(get_season_pro_players(), player_template)
  expect_identical(get_season_ama_players(), player_template)
  expect_identical(get_season_rankings(), ranking_template)
})
