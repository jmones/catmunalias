## code to prepare `catmunalias` dataset goes here

library(drake)
library(dplyr)
library(janitor)
library(rvest)

source("R/affixes.R")
source("R/articles.R")
load("data/catmunemex.rda")
load("data/catmunwp.rda")

createAliasFromEmex <- function(catmunemex) {
  mun <- fromSuffixToPrefix(catmunemex$mun, suffix_lowercase, prefix_capitalised)
  mun <- fromSuffixToPrefix(mun, suffix_capitalised, prefix_capitalised)
  alias_cp <- mun
  alias_ls <- fromPrefixToSuffix(mun, prefix_capitalised, suffix_lowercase)
  alias_cs <- fromPrefixToSuffix(mun, prefix_capitalised, suffix_capitalised)
  alias_lp <- fromSuffixToPrefix(alias_ls, suffix_lowercase, prefix_lowercase)

  catmunalias <- tibble(alias=c(alias_cp, alias_cs, alias_lp, alias_ls),
                        mun=c(mun, mun, mun, mun)) %>%
                 distinct() %>%
                 arrange(alias)
    return(catmunalias)
}

appendAliasesFromWikipedia <- function(catmunaliasfromemex) {
  catmunaliasfromemexandwp <- catmunaliasfromemex %>%
    add_row(alias="Campmany", mun="Capmany") %>%
    add_row(alias="Campmany", mun="Capmany") %>%
    add_row(alias="Navars", mun="Navàs")
}

plan <- drake_plan(
  catmunaliasfromemex = createAliasFromEmex(catmunemex),
  catmunalias = catmunaliasfromemex,
  catmunaliasfromemex_save_data = usethis::use_data(catmunalias, overwrite = TRUE)

#  catmunwp_raw = read_html(url) %>% html_node("table.wikitable") %>% html_table(),
#  catmunalias = prepare(catmunalias_raw),
#  catmunalias_save_data = usethis::use_data(catmunalias, overwrite = TRUE)
)

make(plan)
loadd(catmunalias)
