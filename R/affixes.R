library(tidyverse)

#' Returns with element from 'from' matches 'words' using 'compare_function'
#' Returns Inf if none
#'
#' @param words words that will be compared
#' @param from elements to compare to
#' @param compare_function Function to use in comparison
#' @return A vector indexes of the same length of words, with positions in from.
#'   NA if none matched for that word.
match_first <- function(words, from, compare_function) {
  indices <- lst(words, from) %>%
    cross() %>%
    map(~ compare_function(.$words, .$from)) %>%
    as.logical() %>%
    matrix(nrow = length(words), ncol = length(from)) %>%
    apply(1, function(r) which.max(if_else(r == FALSE, NA, T))) %>%
    as.integer()

  return(indices)
}

#' Returns the list of words, replacing the suffix by the corresponding prefix,
#' if matching. If it doesn't match, it results the word as is.
#'
#' @param words words that will be transformed
#' @param suffixes list of suffixes to search for
#' @param prefixes corresponsing prefixes that will be prepended if a suffix
#'   matches
#' @return A list of the transformed words
from_suffix_to_prefix <- function(words, suffixes, prefixes) {
  indices <- match_first(words, suffixes, endsWith)
  result <- map2(
    words,
    indices,
    ~ if (is.na(.y)) {
      .x
    } else {
      paste0(prefixes[.y], substr(.x, 1, nchar(.x) - nchar(suffixes[.y])))
    }
  )
  return(result)
}

#' Returns the list of words, replacing the prefix by the corresponding suffix,
#' if matching. If it doesn't match, it results the word as is.
#'
#' @param words words that will be transformed
#' @param prefixes list of prefixes to search for
#' @param suffixes corresponsing suffixes that will be prepended if a prefix
#'   matches
#' @return A list of the transformed words
from_prefix_to_suffix <- function(words, prefixes, suffixes) {
  indices <- match_first(words, prefixes, startsWith)
  result <- map2(
    words,
    indices,
    ~ if (is.na(.y)) {
      .x
    } else {
      paste0(substr(.x, nchar(prefixes[.y]) + 1, nchar(.x)), suffixes[.y])
    }
  )
  return(result)
}
