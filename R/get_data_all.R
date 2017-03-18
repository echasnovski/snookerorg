#' Get all data for unit type
#'
#' These functions return all available data for a specific unit.
#'
#' @param player_id Player id in character, integer or numeric form
#' @param sleep_sec Number of seconds to wait before the next query
#' @param progress Boolean indicator of whether to show function progress
#'
#' @details Service api.snooker.org doesn't have an option of querying all
#'   matches with one request. \code{get_all_matches} performs sequential queries
#'   over all events for their matches and combines them afterwards.
#'   \code{sleep_sec} is introduced in order to not overload API servers.
#'   It can be not less than 1 second. If \code{progress == TRUE} text progress
#'   will be displayed in the console.
#'
#'   \strong{Note}: \code{get_all_matches} takes a lot of time to run.
#'
#' @return \code{get_all_events} returns data.frame of \link[=event]{events}
#'   for all seasons.
#'
#'   \code{get_all_matches} returns data.frame of \link[=match]{matches}
#'   for all seasons.
#'
#'   \code{get_all_players} returns data.frame of \link[=player]{players}
#'   for all seasons. Column \code{status} is correctly filled with
#'   \code{pro} and \code{ama}.
#'
#'   \code{get_all_player_matches} returns data.frame of \link[=match]{matches}
#'   for all seasons for a specific player.
#'
#'   \code{get_all_pro_players} returns data.frame of professional
#'   \link[=player]{players} for all seasons. Column \code{status} is filled
#'   with \code{pro}.
#'
#'   \code{get_all_ama_players} returns data.frame of amateur
#'   \link[=player]{players} for all seasons. Column \code{status} is filled
#'   with \code{ama}.
#'
#' @seealso \link{get_data_single} for querying data for single unit.
#'
#' \link{get_data_multiple} for querying multiple data for one unit.
#'
#' @examples \dontrun{
#' # Get events for all seasons
#' get_all_events()
#' }
#' @name get_data_all
NULL

#' @rdname get_data_all
#' @export
get_all_events <- function() {
  query_snookerorg(
    get_api_arg(id = 5),
    get_season_arg(id = -1)
  ) %>%
    format_event()
}

#' @rdname get_data_all
#' @export
get_all_matches <- function(sleep_sec = 5, progress = TRUE) {
  cat("Querying all events\n")
  events <- get_all_events()

  cat("There are total", nrow(events), "events\n")
  cat("Querying for matches of events")

  if (progress) {
    pb <- txtProgressBar(
      min = 0, max = nrow(events),
      initial = 0, char = "=",
      style = 3
    )
  }

  event_match_list <- lapply(1:nrow(events), function(i) {
    Sys.sleep(max(1, sleep_sec))
    if (progress) {
      setTxtProgressBar(pb, i)
    }

    get_event_matches(event_id = events$id[i])
  })

  dplyr::bind_rows(event_match_list)
}

#' @rdname get_data_all
#' @export
get_all_players <- function() {
  cat("Querying all professional players\n")
  pro <- get_all_pro_players()
  Sys.sleep(5)
  cat("Querying all amateur players\n")
  ama <- get_all_ama_players()

  dplyr::bind_rows(pro, ama)
}

#' @rdname get_data_all
#' @export
get_all_player_matches <- function(player_id) {
  query_snookerorg(
    get_api_arg(id = 8),
    get_player_arg(id = player_id),
    get_season_arg(id = -1)
  ) %>%
    format_match()
}

#' @rdname get_data_all
#' @export
get_all_pro_players <- function() {
  query_snookerorg(
    get_api_arg(id = 10),
    get_status_arg(id = "p"),
    get_season_arg(id = -1)
  ) %>%
    format_player() %>%
    add_player_status(status = "pro")
}

#' @rdname get_data_all
#' @export
get_all_ama_players <- function() {
  query_snookerorg(
    get_api_arg(id = 10),
    get_status_arg(id = "a"),
    get_season_arg(id = -1)
  ) %>%
    format_player() %>%
    add_player_status(status = "ama")
}
