#' Description of \strong{event} data.frame
#'
#' @format A data.frame. Columns which likely to be used as factors record
#'   not available data as "Unknown". Other record as \code{NA}.
#'   Rows are arranged from the latest ended event to the earliest.
#'   The columns are:
#' \describe{
#'   \item{id}{<int>: identifier of event}
#'   \item{name}{<chr>: name of event}
#'   \item{startDate}{<dttm>: start date of event}
#'   \item{endDate}{<dttm>: end date of event}
#'   \item{sponsor}{<chr>: event's sponsor name}
#'   \item{season}{<int>: season event was played}
#'   \item{type}{<chr>: type of event (Amateur, Invitational, Ladies Ranking,
#'   Players Tour Championship, Qualifying, Qualifying School, Ranking,
#'   Seniors Event, Teams Event, Unknown)}
#'   \item{num}{<int>: ?}
#'   \item{venue}{<chr>: name of venue event was played}
#'   \item{city}{<chr>: city name event was played}
#'   \item{country}{<chr>: country name event was played}
#'   \item{discipline}{<chr>: discipline of event
#'   (snooker, six-red snooker, Power Snooker)}
#'   \item{main}{<int>: identifier of the main event in case
#'   the event is qualifying}
#'   \item{sex}{<chr>: sex of the players allowed (Both, Men, Women)}
#'   \item{ageGroup}{<chr>: age group of event's players
#'   (O - all players, S - seniors, U21 - under 21, Unknown - not available)}
#'   \item{url}{<chr>: URL of the event}
#'   \item{related}{<chr>: the name of the events group event is related to
#'   (many levels, e.g. "world" for World Championship,
#'   "uk" for UK Championship, "" for separate events etc.)}
#'   \item{stage}{<chr>: stage event represents inside "main" event
#'   (F - main stage, Q - qualifying, QS - qualifying school,
#'   Unknown - not available)}
#'   \item{valueType}{<chr>: event's type code (somewhat incomplete)}
#'   \item{shortName}{<chr>: short name of event}
#'   \item{worldSnookerId}{<int>: identifier in World Snooker database/site}
#'   \item{rankingType}{<chr>: ranking type of event (WR - world rankings,
#'   LWR - ladies world rankings, QS - qualifying school,
#'   Unknown - not available) (somewhat incomplete)}
#'   \item{eventPredictionId}{<int>: identifier for
#'   event prediction contest (?)}
#'   \item{team}{<lgl>: whether event is a team one}
#'   \item{format}{<int>: identifier of format (1 - ?, 2 - ?, 3 - ?)}
#'   \item{twitter}{<chr>: twitter account for the event (NA - not available)}
#'   \item{hashTag}{<chr>: twitter hashtag for the event (NA - not available)}
#'   \item{conversionRate}{<dbl>: ?}
#'   \item{allRoundsAdded}{<lgl>: whether all rounds of the event
#'   are added to database}
#'   \item{photoURLs}{<chr>: URL for event's photos}
#'   \item{numCompetitors}{<int>: number of competitors in main event
#'   (sometimes differs from actual by +-1)}
#'   \item{numUpcoming}{<int>: some number in case event is upcoming}
#'   \item{numActive}{<int>: number of active matches in event (?)}
#'   \item{numResults}{<int>: number of results added of event
#'   (sometimes inaccurate)}
#'   \item{note}{<chr>: note about event}
#'   \item{commonNote}{<chr>: another note about event}
#'   \item{defendingChampion}{<int>: identifier of player-defending
#'   champion (column "id" in \strong{player} data.frame)}
#'   \item{previousEdition}{<int>: identifier of previous edition of
#'   the event (column "id" in \strong{event} data.frame)
#'   (not for all tournaments)}
#' }
#'
#' @seealso \link{get_event} for querying data about single event
#' by its identifier
#'
#' \link{get_season_events} for querying data about events in specific season.
#'
#' \link{get_all_events} for querying data about all available events.
#'
#' @name event
NULL
