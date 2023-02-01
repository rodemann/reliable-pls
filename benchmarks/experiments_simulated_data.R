library(dplyr)

set.seed(2037420)

N = 40
share_setups = c(0.6,0.7,0.8)
n_setups = c(40,60,80,120)

for (share_unlabeled in share_setups) {
  for (n in n_setups){
    share_unlabeled %>% print
    n %>% print()
    try(
      source(paste(getwd(),"/benchmarks/run_benchmarks_simulated_data_p=4.R", sep=""))
    )
    try(
      source(paste(getwd(),"/analyze/analyze.R", sep=""))
    )
    print(Sys.time()) 
  }
}

