\name{parallelRegisterLevels}
\alias{parallelRegisterLevels}
\title{Register available parallelization levels in a client package.}
\usage{
  parallelRegisterLevels(package, levels)
}
\arguments{
  \item{package}{[\code{character(1)}]\cr Name of your
  package.}

  \item{levels}{[\code{character(1)}]\cr Availabe levels
  that used in your \code{\link{parallelMap}} operations in
  your package.}
}
\value{
  Nothing.
}
\description{
  Call this in your\code{\link{.onLoad}} in your
  \dQuote{zzz.R}.
}

