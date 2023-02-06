###############
## global setup
###############
library(dplyr)
library(MixGHD)
#N = 40
#share_unlabeled = 0.8
p = 3
#n = 500

# read in data frame

data_dir = paste(getwd(),"/data", sep="")
mushrooms= read.csv(paste(data_dir, "/secondary_data.csv",sep=""), sep = ";", na.strings = c('NA'), stringsAsFactors = FALSE)
data_frame <- mushrooms %>% as.data.frame()

data_frame = data_frame %>% dplyr::select(cap.diameter, stem.height, stem.width, class)

names(data_frame)[names(data_frame) == 'class'] <- 'target'
data_frame = na.omit(data_frame)

#get number of instances

data_frame = data_frame[sample(nrow(data_frame), n),]

#train test splict
n_test = nrow(data_frame)*0.5
n_test = round(n_test)


name_df = "mushrooms" # for results 
data = "mushrooms"


# formula for glm
vars <- c("target ~")
for (v in 1:p) {
  vars <- c(vars, colnames(data_frame)[v])
}
#vars = c(vars, "s(stem.width)")

formula = paste(vars, collapse=" + ") %>% as.formula()
formula = target ~ 1 +cap.diameter + stem.height + stem.width
formula_1 = target ~ 1 + cap.diameter 
formula_2 = target ~ 1 + stem.height 
formula_3 = target ~ 1 + stem.width
formula_4 = target ~ 1 +cap.diameter + stem.height 
formula_5 = target ~ 1 +cap.diameter + stem.width
formula_6 = target ~ 1 + stem.height + stem.width

formula_list = c(formula_1, formula_2, formula_3, formula_4, formula_5, formula_6, formula)



target = "target" 
data_frame[c(target)] <- data_frame[c(target)] %>% unlist() %>% as.factor()
levels_present <- levels(data_frame[c(target)] %>% unlist())
# check whether labels are suited for replacement by 0,1
levels_present
levels(data_frame[, which(names(data_frame) %in% target)]) <- c(0,1)

glm(formula = formula, data = data_frame, family = "binomial") %>% summary


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



