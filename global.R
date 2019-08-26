library(shiny)
library(dplyr)
library(DT)
library(markdown)

gap <- read.csv("data/gap.csv", header = TRUE)
source("www/gapvectors.R")
source("www/metadata_data.R")

for (i in 1:length(gap_ind)) {
  names(gap)[names(gap) == gap_ind[i]] <- gap_colnames[i]
}
