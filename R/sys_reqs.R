
library(desc)
require(gtools)

sys_reqs <- function(pkg) {
  pkgs <- gtools::getDependencies(pkg)
  dir.create('check-a78g4')

  message('Finding dependencies...')
  d <- download.packages(pkgs, 'check-a78g4', quiet = T)[,2]
  out <- vector()

  for(pkg in d) {
    untar(pkg, exdir = 'check-a78g4')


    # throw error if package does not have DESCRIPTION file
    # grep('DESCRIPTION', untar(pkg, list = T), value = T)

    desc <- grep('DESCRIPTION', untar(pkg, list = T), value = T)
    if(length(desc) == 0) next

    # only gets first description file, not any included in inst/
    desc <- paste('check-a78g4', desc[1], sep = '/')

    skip_to_next <- F

    tryCatch({
      out <- c(desc::desc_get_field('SystemRequirements', file = desc), out)
      print()
    }, error = function(err) {
      skip_to_next <- T
    })
    if(skip_to_next ==  T) next
  }

  message('Required packages: \n')
  tmp <- sapply(out, message)

  unlink('check-a78g4', recursive = T)
}



