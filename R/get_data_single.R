#' Get data for a single unit
#'
#' These functions return data about event, match or player by
#' the respective identifiers.
#'
#' @param event_id Event id in character, integer or numeric form
#' @param round_id Round id in character, integer or numeric form
#' @param match_num Match number in character, integer or numeric form
#' @param player_id Player id in character, integer or numeric form
#'
#' @details Identifier for \strong{event} is \code{event_id}.
#'
#'   Identifier for \strong{match} is combination of \code{event_id},
#'   \code{round_id} and \code{match_num}.
#'
#'   Identifier for \strong{player} is \code{player_id}.
#'
#' @return \code{get_event} returns a data.frame with 1 row and columns
#'   described in \link{event}.
#'
#'   \code{get_match} returns a data.frame with 1 row and columns
#'   described in \link{match}.
#'
#'   \code{get_player} returns a data.frame with 1 row and columns
#'   described in \link{player}. Column \code{status} is filled with
#'   \code{NA} because there is no information from performed query.
#'   Information about player status can be obtained from calls to
#'   \link[=get_data_multiple]{get_season_pro_players},
#'   \link[=get_data_multiple]{get_season_ama_players},
#'   \link[=get_data_all]{get_all_players},
#'   \link[=get_data_all]{get_all_pro_players},
#'   \link[=get_data_all]{get_all_ama_players}.
#'
#' @seealso \link{get_data_multiple} for querying multiple data for one unit.
#'
#' \link{get_data_all} for querying all data for unit type.
#'
#' @examples \dontrun{
#' # Get data about event 398
#' get_event(event_id = 1)
#'
#' # Get data about match in event 398, round 4 and match number 1
#' get_match(event_id = 398, round_id = 4, match_num = 1)
#'
#' # Get data about player 1
#' get_player(player_id = 1)
#'}
#' @name get_data_single
NULL

#' @rdname get_data_single
#' @export
get_event <- function(event_id) {
  query_snookerorg(get_event_arg(id = as.integer(event_id))) %>%
    format_event() %>%
    return()
}

#' @rdname get_data_single
#' @export
get_match <- function(event_id, round_id, match_num) {
  query_snookerorg(
    get_event_arg(id = as.integer(event_id)),
    get_round_arg(id = as.integer(round_id)),
    get_match_num_arg(id = as.integer(match_num))
  ) %>%
    format_match() %>%
    return()
}

#' @rdname get_data_single
#' @export
get_player <- function(player_id) {
  query_snookerorg(get_player_arg(id = as.integer(player_id))) %>%
    format_player() %>%
    add_player_status(status = NA_character_) %>%
    return()
}
