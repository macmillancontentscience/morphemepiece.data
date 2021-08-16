#' Load a Morphemepiece Vocabulary
#'
#' A morphemepiece vocabularly is a named integer vector with class
#' "morphemepiece_vocabulary". The names of the vector are the morphemes, and
#' the values are the integer identifiers of those tokens. The vocabularly is
#' 0-indexed for compatability with Python implementations.
#'
#' @return A morphemepiece_vocabulary.
#' @export
#'
#' @examples
#' head(morphemepiece_vocab())
morphemepiece_vocab <- function() {
  return(
    .load_inst_rds("vocab", 30000L)
  )
}

#' Load a Morphemepiece Lookup
#'
#' A morphemepiece lookup is a named character vector. The names of the vector
#' are the words, and the values are the space-separated morpheme breakdowns of
#' those words.
#'
#' @return A named character vector.
#' @export
#'
#' @examples
#' head(morphemepiece_lookup())
morphemepiece_lookup <- function() {
  return(
    .load_inst_rds("lookup", 30000L)
  )
}

.load_inst_rds <- function(filetype, n_tokens) {
  return(readRDS(.get_path(filetype, n_tokens)))
}

.get_path <- function(filetype, n_tokens) {
  return(
    system.file(
      "rds",
      paste0(
        paste(
          "morphemepiece",
          filetype,
          n_tokens,
          sep = "_"
        ),
        ".rds"
      ),
      package = "morphemepiece.data"
    )
  )
}
