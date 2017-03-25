#' Get multiple data for one unit
#'
#' These functions return multiple data for a specific unit.
#'
#' @param season_id Year of a season start
#' @param event_id Event id in character, integer or numeric form
#' @param player_id Player id in character, integer or numeric form
#'
#' @details Seasons in snooker start approximately in May-June and end
#'   not long after World Championship ends.
#'
#' @return \code{get_season_events} returns data.frame of \link[=event]{events} in
#'   a specific season.
#'
#'   \code{get_event_matches} returns data.frame of \link[=match]{matches} in
#'   a specific event.
#'
#'   \code{get_ongoing_matches} returns data.frame of \link[=match]{matches}
#'   that are being played at the moment of query.
#'
#'   \code{get_season_player_matches} returns data.frame of
#'   \link[=match]{matches} for a specific player in a specific season.
#'
#'   \code{get_event_players} returns data.frame of \link[=player]{players} in
#'   a specific event. Column \code{status} is filled with \code{NA}.
#'
#'   \code{get_season_pro_players} returns data.frame of professional
#'   \link[=player]{players} in a specific season. Column \code{status} is
#'   filled with \code{pro}.
#'
#'   \code{get_season_ama_players} returns data.frame of amateur
#'   \link[=player]{players} in a specific season. Column \code{status} is
#'   filled with \code{ama}.
#'
#'   \code{get_season_rankings} returns a data.frame of
#'   \link[=ranking]{rankings}. For ongoing season result is the most up to
#'   date official rankings. For ended seasons result is rankings at the end
#'   of the season.
#'
#' @seealso \link{get_data_by_id} for querying data by ID.
#'
#' \link{get_data_all} for querying all data for unit type.
#'
#' @examples \dontrun{
#' # Get events that were played in season 2015-2016.
#' get_season_events(season_id = 2015)
#'
#' # Get matches that were played in event with id 398.
#' get_event_players(event_id = 398)
#' }
#' @name get_data_multiple
NULL

#' @rdname get_data_multiple
#' @export
get_season_events <- function(season_id = integer(0)) {
  if (length(season_id) == 0) {
    return(event_template)
  }

  query_snookerorg(
    get_api_arg(id = 5),
    get_season_arg(id = season_id)
  ) %>%
    format_event()
}

#' @rdname get_data_multiple
#' @export
get_event_matches <- function(event_id = integer(0)) {
  if (length(event_id) == 0) {
    return(match_template)
  }

  query_snookerorg(
    get_api_arg(id = 6),
    get_event_arg(id = event_id)
  ) %>%
    format_match()
}

#' @rdname get_data_multiple
#' @export
get_ongoing_matches <- function() {
  query_snookerorg(
    get_api_arg(id = 7)
  ) %>%
    format_match()
}

#' @rdname get_data_multiple
#' @export
get_season_player_matches <- function(season_id = integer(0),
                                      player_id = integer(0)) {
  if ((length(season_id) == 0) || (length(player_id) == 0)) {
    return(match_template)
  }

  query_snookerorg(
    get_api_arg(id = 8),
    get_player_arg(id = player_id),
    get_season_arg(id = season_id)
  ) %>%
    format_match()
}

#' @rdname get_data_multiple
#' @export
get_event_players <- function(event_id = integer(0)) {
  if (length(event_id) == 0) {
    return(player_template)
  }

  query_snookerorg(
    get_api_arg(id = 9),
    get_event_arg(id = event_id)
  ) %>%
    format_player() %>%
    add_player_status(status = NA_character_)
}

#' @rdname get_data_multiple
#' @export
get_season_pro_players <- function(season_id = integer(0)) {
  if (length(season_id) == 0) {
    return(player_template)
  }

  query_snookerorg(
    get_api_arg(id = 10),
    get_status_arg(id = "p"),
    get_season_arg(id = season_id)
  ) %>%
    format_player() %>%
    add_player_status(status = "pro")
}

#' @rdname get_data_multiple
#' @export
get_season_ama_players <- function(season_id = integer(0)) {
  if (length(season_id) == 0) {
    return(player_template)
  }

  query_snookerorg(
    get_api_arg(id = 10),
    get_status_arg(id = "a"),
    get_season_arg(id = season_id)
  ) %>%
    format_player() %>%
    add_player_status(status = "ama")
}

#' @rdname get_data_multiple
#' @export
get_season_rankings <- function(season_id = integer(0)) {
  if (length(season_id) == 0) {
    return(ranking_template)
  }

  query_snookerorg(
    get_ranking_arg(id = "MoneyRankings"),
    get_season_arg(id = season_id)
  ) %>%
    format_ranking()
}
