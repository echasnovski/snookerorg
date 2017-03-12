#' Simplify results of get_* functions
#'
#' @param event_data data.frame of type \link{event}
#' @param match_data data.frame of type \link{match}
#' @param player_data data.frame of type \link{player}
#'
#' @return Simplified versions of specific data.frames with selecting
#'   the mostly used columns.
#' @examples \dontrun{
#' simplify_event(get_event(event_id = 398))
#' }
#'
#' @name simplify
NULL

#' @rdname simplify
#' @export
simplify_event <- function(event_data) {
  event_data %>%
    select_(
      "id", "name", "startDate", "endDate", "sponsor", "season",
      "type", "venue", "city", "country", "discipline", "sex", "ageGroup"
    ) %>%
    return()
}

#' @rdname simplify
#' @export
simplify_match <- function(match_data) {
  match_data %>%
    select_(
      "id", "eventId", "round", "number", "player1Id", "score1", "walkover1",
      "player2Id", "score2", "walkover2", "winnerId",
      "startDate", "endDate", "scheduledDate", "frameScores"
    ) %>%
    return()
}

#' @rdname simplify
#' @export
simplify_player <- function(player_data) {
  player_data %>%
    select_(
      "id", "firstName", "middleName", "lastName", "nationality",
      "sex", "born", "status"
    )
}
