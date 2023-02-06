library(ggpubr)
# 
# plot_list = list(plot_abalone, plot_sonar, plot_eeg, plot_mushrooms,
#                  plot_ionosphere, plot_cars, plot_cancer, plot_banknote)#,
#                  #plot_sim_60, plot_sim_100, plot_sim_400, plot_sim_1000)

#save(plot_list, file = "results_plots_0.7")


# 
# load("results_plots_0.7")
# plot_list[[7]] = plot_cancer

#saved_list = list(plot_1, plot_2, plot_3)
#save(saved_list, file = "results_plots_0.8_informative")

#load("results_plots_0.8_informative")
# 
# saved_list


# plot_1 = saved_list[[1]]
# plot_2 = saved_list[[2]]
# plot_3 = saved_list[[3]]

p = 6
share_unlabeled = 0.8

# data = paste("n = ",240, ",", " p = ", p, ",", " share of unlabeled: ", share_unlabeled, sep = "") 
# plot_1 = plot_1 + xlab(data)
# data = paste("n = ",300, ",", " p = ", p, ",", " share: ", share_unlabeled, sep = "") 
# plot_2 = plot_2 + xlab(data)
# data = paste("n = ",400, ",", " p = ", p, ",", " share: ", share_unlabeled, sep = "") 
# plot_3 = plot_3 + xlab(data)
# data = paste("n = 240") 
# plot_1 = plot_1 + xlab(data)
# data = paste("n = 280") 
# plot_2 = plot_2 + xlab(data)
# data = paste("n = 320") 
# plot_3 = plot_3 + xlab(data)
# data = paste("n = 350") 
# plot_4 = plot_4 + xlab(data)

data = paste("n = ",100, ",", " q = ", p, ",", " share of unlabeled: ", share_unlabeled, sep = "")
plot_1 = plot_1 + xlab(data)
data = paste("n = ",200, ",", " q = ", p, ",", " share: ", share_unlabeled, sep = "")
plot_2 = plot_2 + xlab(data)


#plot_list = list(plot_1, plot_2, plot_3, plot_4, plot_5, plot_6, plot_7, plot_8)
plot_list = list(plot_1, plot_2)


#save(plot_list, file = "results_plots_GLM_informative")


#plot_list = list(plot_60, plot_100, plot_400, plot_1000)

plot_list= lapply(plot_list, function(plot){
  plot <- plot + rremove("ylab") #+ rremove("xlab")
  theme(legend.key = element_rect("grey8"), legend.key.size = unit(40,"point"),
        legend.title = element_text(size = 28, face = "bold", family = "TT Arial"),
        legend.text = element_text(size = 22, face = "italic", family = "TT Arial"))
  plot
} )

plot = plot + rremove("ylab") + 
  theme(legend.key = element_rect("grey8"), legend.key.size = unit(30,"point"),
        legend.title = element_text(size = 16, face = "bold", family = "TT Arial"),
        legend.text = element_text(size = 12, face = "italic", family = "TT Arial"))

pub_page = ggarrange(plotlist = plot_list,
                     ncol = 2, nrow = 1, common.legend = TRUE, 
                     legend.grob = get_legend(plot),
                     legend = "top") 


pub_page

library(grid)
annotate_figure(pub_page, left = textGrob("Inductive Accuracy", rot = 90, vjust = 1, gp = gpar(cex = 1.3)),
                bottom = textGrob("X-Axis: Number of Pseudo-Labeled Instances", gp = gpar(cex = 1.3)),
                fig.lab.size = 80)


