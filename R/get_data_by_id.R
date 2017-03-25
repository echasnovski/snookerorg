#' Get data for a unit by ID
#'
#' These functions return data about events, matches or players by
#' the vector(s) of respective identifiers.
#'
#' @param event_id Vector of event ids in character, integer or numeric form
#' @param round_id Vector of round ids in character, integer or numeric form
#' @param match_num Vector of match numbers in character, integer or
#'   numeric form
#' @param player_id Vector of player ids in character, integer or numeric form
#' @param sleep_sec Number of seconds to wait before the next query
#' @param progress Boolean indicator of whether to show function progress
#'
#' @details Identifier for \strong{event} is \code{event_id}.
#'
#'   Identifier for \strong{match} is combination of \code{event_id},
#'   \code{round_id} and \code{match_num}. When using \code{get_matches} these
#'   vectors are recycled by standard R rules.
#'
#'   Identifier for \strong{player} is \code{player_id}.
#'
#'   \code{sleep_sec} is introduced in order to not overload API servers.
#'   It can be not less than 1 second. If \code{progress == TRUE} text progress
#'   will be displayed in the console.
#'
#' @return \code{get_events} returns a data.frame with columns
#'   described in \link{event}.
#'
#'   \code{get_matches} returns a data.frame with columns
#'   described in \link{match}.
#'
#'   \code{get_players} returns a data.frame with columns
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
#' # Get data about events with IDs 1 and 2
#' get_events(event_id = 1:2)
#'
#' # Get data about match in event 398, round 4 and match number 1
#' get_matches(event_id = 398, round_id = 4, match_num = 1)
#'
#' # Get data about players with IDs from 1 to 10
#' get_players(player_id = 1:10)
#'}
#' @name get_data_by_id
NULL

#' @rdname get_data_by_id
#' @export
get_events <- function(event_id = integer(0),
                       sleep_sec = 1, progress = TRUE) {
  if (length(event_id) == 0) {
    return(event_template)
  }

  if (progress) {
    pb <- initialize_pb(max = length(event_id))
  }

  res_event <- lapply(1:length(event_id), function(i) {
    Sys.sleep(max(1, sleep_sec))
    if (progress) {
      setTxtProgressBar(pb, i)
    }

    query_snookerorg(get_event_arg(id = as.integer(event_id[i])))
  })
  res_event <- res_event[!sapply(res_event, is_bad_query)]

  if (length(res_event) == 0) {
    event_template
  } else {
    res_event %>%
      dplyr::bind_rows() %>%
      format_event()
  }
}

#' @rdname get_data_by_id
#' @export
get_matches <- function(event_id = integer(0),
                        round_id = integer(0),
                        match_num = integer(0),
                        sleep_sec = 1, progress = TRUE) {
  args <- expand_args(
    as.integer(event_id),
    as.integer(round_id),
    as.integer(match_num)
  )
  if ((nrow(args) == 0) ||
      (sum(complete.cases(args)) == 0)) {
    return(match_template)
  }

  if (progress) {
    pb <- initialize_pb(max = nrow(args))
  }

  res_match <- lapply(1:nrow(args), function(i) {
    Sys.sleep(max(1, sleep_sec))
    if (progress) {
      setTxtProgressBar(pb, i)
    }

    query_snookerorg(
      get_event_arg(id = args[i, 1]),
      get_round_arg(id = args[i, 2]),
      get_match_num_arg(id = args[i, 3])
    )
  })
  res_match <- res_match[!sapply(res_match, is_bad_query)]

  if (length(res_match) == 0) {
    match_template
  } else {
    res_match %>%
      dplyr::bind_rows() %>%
      format_match()
  }
}

#' @rdname get_data_by_id
#' @export
get_players <- function(player_id = integer(0),
                        sleep_sec = 1, progress = TRUE) {
  if (length(player_id) == 0) {
    return(player_template)
  }

  if (progress) {
    pb <- initialize_pb(max = length(player_id))
  }

  res_player <- lapply(1:length(player_id), function(i) {
    Sys.sleep(max(1, sleep_sec))
    if (progress) {
      setTxtProgressBar(pb, i)
    }

    query_snookerorg(get_player_arg(id = as.integer(player_id[i])))
  })
  res_player <- res_player[!sapply(res_player, is_bad_query)]

  if (length(res_player) == 0) {
    player_template
  } else {
    res_player %>%
      dplyr::bind_rows() %>%
      format_player() %>%
      add_player_status(status = NA_character_)
  }
}
