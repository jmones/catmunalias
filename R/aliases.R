library(tidyverse)

#' Given the injection xp->yp and a set of origin values x,
#' considering that some elements of x (xfound) have a mapping to y (yfound),
#' then find all elements in yp for which a mapping was not found (ypp = yp - yfound).
#'
#' @param x origin set to find
#' @param xp origin set in reference data
#' @param yp target set in reference data
#' @return ypp set of elements in yp that were not found
get_unmapped_refs <- function(x, xp, yp) {
  yfound <- yp[which(xp %in% x)]
  ypp <- setdiff(yp, yfound)
  return(ypp)
}

#' Get all elements in x not found in xp
#'
#' @param x origin set to find
#' @param xp origin set in reference data
#' @return xnotfound = xp - x
get_unmapped_aliases <- function(x, xp) {
  return(setdiff(x, xp))
}

#' Given a mapping xp -> yp, check if all elements in x are present in x
#'
#' @param x origin set to find
#' @param xp origin set in reference data
#' @param yp target set in reference data
#' @return no value. Stops if failing.
check_injective_mapping <- function(x, xp, yp) {
  xpp <- getAliasesWithNoMapping(x, xp)
  ypp <- getReferencesNotMapped(x, xp, yp)
  if (length(xpp) > 0) {
    stop(
      "Some aliases have no mapping.",
      "\n\nAliases not mapped (getAliasesWithNoMapping):\n",
      paste0("\"", xpp, "\"", collapse = ", "),
      "\n\nReferences pending mapping (getReferencesNotMapped):\n",
      paste0("\"", ypp, "\"", collapse = ", ")
    )
  }
}
