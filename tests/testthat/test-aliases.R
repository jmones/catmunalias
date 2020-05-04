library(tidyverse)

test_that("get_unmapped_refs() gets all references in target space unmapped", {
  x <- c("2", "3", "5")
  xp <- c("1", "2", "3", "4")
  yp <- c("a", "b", "c,", "d")
  expected <- c("a", "d")

  result <- get_unmapped_refs(x, xp, yp)

  expect_equal(result, expected)
})

test_that("get_unmapped_aliases() gets all aliases in source space unmapped", {
  x <- c("2", "3", "5")
  xp <- c("1", "2", "3", "4")
  expected <- c("5")

  result <- get_unmapped_aliases(x, xp)

  expect_equal(result, expected)
})

test_that("check_injective_mapping() should succeed if mapping is bijection", {
  x <- c("2", "4")
  xp <- c("1", "2", "3", "4", "5")
  yp <- c("a", "b", "c,", "d", "d")

  expect_null(check_injective_mapping(x, xp, yp))

})

test_that("check_injective_mapping() should succeed if mapping is injective even if no bijection", {
  x <- c("2", "4", "5")
  xp <- c("1", "2", "3", "4", "5")
  yp <- c("a", "b", "c,", "d", "d")

  expect_null(check_injective_mapping(x, xp, yp))
})

test_that("check_injective_mapping() should fail if mapping is not injective (unmapped source)", {
  x <- c("2", "3", "5")
  xp <- c("1", "2", "3", "4")
  yp <- c("a", "b", "c,", "d")

  expect_error(check_injective_mapping(x, xp, yp))
})
