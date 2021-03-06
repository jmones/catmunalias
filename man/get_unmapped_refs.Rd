% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/aliases.R
\name{get_unmapped_refs}
\alias{get_unmapped_refs}
\title{Given the injection xp->yp and a set of origin values x,
considering that some elements of x (xfound) have a mapping to y (yfound),
then find all elements in yp for which a mapping was not found (ypp = yp - yfound).}
\usage{
get_unmapped_refs(x, xp, yp)
}
\arguments{
\item{x}{origin set to find}

\item{xp}{origin set in reference data}

\item{yp}{target set in reference data}
}
\value{
ypp set of elements in yp that were not found
}
\description{
Given the injection xp->yp and a set of origin values x,
considering that some elements of x (xfound) have a mapping to y (yfound),
then find all elements in yp for which a mapping was not found (ypp = yp - yfound).
}
