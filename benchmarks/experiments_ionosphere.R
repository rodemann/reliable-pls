library(dplyr)

set.seed(2037420)

# N = 100
# share_setups = c(0.8)
# 
# for (share_unlabeled in share_setups) {
#     share_unlabeled %>% print
#     n %>% print()
#     try(
#       source(paste(getwd(),"/benchmarks/real world data/run_benchmarks_mtcars.R", sep=""))
#     )
#     try(
#       source(paste(getwd(),"/analyze/analyze_all.R", sep=""))
#     )
#     print(Sys.time()) 
#   }
# 
# 



N = 40
n_setups = c(180,200,220,240,280,320,350)

for (share_unlabeled in share_setups) {
  for (n in n_setups){
    share_unlabeled %>% print
    n %>% print()
    try(
      source(paste(getwd(),"/benchmarks/real world data/run_benchmarks_ionoshere.R", sep=""))
    )
    try(
      source(paste(getwd(),"/analyze/analyze_all.R", sep=""))
    )
    print(Sys.time()) 
  }
}

# n_setups = c(60,80,100,140,160,180,200)
# 
# for (share_unlabeled in share_setups) {
#   for (n in n_setups){
#     share_unlabeled %>% print
#     n %>% print()
#     try(
#       source(paste(getwd(),"/benchmarks/run_benchmarks_simulated_data_multi_model_p=6.R", sep=""))
#     )
#     try(
#       source(paste(getwd(),"/analyze/analyze_all.R", sep=""))
#     )
#     print(Sys.time()) 
#   }
# }
# 
# n_setups = c(60,80,100,140,160,180,200)
# 
# for (share_unlabeled in share_setups) {
#   for (n in n_setups){
#     share_unlabeled %>% print
#     n %>% print()
#     try(
#       source(paste(getwd(),"/benchmarks/run_benchmarks_simulated_data_multi_model_p=4.R", sep=""))
#     )
#     try(
#       source(paste(getwd(),"/analyze/analyze_all.R", sep=""))
#     )
#     print(Sys.time()) 
#   }
# }
# 
# 
# n_setups = c(160,180,200,220)
# 
# for (share_unlabeled in share_setups) {
#   for (n in n_setups){
#     share_unlabeled %>% print
#     n %>% print()
#     try(
#       source(paste(getwd(),"/benchmarks/real world data/run_benchmarks_mushrooms.R", sep=""))
#     )
#     try(
#       source(paste(getwd(),"/analyze/analyze_all.R", sep=""))
#     )
#     print(Sys.time()) 
#   }
# }

