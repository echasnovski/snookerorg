#' Description of \strong{match} data.frame
#'
#' \describe{
#'   \item{id}{<int>: identificator of match}
#'   \item{eventId}{<int>: identificator of match's event
#'   (column "id" in \strong{event} data.frame)}
#'   \item{round}{<int>: round number (unknown decoding)}
#'   \item{number}{<int>: number of match inside round}
#'   \item{player1Id}{<int>: identificator of player 1
#'   (column "id" in \strong{player} data.frame)}
#'   \item{score1}{<int>: number of won frames by player 1}
#'   \item{walkover1}{<lgl>: whether the win of player 1 was scored
#'   by the technical reasons}
#'   \item{player2Id}{<int>: identificator of player 2
#'   (column "id" in \strong{player} data.frame)}
#'   \item{score2}{<int>: number of won frames by player 2}
#'   \item{walkover2}{<lgl>: whether the win of player 2 was scored
#'   by the technical reasons}
#'   \item{winnerId}{<int>: identificator of match's winner
#'   (column "id" in \strong{player} data.frame)}
#'   \item{unfinished}{<lgl>: whether the match is unfinished}
#'   \item{onBreak}{<lgl>: whether the match is on break}
#'   \item{worldSnookerId}{<int>: identificator of the match in
#'   World Snooker database/website}
#'   \item{liveURL}{<chr>: URL for match's live scoring}
#'   \item{detailsURL}{<chr>: URL for match's details}
#'   \item{pointsDropped}{<lgl>: whether points for the match are missed
#'   (mainly because of walkovers) (not always correct)}
#'   \item{showCommonNote}{<lgl>: whether to show common note somewhere}
#'   \item{estimated}{<lgl>: ?}
#'   \item{type}{<int>: type of event (1, 2; 2 occures for
#'   10 World Cup events)}
#'   \item{tableNo}{<int>: ?}
#'   \item{videoURL}{<chr>: URL for video stream}
#'   \item{initDate}{<dttm>: date of database record creation}
#'   \item{modDate}{<dttm>: date of database record modification}
#'   \item{startDate}{<dttm>: start time of match}
#'   \item{endDate}{<dttm>: end time of match}
#'   \item{scheduledDate}{<dttm>: scheduled start time of match}
#'   \item{frameScores}{<chr>: per frame scores (in one string)}
#'   \item{sessions}{<chr>: information about sessions}
#'   \item{note}{<chr>: match note}
#'   \item{extendedNote}{<chr>: match extended note}
#' }
#'
#'
#' @name match
NULL
