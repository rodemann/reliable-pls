###############
## global setup
###############
library(dplyr)
library(fdm2id)
library(gam)
#share_unlabeled = 0.8
p = 33
#n = 350

# read in data frame
data(ionosphere)
data_frame <- ionosphere %>% as.data.frame()
names(data_frame)[names(data_frame) == 'V35'] <- 'target'
# #subset data
# data_frame <- data_frame[,-c(30:33)]
#susample selected number of instances
data_frame = data_frame[sample(nrow(data_frame), n),]
#train test splict
n_test = nrow(data_frame)*0.5
n_test = round(n_test)


name_df = "ionosphere_full" # for results 
data = "ionosphere_full"
# formula for glm
vars <- c("target ~")
for (v in 1:p) {
  vars <- c(vars, colnames(data_frame)[v])
}
formula = paste(vars, collapse=" + ") %>% as.formula()


# alt formulas:
vars <- c("target ~")
for (v in 1:20) {
  v = sample(1:p,1)
  vars <- c(vars, colnames(data_frame)[v])
}
formula_alt1 = paste(vars, collapse=" + ") %>% as.formula()
vars <- c("target ~")
for (v in 1:20) {
  v = sample(1:p,1)
  vars <- c(vars, colnames(data_frame)[v])
}
formula_alt2 = paste(vars, collapse=" + ") %>% as.formula()
vars <- c("target ~")
for (v in 1:20) {
  v = sample(1:p,1)
  vars <- c(vars, colnames(data_frame)[v])
}
formula_alt3 = paste(vars, collapse=" + ") %>% as.formula()

formula_list = list(formula, formula_alt1, formula_alt2, formula_alt3)

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
object_vec = c("N", "share_unlabeled", "data_frame", "name_df", "formula", "formula_list", "target", "p", "n_test")
env <- environment()
parallel::clusterExport(cl=comp_clusters, varlist = object_vec, envir = env)
parallel::parSapply(comp_clusters, files_to_source, source)

parallel::stopCluster(comp_clusters)



