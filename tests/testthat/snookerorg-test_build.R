event_query <- snookerorg::query_snookerorg("t=5", "s=2015")
match_query <- snookerorg::query_snookerorg("t=6", "e=416")
player_query <- snookerorg::query_snookerorg("t=10", "st=a", "s=2015")
ranking_query <- snookerorg::query_snookerorg("rt=MoneyRankings", "s=2015")

event_data <- format_event(event_query = event_query)
match_data <- format_match(match_query = match_query)
player_data <- format_player(player_query = player_query)
ranking_data <- format_ranking(ranking_query = ranking_query)

event_data_simpl <- simplify_event(event_data = event_data)
match_data_simpl <- simplify_match(match_data = match_data)
player_data_simpl <- simplify_player(player_data = player_data %>%
                                       add_player_status(status = "ama"))

saveRDS(object = event_query,
        file = file.path("tests", "testthat", "test_query_season_events.rds"))
saveRDS(object = match_query,
        file = file.path("tests", "testthat", "test_query_event_matches.rds"))
saveRDS(object = player_query,
        file = file.path("tests", "testthat",
                         "test_query_season_ama_players.rds"))
saveRDS(object = ranking_query,
        file = file.path("tests", "testthat",
                         "test_query_season_rankings.rds"))

saveRDS(object = event_data,
        file = file.path("tests", "testthat", "test_format_season_events.rds"))
saveRDS(object = match_data,
        file = file.path("tests", "testthat", "test_format_event_matches.rds"))
saveRDS(object = player_data,
        file = file.path("tests", "testthat",
                         "test_format_season_ama_players.rds"))
saveRDS(object = ranking_data,
        file = file.path("tests", "testthat",
                         "test_format_season_rankings.rds"))

saveRDS(object = event_data_simpl,
        file = file.path("tests", "testthat", "test_simplify_season_events.rds"))
saveRDS(object = match_data_simpl,
        file = file.path("tests", "testthat", "test_simplify_event_matches.rds"))
saveRDS(object = player_data_simpl,
        file = file.path("tests", "testthat", "test_simplify_season_ama_players.rds"))
