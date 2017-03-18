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
        name = ~ replace_empty_str(name, replacement = NA_character_),
        startDate = ~ as.POSIXct(startDate, tz = "UTC"),
        endDate = ~ as.POSIXct(endDate, tz = "UTC"),
        sponsor = ~ replace_empty_str(sponsor),
        type = ~ replace_empty_str(type),
        venue = ~ replace_empty_str(venue),
        city = ~ replace_empty_str(city),
        country = ~ replace_empty_str(country),
        discipline = ~ replace_empty_str(discipline),
        sex = ~ replace_empty_str(sex),
        ageGroup = ~ replace_empty_str(ageGroup),
        url = ~ replace_empty_str(url, replacement = NA_character_),
        related = ~ replace_empty_str(related),
        stage = ~ replace_empty_str(stage),
        valueType = ~ replace_empty_str(valueType),
        shortName = ~ replace_empty_str(shortName, replacement = NA_character_),
        rankingType = ~ replace_empty_str(rankingType),
        twitter = ~ replace_empty_str(twitter, replacement = NA_character_),
        hashTag = ~ replace_empty_str(hashTag, replacement = NA_character_),
        photoURLs = ~ replace_empty_str(photoURLs, replacement = NA_character_),
        note = ~ replace_empty_str(note, replacement = NA_character_),
        commonNote = ~ replace_empty_str(commonNote, replacement = NA_character_)
      )
    ) %>%
    arrange_(~ desc(endDate))
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
        liveURL = ~ replace_empty_str(liveURL,
                                      replacement = NA_character_),
        detailsURL = ~ replace_empty_str(detailsURL,
                                         replacement = NA_character_),
        videoURL = ~ replace_empty_str(videoURL,
                                       replacement = NA_character_),
        initDate = ~ convert_date(initDate),
        modDate = ~ convert_date(modDate),
        startDate = ~ convert_date(startDate),
        endDate = ~ convert_date(endDate),
        scheduledDate = ~ convert_date(scheduledDate),
        frameScores = ~ replace_empty_str(frameScores,
                                          replacement = NA_character_),
        sessions = ~ replace_empty_str(sessions,
                                       replacement = NA_character_),
        note = ~ replace_empty_str(note,
                                   replacement = NA_character_),
        extendedNote = ~ replace_empty_str(extendedNote,
                                           replacement = NA_character_)
      )
    ) %>%
    arrange_(~ desc(endDate))
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
        teamName = ~ replace_empty_str(teamName),
        shortName = ~ replace_empty_str(shortName, NA_character_),
        nationality = ~ replace_empty_str(nationality),
        sex = ~ replace_empty_str(sex),
        bioPage = ~ replace_empty_str(bioPage, replacement = NA_character_),
        born = ~ as.POSIXct(replace_empty_str(born, NA_character_),
                            tz = "UTC"),
        twitter = ~ replace_empty_str(twitter, replacement = NA_character_),
        license = ~ replace_empty_str(license, replacement = NA_character_),
        club = ~ replace_empty_str(club),
        url = ~ replace_empty_str(url, replacement = NA_character_),
        photo = ~ replace_empty_str(photo, replacement = NA_character_),
        info = ~ replace_empty_str(info, replacement = NA_character_)
      )
    )
}

add_player_status <- function(player_query, status = "pro") {
  player_query %>%
    mutate_(
      .dots = list(
        status = ~ rep(status, nrow(.))
      )
    )
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
    )
}
