context("Get data by ID")

test_that("default arguments return data templates", {
  expect_identical(get_events(), event_template)
  expect_identical(get_matches(), match_template)
  expect_identical(get_players(), player_template)
})
