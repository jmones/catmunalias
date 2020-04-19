library(tidyverse)

test_that("matchFirst() detects the first match in from or returns Inf", {
  words <- c("1aa", "1bb", "1ca", "1dd")
  from <- c("aa", "a", "b")
  expected <- c(1, 3, 2, NA)

  result <- matchFirst(words, from, endsWith)

  expect_equal(result, expected)
})

test_that("fromSuffixToPrefix() changes from suffix to prefix when matching or leaves untouched if not", {
  words <- c("1aa", "1bb", "1ca", "untouched")
  suffix <- c("aa", "a", "b")
  prefix <- c("AA", "A", "B")
  expected <- c("AA1", "B1b", "A1c", "untouched")

  result <- fromSuffixToPrefix(words, suffix, prefix)

  expect_equal(result, expected)
})

test_that("fromPrefixToSuffix() changes from prefix to suffix when matching or leaves untouched if not", {
  words <- c("AA1", "B1b", "A1c", "untouched")
  prefix <- c("AA", "A", "B")
  suffix <- c("aa", "a", "b")
  expected <- c("1aa", "1bb", "1ca", "untouched")

  result <- fromPrefixToSuffix(words, prefix, suffix)

  expect_equal(result, expected)
})
