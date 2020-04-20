library(tidyverse)

test_that("match_first() detects the first match in from or returns Inf", {
  words <- c("1aa", "1bb", "1ca", "1dd")
  from <- c("aa", "a", "b")
  expected <- c(1, 3, 2, NA)

  result <- match_first(words, from, endsWith)

  expect_equal(result, expected)
})

test_that("from_suffix_to_prefix() transforms if matches or leaves as it is", {
  words <- c("1aa", "1bb", "1ca", "untouched")
  suffix <- c("aa", "a", "b")
  prefix <- c("AA", "A", "B")
  expected <- list("AA1", "B1b", "A1c", "untouched")

  result <- from_suffix_to_prefix(words, suffix, prefix)

  expect_equal(result, expected)
})

test_that("from_prefix_to_suffix() transforms if matches or leaves as it is", {
  words <- c("AA1", "B1b", "A1c", "untouched")
  prefix <- c("AA", "A", "B")
  suffix <- c("aa", "a", "b")
  expected <- list("1aa", "1bb", "1ca", "untouched")

  result <- from_prefix_to_suffix(words, prefix, suffix)

  expect_equal(result, expected)
})
