# Event template ----------------------------------------------------------
event_template <-
  structure(
    list(
      id = integer(0),
      name = character(0),
      startDate = structure(numeric(0),
                            class = c("POSIXct", "POSIXt"),
                            tzone = "UTC"),
      endDate = structure(numeric(0),
                          class = c("POSIXct", "POSIXt"),
                          tzone = "UTC"),
      sponsor = character(0),
      season = integer(0),
      type = character(0),
      num = integer(0),
      venue = character(0),
      city = character(0),
      country = character(0),
      discipline = character(0),
      main = integer(0),
      sex = character(0),
      ageGroup = character(0),
      url = character(0),
      related = character(0),
      stage = character(0),
      valueType = character(0),
      shortName = character(0),
      worldSnookerId = integer(0),
      rankingType = character(0),
      eventPredictionId = integer(0),
      team = logical(0),
      format = integer(0),
      twitter = character(0),
      hashTag = character(0),
      conversionRate = numeric(0),
      allRoundsAdded = logical(0),
      photoURLs = character(0),
      numCompetitors = integer(0),
      numUpcoming = integer(0),
      numActive = integer(0),
      numResults = integer(0),
      note = character(0),
      commonNote = character(0),
      defendingChampion = integer(0),
      previousEdition = integer(0)
    ),
    .Names = c("id", "name", "startDate", "endDate", "sponsor", "season",
               "type", "num", "venue", "city", "country", "discipline",
               "main", "sex", "ageGroup", "url", "related", "stage",
               "valueType", "shortName", "worldSnookerId", "rankingType",
               "eventPredictionId", "team", "format", "twitter", "hashTag",
               "conversionRate", "allRoundsAdded", "photoURLs",
               "numCompetitors", "numUpcoming", "numActive", "numResults",
                "note", "commonNote", "defendingChampion", "previousEdition"),
    row.names = integer(0),
    class = "data.frame"
  )


# Match template ----------------------------------------------------------
match_template <-
  structure(
    list(
      id = integer(0),
      eventId = integer(0),
      round = integer(0),
      number = integer(0),
      player1Id = integer(0),
      score1 = integer(0),
      walkover1 = logical(0),
      player2Id = integer(0),
      score2 = integer(0),
      walkover2 = logical(0),
      winnerId = integer(0),
      unfinished = logical(0),
      onBreak = logical(0),
      worldSnookerId = integer(0),
      liveURL = character(0),
      detailsURL = character(0),
      pointsDropped = logical(0),
      showCommonNote = logical(0),
      estimated = logical(0),
      type = integer(0),
      tableNo = integer(0),
      videoURL = character(0),
      initDate = structure(numeric(0),
                           class = c("POSIXct", "POSIXt"),
                           tzone = "UTC"),
      modDate = structure(numeric(0),
                          class = c("POSIXct", "POSIXt"),
                          tzone = "UTC"),
      startDate = structure(numeric(0),
                            class = c("POSIXct", "POSIXt"),
                            tzone = "UTC"),
      endDate = structure(numeric(0),
                          class = c("POSIXct", "POSIXt"),
                          tzone = "UTC"),
      scheduledDate = structure(numeric(0),
                                class = c("POSIXct", "POSIXt"),
                                tzone = "UTC"),
      frameScores = character(0),
      sessions = character(0),
      note = character(0),
      extendedNote = character(0)
    ),
    .Names = c("id", "eventId", "round", "number", "player1Id", "score1",
               "walkover1", "player2Id", "score2", "walkover2", "winnerId",
               "unfinished", "onBreak", "worldSnookerId", "liveURL",
               "detailsURL", "pointsDropped", "showCommonNote", "estimated",
               "type", "tableNo", "videoURL", "initDate", "modDate",
               "startDate", "endDate", "scheduledDate", "frameScores",
               "sessions", "note", "extendedNote"),
    row.names = integer(0),
    class = "data.frame"
  )

# Player template ---------------------------------------------------------
player_template <-
  structure(
    list(
      id = integer(0),
      type = integer(0),
      firstName = character(0),
      middleName = character(0),
      lastName = character(0),
      teamName = character(0),
      teamNumber = integer(0),
      teamSeason = integer(0),
      shortName = character(0),
      nationality = character(0),
      sex = character(0),
      bioPage = character(0),
      born = structure(numeric(0),
                       class = c("POSIXct", "POSIXt"),
                       tzone = "UTC"),
      twitter = character(0),
      surnameFirst = logical(0),
      license = character(0),
      club = character(0),
      url = character(0),
      photo = character(0),
      info = character(0),
      status = character(0)
    ),
    .Names = c("id", "type", "firstName", "middleName", "lastName",
               "teamName", "teamNumber", "teamSeason", "shortName",
               "nationality", "sex", "bioPage", "born", "twitter",
               "surnameFirst", "license", "club", "url", "photo",
               "info", "status"),
    row.names = integer(0),
    class = "data.frame"
  )

# Ranking template --------------------------------------------------------
ranking_template <-
  structure(
    list(
      id = integer(0),
      position = integer(0),
      playerId = integer(0),
      season = integer(0),
      sum = integer(0),
      type = character(0)
    ),
    .Names = c("id", "position", "playerId", "season", "sum", "type"),
    row.names = integer(0),
    class = "data.frame"
  )


# Creating internal data --------------------------------------------------
devtools::use_data(event_template, match_template,
                   player_template, ranking_template,
                   internal = TRUE)
