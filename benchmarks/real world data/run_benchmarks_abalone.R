###############
## global setup
###############
library(dplyr)
#N = 100
#share_unlabeled = 0.8
n = 400
p = 4




# read in data frame
data <- readr::read_csv("data/abalone.data") %>% as.data.frame()
data = data[-which(data$M == "I"),]
data$M = ifelse(data$M=="M",1,0)
names(data)[names(data) == 'M'] <- 'target'
data_frame = data[sample(nrow(data), n),]
data_frame$rings <- data_frame$`15`
data_frame$length <- data_frame$`0.455`
data_frame$weight <- data_frame$`0.514`
data_frame$diameter <- data_frame$`0.365`
data_frame$height <- data_frame$`0.095`
data_frame$shell_weight <- data_frame$`0.15`
data_frame <- subset.data.frame(data_frame, select = c(target, rings, length, 
                                                       weight, height, diameter,
                                                       shell_weight))

#train test splict
n_test = nrow(data_frame)*0.5
n_test = round(n_test)



name_df = "abalone" # for results 
data = "abalone"
# formula for glm
formula = target ~1 + rings + length + weight + height + diameter + shell_weight    
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
object_vec = c("N", "share_unlabeled", "data_frame", "name_df", "formula", "target", "p", "n_test")
env <- environment()
parallel::clusterExport(cl=comp_clusters, varlist = object_vec, envir = env)
parallel::parSapply(comp_clusters, files_to_source, source)

parallel::stopCluster(comp_clusters)



