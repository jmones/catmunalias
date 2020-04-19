library(tidyverse)

#' Returns with element from 'from' matches 'words' using 'compare_function'
#' Returns Inf if none
#'
#' @param words words that will be compared
#' @param from elements to compare to
#' @param compare_function Function to use in comparison
#' @return A vector indexes of the same length of words, with positions in from. NA if none matched for that word.
matchFirst <- function(words, from, compare_function) {
  indices <- lst(words, from) %>%
    cross() %>%
    map(~ compare_function(.$words, .$from)) %>%
    as.logical() %>%
    matrix(nrow = length(words), ncol = length(from)) %>%
    apply(1, function(r) which.max(if_else(r == FALSE, NA, T))) %>%
    as.integer()

  return(indices)
}

fromSuffixToPrefix <- function(words, suffixes, prefixes) {
  indices <- matchFirst(words, suffixes, endsWith)
  result <- map2(
    words,
    indices,
    ~ if (is.na(.y)) {
      .x
    } else {
      paste0(prefixes[.y], substr(.x, 1, nchar(.x) - nchar(suffixes[.y])))
    }
  )
  return(simplify(result))
}

fromPrefixToSuffix <- function(words, prefixes, suffixes) {
  indices <- matchFirst(words, prefixes, startsWith)
  result <- map2(
    words,
    indices,
    ~ if (is.na(.y)) {
      .x
    } else {
      paste0(substr(.x, nchar(prefixes[.y]) + 1, nchar(.x)), suffixes[.y])
    }
  )
  return(simplify(result))
}
