
N=40
share_unlabeled = 0.8
library(gam)

print(Sys.time()) 
try(
  source(paste(getwd(),"/benchmarks/real world data/run_benchmarks_sonar.R", sep=""))
)
try(
  source(paste(getwd(),"/analyze/analyze.R", sep=""))
)



print(Sys.time()) 
try(
  source(paste(getwd(),"/benchmarks/real world data/run_benchmarks_mushrooms.R", sep=""))
)
try(
  source(paste(getwd(),"/analyze/analyze.R", sep=""))
)



print(Sys.time()) 
try(
  source(paste(getwd(),"/benchmarks/real world data/run_benchmarks_mtcars.R", sep=""))
)
try(
  source(paste(getwd(),"/analyze/analyze.R", sep=""))
)



share_unlabeled = 0.75

print(Sys.time()) 
try(
  source(paste(getwd(),"/benchmarks/real world data/run_benchmarks_sonar.R", sep=""))
)
try(
  source(paste(getwd(),"/analyze/analyze.R", sep=""))
)



print(Sys.time()) 
try(
  source(paste(getwd(),"/benchmarks/real world data/run_benchmarks_mushrooms.R", sep=""))
)
try(
  source(paste(getwd(),"/analyze/analyze.R", sep=""))
)



print(Sys.time()) 
try(
  source(paste(getwd(),"/benchmarks/real world data/run_benchmarks_mtcars.R", sep=""))
)
try(
  source(paste(getwd(),"/analyze/analyze.R", sep=""))
)


share_unlabeled = 0.85

print(Sys.time()) 
try(
  source(paste(getwd(),"/benchmarks/real world data/run_benchmarks_sonar.R", sep=""))
)
try(
  source(paste(getwd(),"/analyze/analyze.R", sep=""))
)



print(Sys.time()) 
try(
  source(paste(getwd(),"/benchmarks/real world data/run_benchmarks_mushrooms.R", sep=""))
)
try(
  source(paste(getwd(),"/analyze/analyze.R", sep=""))
)



print(Sys.time()) 
try(
  source(paste(getwd(),"/benchmarks/real world data/run_benchmarks_mtcars.R", sep=""))
)
try(
  source(paste(getwd(),"/analyze/analyze.R", sep=""))
)



