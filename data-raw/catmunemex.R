## code to prepare `catmunemex` dataset goes here

library(httr)
library(xml2)

url <- "https://api.idescat.cat/emex/v1/nodes.xml?lang=en"

parse <- function(xml_text) {
  xml <- read_xml(xml_text)
  mun <- xml_text(xml_find_all(xml, "//v[@scheme='mun']/text()")) %>% sort()
  catmunemex <- tibble(mun = mun)

  return(catmunemex)
}

plan <- drake_plan(
  catmunemex_xml_text = content(RETRY("GET", url), "text"),
  catmunemex = parse(catmunemex_xml_text),
  catmunemex_save_data = usethis::use_data(catmunemex, overwrite = TRUE)
)

make(plan)
