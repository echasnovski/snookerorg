context("Get all data")

test_that("default arguments return data templates", {
  expect_identical(get_all_player_matches(), match_template)
})
