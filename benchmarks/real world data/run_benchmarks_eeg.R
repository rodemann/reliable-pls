###############
## global setup
###############
library(dplyr)
library(MixGHD)
#N = 100
#share_unlabeled = 0.8
p = 13
n = 182

# read in data frame

data_dir = paste(getwd(),"/data", sep="")
eeg_data = read.table(sprintf('%s/plrx.txt', data_dir), na.strings = c('?'), stringsAsFactors = FALSE)

data_frame <- eeg_data %>% as.data.frame()
names(data_frame)[names(data_frame) == 'V13'] <- 'target'

#get number of instances
data_frame = data_frame[sample(nrow(data_frame), n),]



# formula for glm
vars <- c("target ~")
for (v in 1:(p-1)) {
  vars <- c(vars, colnames(data_frame)[v])
}
#vars = c(vars, "s(V12)")
formula = paste(vars, collapse=" + ") %>% as.formula()
for (v in 1:(p-4)) {
  vars <- c(vars, colnames(data_frame)[v])
}
#vars = c(vars, "s(V12)")
formula_1 = paste(vars, collapse=" + ") %>% as.formula()
for (v in 1:(p-8)) {
  vars <- c(vars, colnames(data_frame)[v])
}
#vars = c(vars, "s(V12)")
formula_2 = paste(vars, collapse=" + ") %>% as.formula()
for (v in 1:(p-10)) {
  vars <- c(vars, colnames(data_frame)[v])
}
#vars = c(vars, "s(V12)")
formula_3 = paste(vars, collapse=" + ") %>% as.formula()


formula_list = list(formula, formula_1, formula_2, formula_3)


target = "target" 
data_frame[c(target)] <- data_frame[c(target)] %>% unlist() %>% as.factor()
levels_present <- levels(data_frame[c(target)] %>% unlist())
# check whether labels are suited for replacement by 0,1
levels_present
levels(data_frame[, which(names(data_frame) %in% target)]) <- c(0,1)


minority = data_frame[which(data_frame$target == 0),]
drop_n = 50
minority = minority[sample(nrow(minority), drop_n),]
data_frame = anti_join(data_frame, minority)

n = nrow(data_frame)
  
#gam(formula = formula, data = data_frame, family = "binomial") %>% summary



#train test splict
n_test = nrow(data_frame)*0.5
n_test = round(n_test)


name_df = "eeg_data" # for results 
data = "eeg_data"

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



