% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/glossary.R
\name{glossary}
\alias{glossary}
\title{Display glossary entry}
\usage{
glossary(
  term,
  display = term,
  def = NULL,
  add_to_table = TRUE,
  show = c("term", "def"),
  popup = glossary_popup(),
  path = glossary_path()
)
}
\arguments{
\item{term}{The glossary term to link to, can contain spaces}

\item{display}{The text to display (if different than the term)}

\item{def}{The short definition to display on hover and in the glossary table; if NULL, this will be looked up from the file in the \code{path} argument}

\item{add_to_table}{whether to add to the table created by \code{\link{glossary_table}}}

\item{show}{whether to show the term or just the definition}

\item{popup}{whether to show the popup on "click" or "hover" (or "none"); set default with \code{\link{glossary_popup}}}

\item{path}{the path to the glossary file, or NULL for local definitions; set default with \code{\link{glossary_path}}}
}
\value{
character string
}
\description{
Display a glossary term with an optional popup of the definition, and add the term to the table created by \code{\link{glossary_table}}. This function is mainly meant to be used via inline R in R Markdown or quarto documents, e.g.:

\code{`r glossary("Alpha")`} does not always have to equal .05.
}
\details{
If the path is set to "psyteachr", the glossary term will link to the \href{https://psyteachr.github.io/glossary/}{PsyTeachR glossary}. Set \code{show = "def"} to just show the definition.
}
\examples{
# set glossary path to example file
path <- system.file("glossary.yml", package = "glossary")
glossary_path(path)

glossary("alpha")
glossary("alpha", "$\\\\alpha$")
glossary("alpha", def = "The first letter of the Greek alphabet")
glossary("alpha", show = "term")
glossary("alpha", show = "def")
}
