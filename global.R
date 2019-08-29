library(shiny)
library(dplyr)
library(DT)
library(markdown)
library(shinyWidgets)

gap <- read.csv("data/gap.csv", header = TRUE)
source("www/gapvectors.R")
source("www/metadata_data.R")

for (i in 1:length(gap_ind)) {
  names(gap)[names(gap) == gap_ind[i]] <- gap_colnames[i]
}

map_latest <- function(a, b, yr = "None", value = NA) {
  for (i in 1:length(a)) {
    ifelse(is.na(b[i]), value, value <- b[i])
    if (!is.na(value)) {
      yr <- a[i]
      return(c(yr, value))
    }
  }
  return(c(yr, value))
}