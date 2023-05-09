
# *In all Likelihoods*

## Robust Selection of Pseudo-Labeled Data

<img src="plots/res_plot_data=simulated_share=0.8_n=60_p=6.png" width="150"> <img src="plots/res_plot_data=simulated_share=0.8_n=100_p=6.png" width="150"><img src="plots/res_plot_data=simulated_share=0.8_n=140_p=6.png" width="150"><img src="plots/res_plot_data=simulated_share=0.8_n=200_p=6.png" width="150">


## Introduction, Table of Contents
This repository contains implementation, results and experimenal scripts for reliable Pseudo-Label Selection, as introduced in the paper "In all Likelihoods: How to Reliably Select Pseudo-Labeled Data for Self-Training in Semi-Supervised Learning". More specifically,

* [R](R) contains implementation of multi-model PLS, multi-lable (wieghted and unweighted) PLS and alternative PLS methods to benchmark against
* [benchmarking](benchmarking) provides files for experiments (section 5), in order to reproduce results, see setup below
* [data](data) contains real-world data used in experiments
* experimental results and visualization thereof will be saved in [plots](plots) and [results](results) 
* all results can be found in [plots](plots) 
* In order to reproduce experiments, please read **setup** further below

## Results



##
### **Banknote data**
##

**[Banknote data](https://archive.ics.uci.edu/ml/datasets/banknote+authentication) (q = 3, subsample of size n = 160, share of unlabeled = 0.8)**

<img src="plots/res_plot_data=banknote_share=0.8_n=160_p=3.png" width="600"> 

**[Banknote data](https://archive.ics.uci.edu/ml/datasets/banknote+authentication) (q = 3, subsample of size n = 120, share of unlabeled = 0.8)**

<img src="plots/res_plot_data=banknote_share=0.8_n=120_p=3.png" width="600"> 

**[Banknote data](https://archive.ics.uci.edu/ml/datasets/banknote+authentication) (q = 3, subsample of size n = 80, share of unlabeled = 0.8)**

<img src="plots/res_plot_data=banknote_share=0.8_n=80_p=3.png" width="600"> 

**[Banknote data](https://archive.ics.uci.edu/ml/datasets/banknote+authentication) (q = 3, subsample of size n = 40, share of unlabeled = 0.8)**

<img src="plots/res_plot_data=banknote_share=0.8_n=40_p=3.png" width="600"> 




##
### **Mushrooms data**
##
**[Mushrooms data](https://archive.ics.uci.edu/ml/datasets/mushrooms) (q =3, n = 120, share of unlabeled = 0.8)**

<img src="plots/res_plot_data=mushrooms_share=0.9_n=120_p=3.png" width="600"> 

**[Mushrooms data](https://archive.ics.uci.edu/ml/datasets/mushrooms) (q =3, n = 160, share of unlabeled = 0.8)**

<img src="plots/res_plot_data=mushrooms_share=0.9_n=160_p=3.png" width="600">

**[Mushrooms data](https://archive.ics.uci.edu/ml/datasets/mushrooms) (q =3, n = 200, share of unlabeled = 0.8)**

<img src="plots/res_plot_data=mushrooms_share=0.9_n=120_p=3.png" width="600"> 





##
### **Simulated data**
##
**[Simulated data](benchmarks/run_benchmarks_simulated_data_multi_model_p=6.R) (q = 6, n = 60, share of unlabeled = 0.8)**

<img src="plots/res_plot_data=simulated_share=0.8_n=60_p=6.png" width="600"> 

**[Simulated data](https://archive.ics.uci.edu/ml/datasets/banknote+authentication) (q = 6, n = 100, share of unlabeled = 0.8)**

<img src="plots/res_plot_data=simulated_share=0.8_n=100_p=6.png" width="600"> 

**[Simulated data](https://archive.ics.uci.edu/ml/datasets/banknote+authentication) (q = 6, n = 140, share of unlabeled = 0.8)**

<img src="plots/res_plot_data=simulated_share=0.8_n=140_p=6.png" width="600"> 

**[Simulated data](https://archive.ics.uci.edu/ml/datasets/banknote+authentication) (q = 6, n = 160, share of unlabeled = 0.8)**

<img src="plots/res_plot_data=simulated_share=0.8_n=160_p=6.png" width="600"> 

**[Simulated data](https://archive.ics.uci.edu/ml/datasets/banknote+authentication) (q = 6, n = 180, share of unlabeled = 0.8)**

<img src="plots/res_plot_data=simulated_share=0.8_n=180_p=6.png" width="600"> 

**[Simulated data](https://archive.ics.uci.edu/ml/datasets/banknote+authentication) (q = 6, n = 200, share of unlabeled = 0.8)**

<img src="plots/res_plot_data=simulated_share=0.8_n=200_p=6.png" width="600"> 


##
### **Cars data**
##
**[Cars data](https://archive.ics.uci.edu/ml/datasets/auto+mpg) (q =3, n = 32, share of unlabeled = 0.7)**

<img src="plots/res_plot_data=mtcars_share=0.7_n=32_p=3.png" width="600"> 

<!---**[Cars data](https://archive.ics.uci.edu/ml/datasets/auto+mpg) (q =3, n = 32, share of unlabeled = 0.8)**--->

<!---<img src="plots/res_plot_data=mtcars_share=0.8_n=32_p=3.png" width="600"> --->

**[Cars data](https://archive.ics.uci.edu/ml/datasets/auto+mpg) (q =3, n = 32, share of unlabeled = 0.9)**

<img src="plots/res_plot_data=mtcars_share=0.9_n=32_p=3.png" width="600"> 

**[Cars data](https://archive.ics.uci.edu/ml/datasets/auto+mpg) (q =3, n = 32, share of unlabeled = 0.95)**

<img src="plots/res_plot_data=mtcars_share=0.95_n=32_p=3.png" width="600"> 





## Setup

First and foremost, please install all dependencies by sourcing [this file](_setup_session.R).

Then download the implementations of BPLS with PPP and concurring PLS methods and save in a folder named "R":

* [Supervised Baseline](R/standard_supervised.R)
* [Probability Score](R/standard_self_training_conf.R)
* [Predictive Variance](R/standard_self_training.R)
* [PPP (Bayes-optimal)](R/diff_marg_likelihood_pred_ext.R)
* [PPP (Bayes-optimal) Bayesian Neural Net](R/diff_marg_likelihood_pred_ext_bnn.R)
* [Likelihood (max-max)](R/diff_marg_likelihood_pred.R)
* [Utilities for PPP](R/utils_diff_marg_likelihood.R)


In order to reproduce the papers' key results (and visualizations thereof) further download these scripts and save in respective folder:

* in folder analysis/
    * [analysis and visualization](analyze/analyze.R) 
* in folder benchmarks/
    * [global setup of experiments](benchmarks/run_benchmarks_simulated_data_p=60.R)
* in folder benchmarks/experiments/
    * [experiments with likelihood (max-max)](benchmarks/experiments/benchmark-dml-pred.R)
    * [experiments with PPP (bayes-opt)](benchmarks/experiments/benchmark-dml-pred-ext.R)
    * [experiments with supervised baseline](benchmarks/experiments/_benchmark-standard-supervised.R)
    * [experiments with predictive variance](benchmarks/experiments/_benchmark-standard-self-training.R)
    * [experiments with probability score](benchmarks/experiments/_benchmark-standard-self-training_conf.R)


Eventually, download [benchmarks/experiments_simulated_data.R](benchmarks/experiments_simulated_data.R) and run from benchmarks/ (estimated runtime: 30 CPU hours)

Important: Create empty folders [results](results) and [plots](plots) where experimental results will be stored automatically. In addition, you can access them as object after completion of the experiments.

### Tested with

- R 4.2.0
- R 4.1.6
- R 4.0.3

on
- Linux Ubuntu 20.04
- Linux Debian 10
- Windows 11 Pro Build 22H2 


## Further experiments

Additional experimental setups can now easily be created by modifying [benchmarks/experiments_simulated_data.R](benchmarks/experiments_simulated_data.R)


## Data

Find data and files to read in data in folder [data](data). 



