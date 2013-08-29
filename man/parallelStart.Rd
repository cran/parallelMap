\name{parallelStart}
\alias{parallelStart}
\alias{parallelStartBatchJobs}
\alias{parallelStartLocal}
\alias{parallelStartMPI}
\alias{parallelStartMulticore}
\alias{parallelStartSocket}
\title{Parallelization setup for parallelMap.}
\usage{
  parallelStart(mode, cpus, socket.hosts, level, logging,
    storagedir, bj.resources = list(), show.info, ...)

  parallelStartLocal(show.info)

  parallelStartMulticore(cpus, level, logging, storagedir,
    show.info)

  parallelStartSocket(cpus, socket.hosts, level, logging,
    storagedir, show.info, ...)

  parallelStartMPI(cpus, level, logging, storagedir,
    show.info, ...)

  parallelStartBatchJobs(level, logging, storagedir,
    bj.resources = list(), show.info)
}
\arguments{
  \item{mode}{[\code{character(1)}]\cr Which parallel mode
  should be used: \dQuote{local}, \dQuote{multicore},
  \dQuote{socket}, \dQuote{mpi}, \dQuote{BatchJobs}.
  Default is the option \code{parallelMap.default.mode} or,
  if not set, \dQuote{local} without parallel execution.}

  \item{cpus}{[\code{integer(1)}]\cr Number of used cpus.
  For local and BatchJobs mode this argument is ignored.
  For socket this is the numbers of processes spawned on
  localhost, if you want processes on multiple machines use
  \code{socket.hosts}.  Default is the option
  \code{parallelMap.default.cpus} or, if not set,
  \code{\link[parallel]{detectCores}} for multicore mode,
  \code{\link[Rmpi]{mpi.universe.size}} for mpi mode and 1
  for socket mode.}

  \item{socket.hosts}{[\code{character}]\cr Only used in
  socket mode, otherwise ignored.  Names of hosts where
  parallel processes are spawned.  Default is the option
  \code{parallelMap.default.socket.hosts}, if this option
  exists.}

  \item{level}{[\code{character(1)}]\cr You can set this so
  only calls to \code{\link{parallelMap}} are parallelized
  that have the same level specified.  Default is the
  option \code{parallelMap.default.level} or, if not set,
  \code{NA} which means all calls to
  \code{\link{parallelMap}} are are parallelized.}

  \item{logging}{[\code{logical(1)}]\cr Should slave output
  be logged to files via \code{\link{sink}} under the
  \code{storagedir}?  Files are named
  "<iteration_number>.log" and put into unique
  subdirectories named \dQuote{parallelMap_log_<nr>} for
  each subsequent \code{\link{parallelMap}} operation.
  Previous logging directories are removed on
  \code{parallelStart} if \code{logging} is enabled.
  Logging is not supported for local mode, because you will
  see all output on the master and can also run stuff like
  \code{\link{traceback}} in case of errors.  Default is
  the option \code{parallelMap.default.logging} or, if not
  set, \code{FALSE}.}

  \item{storagedir}{[\code{character(1)}]\cr Existing
  directory where log files and intermediate objects for
  BatchsJobs mode are stored.  Note that all nodes must
  have write access to exactly this path.  Default is the
  current working directory.}

  \item{bj.resources}{[\code{list}]\cr Resources like
  walltime for submitting jobs on HPC clusters via
  BatchJobs.  See \code{\link[BatchJobs]{submitJobs}}.
  Defaults are taken from your BatchJobs config file.}

  \item{show.info}{[\code{logical(1)}]\cr Verbose output on
  console?  Default is the option
  \code{parallelMap.default.show.info} or, if not set,
  \code{TRUE}.}

  \item{...}{[any]\cr Optional parameters, for socket mode
  passed to \code{\link[parallel]{makePSOCKcluster}}, for
  mpi mode passed to \code{\link[parallel]{makeCluster}}.}
}
\value{
  Nothing.
}
\description{
  Defines the underlying parallelization mode for
  \code{\link{parallelMap}} and allows to set a
  \dQuote{level} of parallelization. Only calls to
  \code{\link{parallelMap}} with a matching level are
  parallelized.
}
\details{
  The defaults of all settings are taken from your options,
  which you can also define in your R profile.

  For an introductory tutorial and information on the
  options configuration, please go to the project's github
  page at \url{https://github.com/berndbischl/parallelMap}.

  Currently the following modes are supported, which
  internally dispatch the mapping operation to functions
  from different parallelization packages:

  \describe{ \item{local}{No parallelization with
  \code{\link{mapply}}.} \item{multicore}{Multicore
  execution on a single machine
  with\code{\link[parallel]{mclapply}}.}
  \item{socket}{Socket cluster on one or multiple machines
  with \code{\link[parallel]{makePSOCKcluster}} and
  \code{\link[parallel]{clusterApplyLB}}.} \item{mpi}{Snow
  MPI cluster on one or multiple machines with
  \code{\link[parallel]{makeCluster}} and
  \code{\link[parallel]{clusterApplyLB}}.}
  \item{BatchJobs}{Parallelization on batch queuing HPC
  clusters, e.g., Torque, SLURM, etc., by with
  \code{\link[BatchJobs]{batchMap}}.} }

  For BatchJobs you need to define a storage directory
  through the argument storagedir or the option
  \code{parallelMap.storagedir}
}

