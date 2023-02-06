###############
## global setup
###############
library(dplyr)
library(MixGHD)
library(gam)
#N = 10
#share_unlabeled = 0.8
p = 60
n = 208

# read in data frame
data(sonar)
data_frame <- sonar %>% as.data.frame()
names(data_frame)[names(data_frame) == 'V61'] <- 'target'

#get number of instances
data_frame = data_frame[sample(nrow(data_frame), n),]


#train test splict
n_test = nrow(data_frame)*0.5
n_test = round(n_test)


name_df = "sonar_test_split_0.5" # for results 
data = "sonar_test_split_0.5"

colnames(data_frame)

# formula for glm
vars <- c("target ~")
for (v in 1:p) {
  vars <- c(vars, colnames(data_frame)[v])
}
#vars = c(vars, "s(V60)")

formula = paste(vars, collapse=" + ") %>% as.formula()

target = "target" 
data_frame[c(target)] <- data_frame[c(target)] %>% unlist() %>% as.factor()
levels_present <- levels(data_frame[c(target)] %>% unlist())
# check whether labels are suited for replacement by 0,1
levels_present
levels(data_frame[, which(names(data_frame) %in% target)]) <- c(0,1)

gam(formula = formula, data = data_frame, family = "binomial") %>% summary


##########################
# source experiments files
##########################
path_to_experiments = paste(getwd(),"/benchmarks/experiments", sep = "")
# sequential sourcing
# miceadds::source.all(path_to_experiments) 


# parallel sourcing
files_to_source = list.files(path_to_experiments, pattern="*.R",
                             full.names = TRUE)

num_cores <- parallel::detectCores() - 1
comp_clusters <- parallel::makeCluster(num_cores) # parallelize experiments
doParallel::registerDoParallel(comp_clusters)
object_vec = c("N", "share_unlabeled", "data_frame", "name_df", "formula", "target", "p", "n_test")
env <- environment()
parallel::clusterExport(cl=comp_clusters, varlist = object_vec, envir = env)
parallel::parSapply(comp_clusters, files_to_source, source)

parallel::stopCluster(comp_clusters)



