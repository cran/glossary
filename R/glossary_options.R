#' Set/get global glossary options
#'
#' Global glossary options are used, for example, to set the default path for the glossary file.
#'
#' @param ... One of three: (1) nothing, then returns all options as a list; (2) a name of an option element, then returns its value; (3) a name-value pair which sets the corresponding option to the new value (and returns nothing)
#'
#' @return a list of options, values of an option, or nothing
#' @export
#' @keywords internal
#'

glossary_options <- function (...) {
  # code from afex::afex_options
  dots <- list(...)
  if (length(dots) == 0) {
    # get all glossary options
    op <- options()
    glossary_op <- op[grepl("^glossary.", names(op))]
    names(glossary_op) <- sub("^glossary.", "", names(glossary_op))
    return(glossary_op)
  } else if (!is.null(names(dots))) {
    # dots have names, so set glossary options
    newop <- dots
    names(newop) <- paste0("glossary.", names(newop))
    options(newop)
  } else if (is.null(names(dots))) {
    # dots don't have names, so get glossary options
    opnames <- paste0("glossary.", unlist(dots))
    getop <- lapply(opnames, getOption)
    if (length(opnames) == 1) {
      getop <- getop[[1]]
    } else {
      names(getop) <- unlist(dots)
    }
    return(getop)
  } else {
    warning("Unsupported command to glossary_options(), nothing done.",
            call. = FALSE)
  }
}

#' Reset glossary table
#'
#' Resets the list that collects glossary entries for the table.
#'
#' @return NULL; Called for side effects
#' @export
#'
#' @examples
#' glossary_reset()
glossary_reset <- function() {
  glossary_options(table = list())
}


#' Set or get the default glossary path
#'
#' @param path the path to the glossary file, or NULL for local definitions
#' @param create create a new glossary file if it doesn't exist
#'
#' @return path string if path is NULL
#' @export
#'
#' @examples
#' path <- glossary_path() # get current path
#'
#' # create (if doesn't exist) and set path
#' newpath <- tempfile("glossary", fileext = ".yml")
#' glossary_path(newpath, create = TRUE)
#'
#' # set path (assumes file exists)
#' glossary_path(path)
glossary_path <- function(path, create = FALSE) {
  # get path
  if (missing(path)) {
    return(glossary_options("path"))
  }

  # create file if necessary
  if (create &&
      !is.null(path) &&
      path != "psyteachr" &&
      !file.exists(path)) {

    # create directory if doesn't exist
    dir <- dirname(path)
    if (!dir.exists(dir)) {
      dir.create(dir, FALSE, TRUE)
    }

    write("term: |\n  definition\n", path)
    message(path, " did not exist; it has been created")
  }

  if (!is.null(path) &&
      path != "psyteachr" &&
      !file.exists(path)) {
    stop("The file ", path, " does not exist")
  }

  # set path
  glossary_options(path = path)
}


#' Set or get the default popup type
#'
#' @param popup If NULL, get the current default popup type, or set to one of "click", "hover", or "none"
#'
#' @return string if popup is NULL
#' @export
#'
#' @examples
#' # get current popup style
#' popstyle <- glossary_popup()
#'
#' # change popup to click style
#' glossary_popup("click")
#'
#' # change back to original popup style
#' glossary_popup(popstyle)
glossary_popup <- function(popup) {
  # get popup
  if (missing(popup)) {
    return(glossary_options("popup"))
  }

  # set popup
  popup <- match.arg(popup, c("click", "hover", "none"))
  glossary_options(popup = popup)
}
