\name{parallelStop}
\alias{parallelStop}
\title{Stops parallelization.}
\usage{
  parallelStop()
}
\value{
  Nothing.
}
\description{
  The parallelMap mode is set to \dQuote{local}, i.e.,
  parallelization is turned off.
}
\details{
  After a subsequent call of \code{\link{parallelStart}},
  no exported objects are present on the slaves and no
  libraries are loaded, i.e., you have clean R sessions on
  the slaves.

  For socket and mpi mode
  \code{\link[parallel]{stopCluster}} is called.

  For BatchJobs mode the subdirectory of the
  \code{storagedir} containing the exported objects is
  removed.
}

