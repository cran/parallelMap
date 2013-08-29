\name{parallelMap}
\alias{parallelMap}
\title{Maps a function over lists or vectors in parallel.}
\usage{
  parallelMap(fun, ..., more.args = list(),
    simplify = FALSE, use.names = FALSE,
    level = as.character(NA))
}
\arguments{
  \item{fun}{[\code{function}]\cr Function to map over
  \code{...}.}

  \item{...}{[any]\cr Arguments to vectorize over (list or
  vector).}

  \item{more.args}{[\code{list}]\cr A list of other
  arguments passed to \code{fun}.  Default is empty list.}

  \item{simplify}{[\code{logical(1)}]\cr Should the result
  be simplified?  See \code{\link{sapply}}.  Default is
  \code{FALSE}.}

  \item{use.names}{[\code{logical(1)}]\cr Should result be
  named by first vector if that is of class character?
  Default is \code{FALSE}.}

  \item{level}{[\code{character(1)}]\cr The call is only
  parallelized if the same level is specified in
  \code{\link{parallelStart}} or this argument is
  \code{NA}.  Default is \code{NA}.}
}
\value{
  Result.
}
\description{
  Use the parallelization mode and the other options set in
  \code{\link{parallelStart}}.
}
\examples{
parallelStart()
parallelMap(identity, 1:2)
parallelStop()
}

