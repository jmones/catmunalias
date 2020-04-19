## code to prepare `catmunwp` dataset goes here

library(drake)
library(dplyr)
library(janitor)
library(rvest)


url <- "https://ca.wikipedia.org/wiki/Llista_de_municipis_de_Catalunya"

prepare <- function(raw) {
  mun <- raw$Municipi %>%
    trimws() %>%
    sort()
  prepared <- tibble(mun = mun)
  return(prepared)
}

plan <- drake_plan(
  catmunwp_raw = read_html(url) %>% html_node("table.wikitable") %>% html_table(),
  catmunwp = prepare(catmunwp_raw),
  catmunwp_save_data_raw = saveRDS(catmunwp, file = file_out("data-raw/catmunwp.Rds"))
)

make(plan)
