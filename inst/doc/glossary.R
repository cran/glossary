## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(glossary)

## -----------------------------------------------------------------------------
glossary_path("glossary.yml")

## ---- eval = FALSE------------------------------------------------------------
#  glossary_add(term = "power",
#               def = "The probability of rejecting the null hypothesis when it is false, for a specific analysis, effect size, sample size, and criteria for significance."
#  ")

## -----------------------------------------------------------------------------
glossary_path("psyteachr")
glossary_popup("hover")

## ---- echo = FALSE------------------------------------------------------------
# reset for rest of page
glossary_path("glossary.yml")

## -----------------------------------------------------------------------------
glossary_popup("none")

## -----------------------------------------------------------------------------
glossary_popup("hover")

## -----------------------------------------------------------------------------
glossary_popup("click")

## ---- results='asis'----------------------------------------------------------
glossary_style(color = "purple", 
               text_decoration = "underline",
               def_bg = "#333",
               def_color = "white")

## ---- eval = FALSE------------------------------------------------------------
#  # append default styles to an external CSS file
#  write(glossary_style(), "glossary.css", append = TRUE)

## ---- echo = FALSE------------------------------------------------------------
glossary_table()

