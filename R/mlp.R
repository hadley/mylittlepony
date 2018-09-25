#' This episode will feature the adventures of...
#'
#' @description
#'
#' It chooses two or more randomly selected records.  The assumption is
#' that each record represents a single friend in the group.
#'
#' @param .data A table
#' @param friends Number of rows to randomly select. Defaults to 2.
#'
#' @examples
#' library(mylittlepony)
#' hang_out(my_little_pony)
#'
#' @export
hang_out <- function(.data, friends = 2){
  samp <- sample(
    1:nrow(.data),
    size = friends
  )
  .data[samp, ]
}

#' Witness the Magic of Friendship!!
#'
#' @description
#'
#' A function that compares two or more friends and let them know
#' that things they have in common, and that things they can learn
#' from each other
#'
#' @param .data A table with two or more records to compare
#' @param name The variable that contains the proper name. Defaults to "name".
#'
#' @examples
#' library(mylittlepony)
#' magic_of_friendship(my_little_pony[1:2, ])
#'
#' @importFrom purrr map_lgl
#' @export
#'
magic_of_friendship <- function(.data, name = "name"){
  ic <- map_lgl(
    .data,
    ~length(unique(.x)) == 1
  )
  incommon <- .data[, ic]
  can_learn <- .data[, !ic]

  list(
    friends = .data[, name],
    things_in_common = incommon,
    learn_from_each_other = can_learn
  )
}
