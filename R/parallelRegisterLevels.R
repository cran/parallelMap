#' @title Register a parallelization level
#'
#' @description
#' Package developers should call this function in their packages'
#' `base::.onLoad()`. This enables the user to query available levels and bind
#' parallelization to specific levels. This is especially helpful for nested
#' calls to [parallelMap()], e.g. where the inner call should be parallelized
#' instead of the outer one.
#'
#' To avoid name clashes, we encourage developers to always specify the argument
#' `package`. This will prefix the specified levels with the string containing
#' the package name, e.g. `parallelRegisterLevels(package="foo",
#' levels="dummy")` will register the level \dQuote{foo.dummy} and users can
#' start parallelization for this level with `parallelStart(<backend>, level =
#' "parallelMap.dummy")`. If you do not provide `package`, the level names will
#' be associated with category \dQuote{custom} and can there be later referred
#' to with \dQuote{custom.dummy}.
#'
#' @param package (`character(1)`)\cr
#'   Name of your package.
#'   Default is \dQuote{custom} (we are not in a package).
#' @param levels (`character(1)`)\cr
#'   Available levels that are used in the [parallelMap()] operations of your
#'   package or code. If `package` is not missing, all levels will be prefixed
#'   with \dQuote{package.}.
#' @return Nothing.
#' @export
parallelRegisterLevels = function(package = "custom", levels) {
  assertString(package)
  assertCharacter(levels, min.len = 1L, any.missing = FALSE)
  reg.levs = getPMOption("registered.levels", list())
  if (is.na(package)) {
    reg.levs[["custom"]] = union(reg.levs[["custom"]], levels)
  } else {
    reg.levs[[package]] = union(reg.levs[[package]], sprintf("%s.%s", package, levels))
  }
  options(parallelMap.registered.levels = reg.levs)
  invisible(NULL)
}

#' @title Get registered parallelization levels for all currently loaded packages.
#'
#' @description
#' With `flatten = FALSE`, a structured S3 object is returned. The S3 object
#' only has one slot, which is called `levels`. This contains a named list. Each
#' name refers to `package` from the call to [parallelRegisterLevels()], while
#' the entries are character vectors of the form \dQuote{package.level}. With
#' `flatten = TRUE`, a simple character vector is returned that contains all
#' concatenated entries of `levels` from above.
#'
#' @param flatten (`logical(1)`)\cr
#'   Flatten to character vector or not? See description.
#'   Default is `FALSE`.
#' @return `RegisteredLevels` | `character`. See above.
#' @export
parallelGetRegisteredLevels = function(flatten = FALSE) {
  assertFlag(flatten)
  lvls = getPMOption("registered.levels", list())
  if (flatten) {
    return(as.character(unlist(lvls)))
  } else {
    return(makeS3Obj("RegisteredLevels", levels = lvls))
  }
}

#' @export
print.RegisteredLevels = function(x, ...) {
  levs = parallelGetRegisteredLevels()$levels
  ns = names(levs)
  for (i in seq_along(levs)) {
    catf("%s: %s", ns[i], collapse(levs[[i]], sep = ", "))
  }
  invisible(NULL)
}
