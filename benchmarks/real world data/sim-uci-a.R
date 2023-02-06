N = 40
share_unlabeled = 0.8

library(gam)

# print(Sys.time()) 
# try(
#   source(paste(getwd(),"/benchmarks/real world data/run_benchmarks_abalone.R", sep=""))
# )
# try(
#   source(paste(getwd(),"/analyze/analyze.R", sep=""))
# )
# 
# 
# print(Sys.time()) 
# try(
#   source(paste(getwd(),"/benchmarks/real world data/run_benchmarks_banknote.R", sep=""))
# )
# try(
#   source(paste(getwd(),"/analyze/analyze.R", sep=""))
# )
# 
# 

print(Sys.time()) 
try(
  source(paste(getwd(),"/benchmarks/real world data/run_benchmarks_breast-cancer.R", sep=""))
)
try(
  source(paste(getwd(),"/analyze/analyze_all.R", sep=""))
)

# 
# share_unlabeled = 0.75
# 
# 
# print(Sys.time()) 
# try(
#   source(paste(getwd(),"/benchmarks/run_benchmarks_abalone.R", sep=""))
# )
# try(
#   source(paste(getwd(),"/analyze/analyze.R", sep=""))
# )
# 
# 
# print(Sys.time()) 
# try(
#   source(paste(getwd(),"/benchmarks/run_benchmarks_banknote.R", sep=""))
# )
# try(
#   source(paste(getwd(),"/analyze/analyze.R", sep=""))
# )
# 
# 
# 
# print(Sys.time()) 
# try(
#   source(paste(getwd(),"/benchmarks/run_benchmarks_breast_cancer.R", sep=""))
# )
# try(
#   source(paste(getwd(),"/analyze/analyze.R", sep=""))
# )
# 
# share_unlabeled = 0.85
# 
# 
# print(Sys.time()) 
# try(
#   source(paste(getwd(),"/benchmarks/run_benchmarks_abalone.R", sep=""))
# )
# try(
#   source(paste(getwd(),"/analyze/analyze.R", sep=""))
# )
# 
# 
# print(Sys.time()) 
# try(
#   source(paste(getwd(),"/benchmarks/run_benchmarks_banknote.R", sep=""))
# )
# try(
#   source(paste(getwd(),"/analyze/analyze.R", sep=""))
# )
# 
# 
# 
# 
# print(Sys.time()) 
# try(
#   source(paste(getwd(),"/benchmarks/run_benchmarks_breast_cancer.R", sep=""))
# )
# try(
#   source(paste(getwd(),"/analyze/analyze.R", sep=""))
# )
# 
# 
# 
# 



