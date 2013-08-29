\name{parallelLibrary}
\alias{parallelLibrary}
\title{Load packages for parallelization.}
\usage{
  parallelLibrary(..., packages, level = as.character(NA),
    master = TRUE)
}
\arguments{
  \item{...}{[\code{character(1)}]\cr Names of packages to
  load.}

  \item{packages}{[\code{character(1)}]\cr Names of
  packages to load.  Alternative way to pass arguments.}

  \item{level}{[\code{character(1)}]\cr The function only
  loads the packages if the same level is specified in
  \code{\link{parallelStart}} or this argument is
  \code{NA}.  See \code{\link{parallelMap}}.  Default is
  \code{NA}.}

  \item{master}{[\code{logical(1)}]\cr Load packages also
  on master?  If you set this to \code{FALSE}, nothing
  actually happens for modes local and multicore.  Default
  is \code{TRUE}.}
}
\value{
  Nothing.
}
\description{
  Makes sure that case of socket, mpi and BatchJobs mode,
  the package is loaded in the slave processes. For all
  modes the package is also (potentially) loaded on the
  master. Note that loading the package on the master is
  (obviously) required for having it available in the slave
  operation for modes local and multicore.
}

