context("mpi mode")

# cran allows no mpi mode testing
# FIXME: same problem as for socket mode test, but we cannot test on cran anyway
# FIXME: Spurious errors on CI as well -> Rmpi bad :/
test_that("mpi mode", {
  skip_on_cran()
  skip_on_ci()

  parallelStartMPI(2)
  partest1()
  parallelStop()

  parallelStartMPI(2, load.balancing = TRUE)
  partest1()
  parallelStop()

  parallelStartMPI(2, logging = TRUE, storage = tempdir())
  partest2(tempdir())
  parallelStop()

  parallelStartMPI(2)
  partest3()
  parallelStop()

  parallelStartMPI(2)
  partest4(slave.error.test = TRUE)
  parallelStop()

  parallelStartMPI(2)
  partest5()
  parallelStop()

  parallelStartMPI(2)
  partest6(slave.error.test = TRUE)
  parallelStop()

  parallelStartMPI(2, load.balancing = TRUE)
  partest7()
  parallelStop()
})
