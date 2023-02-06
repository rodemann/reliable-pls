###############
## global setup
###############
library(dplyr)
#N = 40
#share_unlabeled = 0.8
n = nrow(mtcars)
p = 3
# read in data frame
data_frame = mtcars
name_df = "mtcars" # for results 
data = "mtcars"

target = "vs" 
data_frame[c(target)] <- data_frame[c(target)] %>% unlist() %>% as.factor()
levels_present <- levels(data_frame[c(target)] %>% unlist())
# check whether labels are suited for replacement by 0,1
levels_present
levels(data_frame[, which(names(data_frame) %in% target)]) <- c(0,1)




#train test splict
n_test = nrow(data_frame)*0.5
n_test = round(n_test)


test_rows = sample(nrow(data_frame), size = n_test)
test_data = data_frame[test_rows,]

# data frame for SSL
data = data_frame[-test_rows,]

# share of unlabeled obs
n_imp = (nrow(data) * share_unlabeled) %>% round()


# create data setup by randomly unlabelling data points
unlabeled_data_inst <- sample(nrow(data), n_imp)
labeled_data <- data[-unlabeled_data_inst,]
labeled_data <- cbind(labeled_data,nr = 0)
unlabeled_data <- data[unlabeled_data_inst,]
# formula for glm
formula = vs ~1 + mpg + cyl + disp #+ hp + drat +wt + qsec + am + gear + carb

logistic_model <- glm(formula = formula, 
                      data = data_frame, 
                      family = "binomial")
logistic_model %>% summary()



# multi model
formula_full = vs ~1 + mpg + cyl + disp #+ hp + drat +wt + qsec  + am + gear + carb
formula_1 = vs ~1 + mpg + cyl #+ disp + hp + drat +wt + qsec  + am + gear + carb
formula_2 = vs ~1 + mpg #+ cyl + disp + hp + drat +wt + qsec  + am + gear + carb
formula_3 = vs ~1 #+ mpg + cyl + disp + hp + drat +wt + qsec  + am + gear + carb
formula_4 = vs ~1 + cyl + disp
formula_5 = vs ~1 + mpg + disp
formula_6 = vs ~1 + cyl
formula_7 = vs ~1 + disp

formula_list = list(formula_full, formula_1, formula_2, formula_3, formula_4, formula_5, formula_6, formula_7)



##########################
# source experiments files
##########################
path_to_experiments = paste(getwd(),"/benchmarks/experiments", sep = "")
# sequential sourcing
# miceadds::source.all(path_to_experiments) 


# parallel sourcing
files_to_source = list.files(path_to_experiments, pattern=".R",
                             full.names = TRUE)

#files_to_source = files_to_source[-c(3,4,5)]
data = "mtcars"

num_cores <- parallel::detectCores() - 1
comp_clusters <- parallel::makeCluster(num_cores) # parallelize experiments
doParallel::registerDoParallel(comp_clusters)
object_vec = c("N", "share_unlabeled", "data_frame", "name_df", "formula", "formula_list", "target", "p", "n_test")
env <- environment()
parallel::clusterExport(cl=comp_clusters, varlist = object_vec, envir = env)
parallel::parSapply(comp_clusters, files_to_source, source)

parallel::stopCluster(comp_clusters)



