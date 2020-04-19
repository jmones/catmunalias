

getReferencesNotMapped <- function(x, xp, yp) {
  yfound <- yp[which(xp %in% x)]
  ypp <- setdiff(yp, yfound)
  return(ypp)
}

getAliasesWithNoMapping <- function(x, xp) {
  return(setdiff(x, xp))
}

checkInjectiveMapping <- function(x, xp, yp) {
  xpp <- getAliasesWithNoMapping(x, xp)
  ypp <- getReferencesNotMapped(x, xp, yp)
  if(length(xpp) > 0) {
    stop("Some aliases have no mapping.",
         "\n\nAliases not mapped (getAliasesWithNoMapping):\n",
         paste0("\"", xpp, "\"", collapse=", "),
         "\n\nReferences pending mapping (getReferencesNotMapped):\n",
         paste0("\"", ypp, "\"", collapse=", "))
  }
}
