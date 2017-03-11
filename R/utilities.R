#' Query api.snooker.org
#'
#' @param ... Parameters for query in character form.
#'
#' @return Raw query result from api.snooker.org.
#' @keywords internal
#'
#' @examples
#' # Returns NULL
#' query_snookerorg()
#'
#' \dontrun{
#' # Returns query for event with id 398.
#' query_snookerorg("e=398")
#' }
#' @export
query_snookerorg <- function(...) {
  args <- paste0(unlist(list(...)), collapse = "&")
  if (args == "") {
    return(NULL)
  } else {
    return(jsonlite::fromJSON(paste0("http://api.snooker.org/?", args)))
  }
}


# Functions for construction API arguments --------------------------------
get_arg_function <- function(api_char) {
  res <- function(id) {
    return(paste0(api_char, "=", id))
  }
  return(res)
}

get_api_arg <- get_arg_function("t")

get_event_arg <- get_arg_function("e")

get_round_arg <- get_arg_function("r")

get_match_num_arg <- get_arg_function("n")

get_player_arg <- get_arg_function("p")

get_season_arg <- get_arg_function("s")

get_status_arg <- get_arg_function("st")

get_ranking_arg <- get_arg_function("rt")


# Functions for formatting query results ----------------------------------
make_camel_case <- function(char_vec) {
  char_vec_list <- strsplit(x = char_vec, split = "[^[:alnum:]]+")
  res <- vapply(
    X = char_vec_list,
    FUN = function(cur_name) {
      cur_name_res <- sapply(cur_name, function(cur_char) {
        substr(cur_char, 1, 1) <- toupper(substr(cur_char, 1, 1))
        return(cur_char)
      })
      substr(cur_name_res[1], 1, 1) <-
        tolower(substr(cur_name_res[1], 1, 1))
      return(paste0(cur_name_res, collapse = ""))
    },
    FUN.VALUE = "character"
  )
  return(res)
}

make_column_names <- function(data) {
  res <- data
  colnames(res) <- make_camel_case(colnames(res))
  return(res)
}

convert_date <- function(date_vec) {
  return(as.POSIXct(date_vec,
                    format = "%Y-%m-%dT%H:%M:%SZ",
                    tz = "UTC"))
}

replace_empty_str <- function(char_vec, replacement = "Unknown") {
  return(if_else(char_vec == "", replacement, char_vec))
}
