

articles_capitalised <- c("El", "Els", "En", "Es", "L'", "La", "Les", "Na", "S'", "Sa", "Ses")
articles_lowercase <- tolower(articles_capitalised)
suffix_capitalised <- paste(",", articles_capitalised)
suffix_lowercase <- tolower(suffix_capitalised)
prefix_capitalised <- paste0(articles_capitalised, if_else(articles_capitalised %>% endsWith("'"), "", " "))
prefix_lowercase <- paste0(articles_lowercase, if_else(articles_lowercase %>% endsWith("'"), "", " "))

