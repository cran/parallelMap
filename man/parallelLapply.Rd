\name{parallelLapply}
\alias{parallelLapply}
\alias{parallelSapply}
\title{A parallel verions of apply-family functions}
\usage{
  parallelLapply(xs, fun, ..., level = NA_character_)

  parallelSapply(xs, fun, ..., simplify = TRUE,
    use.names = TRUE, level = NA_character_)
}
\arguments{
  \item{xs}{[\code{vector} | \code{list}]\cr \code{fun} is
  applied to the the elements of this argument.}

  \item{fun}{[\code{function}]\cr Function to map over
  \code{xs}.}

  \item{...}{[any]\cr Further arguments passed to
  \code{fun}.}

  \item{simplify}{[\code{logical(1)}]\cr See
  \code{\link{sapply}}.  Default is \code{TRUE}.}

  \item{use.names}{[\code{logical(1)}]\cr See
  \code{\link{sapply}}.  Default is \code{TRUE}.}

  \item{level}{[\code{character(1)}]\cr See
  \code{\link{parallelMap}}.}
}
\value{
  For \code{parallelLapply} an unamed list,
  \code{parallelSapply} it depends on \code{fun} and the
  set arguments.
}
\description{
  \code{parallelLapply}: A parallel \code{\link{lapply}}
  version. \code{parallelSapply}: A parallel
  \code{\link{sapply}} version.
}
\details{
  All functions are simple wrappers for
  \code{\link{parallelMap}}
}

