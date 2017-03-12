# Format query results

is_bad_query <- function(query) {
  identical(query, NA) ||
    identical(query, "") ||
    identical(query, NULL)
}

format_event <- function(event_query) {
  if (is_bad_query(event_query)) {
    return(NULL)
  }
  event_query %>%
    make_column_names() %>%
    rename_(
      .dots = list(
        id = ~ iD,
        eventPredictionId = ~ eventPredictionID
      )
    ) %>%
    mutate_(
      .dots = list(
        startDate = ~ as.POSIXct(startDate, tz = "UTC"),
        endDate = ~ as.POSIXct(endDate, tz = "UTC"),
        ageGroup = ~ replace_empty_str(ageGroup),
        stage = ~ replace_empty_str(stage),
        valueType = ~ replace_empty_str(valueType),
        shortName = ~ replace_empty_str(shortName, replacement = NA_character_),
        rankingType = ~ replace_empty_str(rankingType),
        twitter = ~ replace_empty_str(twitter, replacement = NA_character_),
        hashTag = ~ replace_empty_str(hashTag, replacement = NA_character_),
        photoURLs = ~ replace_empty_str(photoURLs, replacement = NA_character_)
      )
    ) %>%
    arrange_(~ endDate) %>%
    return()
}

format_match <- function(match_query) {
  if (is_bad_query(match_query)) {
    return(NULL)
  }
  match_query %>%
    make_column_names() %>%
    rename_(
      .dots = list(
        id = ~ iD,
        eventId = ~ eventID,
        player1Id = ~ player1ID,
        player2Id = ~ player2ID,
        winnerId = ~ winnerID,
        worldSnookerId = ~ worldSnookerID,
        liveURL = ~ liveUrl,
        detailsURL = ~ detailsUrl
      )
    ) %>%
    mutate_(
      .dots = list(
        initDate = ~ convert_date(initDate),
        modDate = ~ convert_date(modDate),
        startDate = ~ convert_date(startDate),
        endDate = ~ convert_date(endDate),
        scheduledDate = ~ convert_date(scheduledDate)
      )
    ) %>%
    return()
}

format_player <- function(player_query) {
  if (is_bad_query(player_query)) {
    return(NULL)
  }
  player_query %>%
    make_column_names() %>%
    rename_(
      .dots = list(
        id = ~ iD,
        url = ~ uRL
      )
    ) %>%
    mutate_(
      .dots = list(
        born = ~ as.POSIXct(replace_empty_str(born, NA_character_),
                            tz = "UTC")
      )
    ) %>%
    return()
}

add_player_status <- function(player_query, status = "pro") {
  player_query %>%
    mutate_(
      .dots = list(
        status = ~ rep(status, nrow(.))
      )
    ) %>%
    return()
}

format_ranking <- function(ranking_query) {
  if (is_bad_query(ranking_query)) {
    return(NULL)
  }
  ranking_query %>%
    make_column_names() %>%
    rename_(
      .dots = list(
        id = ~ iD,
        playerId = ~ playerID
      )
    ) %>%
    mutate_(
      .dots = list(
        sum = ~ as.integer(sum)
      )
    ) %>%
    return()
}
