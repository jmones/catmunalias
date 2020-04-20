library(here)

test_that("check that all municipalities in EMEX database have an alias", {
  catmunemex <- readRDS(here("data-raw", "catmunemex.Rds"))
  result <- left_join(
                catmunemex %>% rename(orig = mun),
                catmunalias,
                by = c("orig" = "alias"))

  expect_equal(length(unique(result$orig)), nrow(catmunemex))
  expect_equal(length(unique(result$mun)), nrow(catmunemex))
})
