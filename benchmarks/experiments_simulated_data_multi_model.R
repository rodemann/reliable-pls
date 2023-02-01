library(dplyr)

set.seed(2037420)

N = 100
share_setups = c(0.8, 0.9,0.95)
n_setups = c(60,80,120,160,200)

for (share_unlabeled in share_setups) {
  for (n in n_setups){
    share_unlabeled %>% print
    n %>% print()
    try(
      source(paste(getwd(),"/benchmarks/run_benchmarks_simulated_data_multi_model_p=6.R", sep=""))
    )
    try(
      source(paste(getwd(),"/analyze/analyze_all.R", sep=""))
    )
    print(Sys.time()) 
  }
}

