# Run this to prepare all necessary data
# This is only necessary to refresh data/ files.

source("data-raw/catmunemex.R")
source("data-raw/catmunwp.R")

# should always go after individual DB preparation
source("data-raw/catmunalias.R")
