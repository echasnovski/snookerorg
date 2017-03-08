# Format query results

format_event <- function(event_query) {
  event_query %>%
    make_column_names() %>%
    rename(id = iD,
           eventPredictionId = eventPredictionID) %>%
    mutate(
      startDate = as.POSIXct(startDate, tz = "UTC"),
      endDate = as.POSIXct(endDate, tz = "UTC"),
      ageGroup = replace_empty_str(ageGroup),
      stage = replace_empty_str(stage),
      valueType = replace_empty_str(valueType),
      shortName = replace_empty_str(shortName, replacement = NA_character_),
      rankingType = replace_empty_str(rankingType),
      twitter = replace_empty_str(twitter, replacement = NA_character_),
      hashTag = replace_empty_str(hashTag, replacement = NA_character_),
      photoURLs = replace_empty_str(photoURLs, replacement = NA_character_)
    ) %>%
    arrange(endDate) %>%
    return()
}

format_match <- function(match_query) {
  match_query %>%
    make_column_names() %>%
    rename(
      id = iD,
      eventId = eventID,
      player1Id = player1ID,
      player2Id = player2ID,
      winnerId = winnerID,
      worldSnookerId = worldSnookerID,
      liveURL = liveUrl,
      detailsURL = detailsUrl
    ) %>%
    mutate(
      initDate = convert_date(initDate),
      modDate = convert_date(modDate),
      startDate = convert_date(startDate),
      endDate = convert_date(endDate),
      scheduledDate = convert_date(scheduledDate)
    ) %>%
    return()
}

format_player <- function(player_query) {
  player_query %>%
    make_column_names() %>%
    rename(id = iD,
           url = uRL) %>%
    mutate(born = as.POSIXct(born, tz = "UTC")) %>%
    return()
}

add_player_status <- function(player_query, status = "pro") {
  player_query %>%
    mutate(status = status) %>%
    return()
}
