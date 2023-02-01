library(dplyr)

set.seed(2037420)

N = 40
share_setups = c(0.8)
n_setups = c(40,60,80)

for (share_unlabeled in share_setups) {
  for (n in n_setups){
    share_unlabeled %>% print
    n %>% print()
    try(
      source(paste(getwd(),"/benchmarks/run_benchmarks_simulated_data_multi_model_p=4.R", sep=""))
    )
    try(
      source(paste(getwd(),"/analyze/_multi_model.R", sep=""))
    )
    print(Sys.time()) 
  }
}

