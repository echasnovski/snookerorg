#' Description of \strong{ranking} data.frame
#'
#' \describe{
#'   \item{id}{<int>: identifier of ranking}
#'   \item{position}{<int>: position inside the ranking list}
#'   \item{playerId}{<int>: identifier of player at the specific position
#'   (column "id" in \strong{player} data.frame)}
#'   \item{season}{<int>: season of the ranking}
#'   \item{sum}{<int>: number of ranking points}
#'   \item{type}{<chr>: type of the ranking (currently only "MoneyRankings"
#'   are supported)}
#' }
#'
#' @seealso \link{get_season_rankings} for querying rankings
#' at specific season.
#'
#' @name ranking
NULL
