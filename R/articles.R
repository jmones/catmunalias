
#' Catalan articles capitalised (including apostrophed)
articles_capitalised <- c("El", "Els", "En", "Es", "L'", "La",
                          "Les", "Na", "S'", "Sa", "Ses")

#' Catalan articles in lowercase
articles_lowercase <- tolower(articles_capitalised)


#' Catalan articles capitalised as suffix, separated by comma
suffix_capitalised <- paste(",", articles_capitalised)

#' Catalan articles in lowercase, separated by comma
suffix_lowercase <- tolower(suffix_capitalised)


#' Catalan articles capitalised (includes space if not apostrophed)
prefix_capitalised <- paste0(articles_capitalised,
                            if_else(
                              articles_capitalised %>% endsWith("'"),
                              "",
                              " "))

#' Catalan articles lowercase (includes space if not apostrophed)
prefix_lowercase <- paste0(articles_lowercase,
                           if_else(
                             articles_lowercase %>% endsWith("'"),
                             "",
                             " "))
